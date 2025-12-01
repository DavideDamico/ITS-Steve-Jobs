import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

@Component({
  selector: 'app-plinko',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './plinko.component.html',
  styleUrl: './plinko.component.scss'
})
export class PlinkoComponent {
  wallet = inject(WalletService);

  // --- CONFIGURAZIONE ESPANSA ---
  rows = 14; // Aumentato da 8 a 14
  
  // 14 righe generano 15 spazi. Ecco la nuova distribuzione con più 0.5 centrali.
  multipliers = [100, 50, 20, 10, 5, 2, 1, 0.5, 0.5, 0.5, 1, 2, 5, 10, 20, 50, 100];
  // Nota: ho messo 17 numeri per sicurezza (16 righe), ma ne useremo 15 per 14 righe.
  // Correggiamo per 14 righe esatte (15 buckets):
  // [88, 48, 28, 18, 8, 3, 1, 0.5, 0.5, 0.5, 1, 3, 8, 18, 28, 48, 88] -> Facciamo una via di mezzo pulita:
  
  finalMultipliers = [100, 25, 10, 5, 3, 1.5, 1, 0.5, 0.5, 0.5, 1, 1.5, 3, 5, 10, 25, 100];
  // Ops, l'array sopra ha 17 elementi. Per 14 righe servono 15 elementi.
  // Usiamo questo array definitivo da 15 elementi:
  currentMultipliers = [100, 20, 10, 5, 3, 1.5, 1, 0.5, 1, 1.5, 3, 5, 10, 20, 100]; 
  // Aspetta, tu volevi PIÙ 0.5. 
  // Eccolo (15 elementi):
  targetMultipliers = [50, 25, 10, 5, 3, 1, 0.5, 0.5, 0.5, 1, 3, 5, 10, 25, 50];

  ballX = signal(0);
  ballY = signal(0);
  isDropping = signal(false);
  message = signal('Scegli la puntata e lancia!');
  currentBet = 0;
  targetBucketIndex = signal<number | null>(null);

  pegRows = Array.from({ length: this.rows }, (_, i) => Array(i + 3).fill(0));

  dropBall(betInput: string) {
    if (this.isDropping()) return;
    const bet = parseInt(betInput);
    if (bet <= 0 || !this.wallet.placeBet(bet)) {
      this.message.set('Errore puntata!'); return;
    }
    if (isNaN(bet) || bet <= 0) {
      this.message.set('Puntata non valida!'); return;
    }

    this.currentBet = bet;
    this.wallet.setPlaying(true);
    this.isDropping.set(true);
    this.message.set('Plink... plink...');
    this.targetBucketIndex.set(null);

    this.ballX.set(0);
    this.ballY.set(0);

    const path: number[] = [];
    for (let i = 0; i < this.rows; i++) {
      path.push(Math.random() > 0.5 ? 1 : 0);
    }

    this.animatePath(path, 0);
  }

  animatePath(path: number[], stepIndex: number) {
    if (stepIndex >= path.length) {
      this.finishGame(path);
      return;
    }

    // --- NUOVE DIMENSIONI COMPATTE ---
    // Prima erano 30px e 50px. Riduco per far stare la piramide grande.
    const stepX = 25; // Spostamento laterale (metà larghezza cella)
    const stepY = 40; // Spostamento verticale (altezza riga)

    const currentRightMoves = path.slice(0, stepIndex + 1).filter(x => x === 1).length;
    const currentLeftMoves = (stepIndex + 1) - currentRightMoves;
    
    const nextX = (currentRightMoves - currentLeftMoves) * stepX; 
    const nextY = (stepIndex + 1) * stepY; 

    this.ballX.set(nextX);
    this.ballY.set(nextY);

    // Velocizziamo leggermente l'animazione perché il percorso è più lungo
    setTimeout(() => {
      this.animatePath(path, stepIndex + 1);
    }, 250); 
  }

  finishGame(path: number[]) {
    const rightMoves = path.filter(x => x === 1).length;
    const finalIndex = rightMoves; // 0 a 14

    this.targetBucketIndex.set(finalIndex);
    const multiplier = this.targetMultipliers[finalIndex];

    const win = Math.floor(this.currentBet * multiplier);
    if (win > 0) this.wallet.addWinnings(win);

    if (multiplier >= 10) this.message.set(`JACKPOT! ${multiplier}x (+${win}€)`);
    else if (multiplier < 1) this.message.set(`Ahi... ${multiplier}x (+${win}€)`);
    else this.message.set(`Vinto: ${multiplier}x (+${win}€)`);

    this.isDropping.set(false);
    this.wallet.setPlaying(false);
  }
}