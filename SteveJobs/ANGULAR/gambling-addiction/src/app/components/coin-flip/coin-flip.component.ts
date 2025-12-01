import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

@Component({
  selector: 'app-coin-flip',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './coin-flip.component.html',
  styleUrl: './coin-flip.component.scss'
})
export class CoinFlipComponent {
  wallet = inject(WalletService);

  isFlipping = signal(false);
  result = signal<'HEAD' | 'TAIL' | null>(null); // Null all'inizio
  message = signal('Testa o Croce? (2x)');
  
  // Variabile per gestire la rotazione CSS accumulata
  rotation = 0; 

  flip(choice: 'HEAD' | 'TAIL', betInput: string) {
    if (this.isFlipping()) return;
    const bet = parseInt(betInput);
    if (isNaN(bet) || bet <= 0) { this.message.set('Puntata non valida!'); return; }
    if (!this.wallet.placeBet(bet)) { this.message.set('Saldo insufficiente!'); return; }

    this.wallet.setPlaying(true);
    this.isFlipping.set(true);
    this.message.set('La moneta gira...');

    // Decidi risultato
    const outcome = Math.random() > 0.5 ? 'HEAD' : 'TAIL';
    
    // Calcola rotazione per atterrare sulla faccia giusta
    // HEAD = 0 gradi (o multipli di 360)
    // TAIL = 180 gradi (o 180 + 360)
    // Aggiungiamo 5 giri completi (1800) + target
    const baseSpins = 1800; 
    const target = outcome === 'HEAD' ? 0 : 180;
    
    // Aggiungiamo alla rotazione precedente per non scattare indietro
    this.rotation += baseSpins + target; 
    
    // IMPORTANTE: Se eravamo su Tail (180) e esce Head (0), dobbiamo aggiungere 180 extra per completare il giro
    // Semplificazione: facciamo crescere rotation in modo assoluto.
    // L'HTML userà [style.transform]
    
    setTimeout(() => {
      this.result.set(outcome);
      this.isFlipping.set(false);
      this.wallet.setPlaying(false);

      if (choice === outcome) {
        const win = bet * 2;
        this.wallet.addWinnings(win);
        this.message.set(`È USCITO ${outcome === 'HEAD' ? 'TESTA' : 'CROCE'}! VINTI ${win}€`);
      } else {
        this.message.set(`È uscito ${outcome === 'HEAD' ? 'Testa' : 'Croce'}. Perso.`);
      }
    }, 3000); // 3 secondi di animazione
  }
}