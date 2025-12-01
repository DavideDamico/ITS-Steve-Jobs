import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

@Component({
  selector: 'app-keno',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './keno.component.html',
  styleUrl: './keno.component.scss'
})
export class KenoComponent {
  wallet = inject(WalletService);

  // Griglia 1-40
  grid = Array.from({length: 40}, (_, i) => i + 1);
  
  selectedNumbers = signal<number[]>([]);
  drawnNumbers = signal<number[]>([]);
  
  isPlaying = signal(false);
  message = signal('Seleziona fino a 10 numeri.');
  currentBet = 0;

  toggleNumber(num: number) {
    if (this.isPlaying()) return;
    
    this.selectedNumbers.update(curr => {
      if (curr.includes(num)) return curr.filter(n => n !== num);
      if (curr.length >= 10) return curr; // Max 10
      return [...curr, num];
    });
  }

  play(betInput: string) {
    const bet = parseInt(betInput);
    // --- CONTROLLO SICUREZZA ---
    if (isNaN(bet) || bet <= 0) { this.message.set('Puntata non valida!'); return; }
    if (this.selectedNumbers().length === 0) { this.message.set('Seleziona almeno un numero!'); return; }
    if (!this.wallet.placeBet(bet)) { this.message.set('Saldo insufficiente!'); return; }

    this.currentBet = bet;
    this.isPlaying.set(true);
    this.wallet.setPlaying(true);
    this.drawnNumbers.set([]);
    this.message.set('Estrazione...');

    // Simulazione estrazione 10 numeri
    let extraction: number[] = [];
    const pool = [...this.grid]; // Copia per estrarre senza ripetizioni
    
    const interval = setInterval(() => {
      const randomIndex = Math.floor(Math.random() * pool.length);
      const drawn = pool.splice(randomIndex, 1)[0];
      
      this.drawnNumbers.update(d => [...d, drawn]);
      
      if (this.drawnNumbers().length >= 10) {
        clearInterval(interval);
        this.checkWin();
      }
    }, 200); // Un numero ogni 200ms
  }

  checkWin() {
    // Conta le corrispondenze (Hit)
    const hits = this.selectedNumbers().filter(n => this.drawnNumbers().includes(n)).length;
    const picks = this.selectedNumbers().length;

    // Tabella Pagamenti
    let multiplier = 0;
    
    if (hits === 0) multiplier = 0;
    else if (hits === picks) multiplier = 50; 
    else if (hits > picks / 2) multiplier = hits; 
    else if (hits >= 1 && picks <= 3) multiplier = 1.5; 

    if (hits >= 3) multiplier = hits * 2;
    if (hits === 1 && picks === 1) multiplier = 3;

    const win = this.currentBet * multiplier;
    
    if (win > 0) {
      this.wallet.addWinnings(win);
      this.message.set(`Indovinati ${hits}! Vinti ${win}€`);
    } else {
      this.message.set(`Indovinati ${hits}. Nessuna vincita.`);
    }

    this.isPlaying.set(false);
    this.wallet.setPlaying(false);

    // --- MODIFICA: AUTO-RESET VISIVO ---
    // Dopo 3 secondi, pulisce i numeri ESTRATTI (quelli gialli/verdi)
    setTimeout(() => {
        this.drawnNumbers.set([]); // Rimuove l'estrazione del banco
        
        // SE VUOI CANCELLARE ANCHE LA SELEZIONE DELL'UTENTE (Tornare tutto grigio),
        // togli il commento alla riga qui sotto:
        // this.selectedNumbers.set([]); 

        this.message.set('Seleziona i numeri o GIOCA di nuovo.');
    }, 2000);
  }

  isHit(num: number) {
    return this.selectedNumbers().includes(num) && this.drawnNumbers().includes(num);
  }
}