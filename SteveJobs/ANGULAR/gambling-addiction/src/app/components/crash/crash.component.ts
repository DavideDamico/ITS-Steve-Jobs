import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

// Definiamo la struttura per ogni elemento dello storico
interface CrashResult {
  val: number;
  won: boolean;
}

@Component({
  selector: 'app-crash',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './crash.component.html',
  styleUrl: './crash.component.scss'
})
export class CrashComponent {
  wallet = inject(WalletService);

  currentMultiplier = signal(1.00);
  gameActive = signal(false);
  crashed = signal(false);
  message = signal('Punta e guarda il razzo partire!');
  
  // MODIFICA: Ora è un array di oggetti CrashResult
  history = signal<CrashResult[]>([]);

  betAmount = 0;
  crashPoint = 0;
  intervalId: any;

  startGame(betInput: string) {
const bet = parseFloat(betInput); // Legge anche i decimali
if (isNaN(bet) || bet < 0.10) {
  this.message.set('Puntata minima 0.10€!'); 
  return;
}
if (!this.wallet.placeBet(bet)) {
  this.message.set('Saldo insufficiente!'); return;
}


    this.betAmount = bet;
    this.gameActive.set(true);
    this.crashed.set(false);
    this.currentMultiplier.set(1.00);
    this.wallet.setPlaying(true);
    this.message.set('In salita...');

    this.crashPoint = this.generateCrashPoint();
    console.log('Crash Point:', this.crashPoint);

    this.intervalId = setInterval(() => {
      this.currentMultiplier.update(v => v * 1.008);
      
      // Controllo Crash
      if (this.currentMultiplier() >= this.crashPoint) {
        this.crash();
      }
    }, 50);
  }

  cashOut() {
    if (!this.gameActive() || this.crashed()) return;

    clearInterval(this.intervalId);
    
    // Calcolo vincita
    const finalMult = this.currentMultiplier();
    const win = Math.floor(this.betAmount * finalMult);
    this.wallet.addWinnings(win);
    
    this.message.set(`RITIRATO! +${win}€`);
    this.gameActive.set(false);
    this.wallet.setPlaying(false);
    
    // MODIFICA: Aggiungo allo storico come VINTO (true)
    // Registro il moltiplicatore a cui sei uscito
    this.addToHistory(finalMult, true);
  }

  crash() {
    clearInterval(this.intervalId);
    this.crashed.set(true);
    
    // Mostriamo il punto esatto di crash
    this.currentMultiplier.set(this.crashPoint);
    
    this.message.set('CRASHED! Hai aspettato troppo.');
    this.gameActive.set(false);
    this.wallet.setPlaying(false);
    
    // MODIFICA: Aggiungo allo storico come PERSO (false)
    this.addToHistory(this.crashPoint, false);
  }

  // MODIFICA: Accetta val e won
  addToHistory(val: number, won: boolean) {
    this.history.update(h => [{ val, won }, ...h].slice(0, 10)); // Tiene ultimi 10
  }

  generateCrashPoint(): number {
    const r = Math.random();
    if (r < 0.03) return 1.00; 
    let point = 1.0 + (Math.floor(Math.random() * 200) / 10) * Math.random();
    if (Math.random() > 0.95) point += 10;
    return parseFloat(point.toFixed(2));
  }
}