import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

@Component({
  selector: 'app-monopoly',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './monopoly.component.html',
  styleUrl: './monopoly.component.scss'
})
export class MonopolyComponent {
  wallet = inject(WalletService);
  
  // LOGICA A GRIGLIA AGGIORNATA (4R e 8R)
  outcomesGrid = [
    1, 2, 1, 5, 
    1, 2, 1, 10, 
    1, 2, 1, '4R', // Era 2R
    1, 5, '8R', 1  // Era 4R
  ];

  bets: { [key: string]: number } = {};
  
  activeIndex = signal<number | null>(null);
  isSpinning = signal(false);
  message = signal('Scegli i numeri e premi GIOCA');
  lastResult = signal<any>('?');
  bonusDice = signal<number[]>([]);
  history = signal<any[]>([]);

  addBet(outcome: string | number, amountInput: string) {
    if (this.isSpinning()) return;
    const amount = parseInt(amountInput);
    if (isNaN(amount) || amount <= 0) return;
    const key = outcome.toString();
    if (!this.bets[key]) this.bets[key] = 0;
    this.bets[key] += amount;
    
  }

  clearBets() {
    if (this.isSpinning()) return;
    this.bets = {};
    this.message.set('Puntate annullate.');
  }

  getTotalBet() {
    let sum = 0;
    for (let k in this.bets) sum += this.bets[k];
    return sum;
  }
  
  getBetAmount(key: any): number { return this.bets[key.toString()] || 0; }

  spin() {
    const total = this.getTotalBet();
    if (total === 0) { this.message.set('Punta almeno su un numero!'); return; }
    if (!this.wallet.placeBet(total)) { this.message.set('Saldo insufficiente!'); return; }

    this.wallet.setPlaying(true);
    this.isSpinning.set(true);
    this.message.set('Estrazione in corso...');
    this.bonusDice.set([]);
    this.lastResult.set('...');

    const winningIndex = Math.floor(Math.random() * this.outcomesGrid.length);
    const result = this.outcomesGrid[winningIndex];

    let currentIndex = 0;
    let speed = 50; 
    let rounds = 0; 
    const minRounds = 3; 

    const runStep = () => {
      this.activeIndex.set(currentIndex);

      if (rounds >= minRounds && currentIndex === winningIndex && speed > 300) {
        this.finishGame(result);
        return; 
      }

      currentIndex++;
      if (currentIndex >= this.outcomesGrid.length) {
        currentIndex = 0;
        rounds++;
      }

      if (rounds >= 2) speed += 15;
      else if (rounds >= 1) speed += 2;

      setTimeout(runStep, speed);
    };

    runStep();
  }

  finishGame(result: any) {
    this.isSpinning.set(false);
    this.lastResult.set(result);
    this.addToHistory(result);
    this.checkWin(result);
    this.wallet.setPlaying(false);
  }

  addToHistory(result: any) {
    this.history.update(h => [result, ...h].slice(0, 12));
  }

  checkWin(result: any) {
    const betAmount = this.bets[result.toString()] || 0;
    if (betAmount > 0) {
      if (typeof result === 'number') {
        const win = betAmount * result + betAmount;
        this.wallet.addWinnings(win);
        this.message.set(`USCITO ${result}! HAI VINTO ${win}€`);
      } else {
        // Logica Bonus aggiornata
        const diceCount = result === '4R' ? 4 : 8;
        this.playBonus(diceCount, betAmount);
      }
    } else {
      this.message.set(`Uscito ${result}. Ritenta!`);
    }
  }

  // Lanciamo esattamente il numero di dadi richiesto (4 o 8)
  playBonus(diceCount: number, bet: number) {
    let multiplier = 0;
    let diceLog: number[] = [];
    
    this.message.set(`BONUS GAME! Lancio ${diceCount} dadi...`);
    
    for(let i=0; i<diceCount; i++) {
      let roll = Math.floor(Math.random() * 6) + 1; // 1-6
      diceLog.push(roll);
      multiplier += roll;
    }
    
    setTimeout(() => {
        this.bonusDice.set(diceLog);
        const win = bet * multiplier;
        this.wallet.addWinnings(win);
        this.message.set(`BONUS TOTALE: ${multiplier}x. Vinti: ${win}€`);
    }, 1500);
  }
}