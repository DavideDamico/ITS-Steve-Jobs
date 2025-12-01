import { Component, inject, signal, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

@Component({
  selector: 'app-roulette',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './roulette.component.html',
  styleUrl: './roulette.component.scss'
})
export class RouletteComponent {
  wallet = inject(WalletService);

  // Numeri ordinati 0-36
  wheelOrder = Array.from({length: 37}, (_, i) => i);
  
  history = signal<{ val: number, color: string }[]>([]);
  currentBets = signal<{ [key: string]: number }>({});
  activeIndex = signal<number>(0);
  isSpinning = signal(false);
  message = signal('Piazza le tue fiches!');
  
  totalTableBet = computed(() => {
    const bets = this.currentBets();
    return Object.values(bets).reduce((a, b) => a + b, 0);
  });

  placeChip(type: string | number, chipValueStr: string) {
    if (this.isSpinning()) return;
    const chipValue = parseInt(chipValueStr);
    
    if (isNaN(chipValue) || chipValue <= 0) return;
    if (!this.wallet.placeBet(chipValue)) {
      this.message.set('Saldo insufficiente!'); return;
    }

    const key = type.toString();
    this.currentBets.update(bets => {
      const currentAmount = bets[key] || 0;
      return { ...bets, [key]: currentAmount + chipValue };
    });
    
    this.message.set(`Aggiunti ${chipValue}€ su ${this.getLabel(type)}`);
  }

  clearTable() {
    if (this.isSpinning()) return;
    const total = this.totalTableBet();
    if (total > 0) {
      this.wallet.addWinnings(total);
      this.currentBets.set({});
      this.message.set('Tavolo pulito.');
    }
  }

  // --- LOGICA SPIN VELOCE ---
  spin(chipValueStr: string) { // Nota: parametro non usato qui ma mantenuto per compatibilità html
    if (this.isSpinning()) return;
    
    if (this.totalTableBet() === 0) {
      this.message.set('Piazza almeno una puntata!'); return;
    }

    this.wallet.setPlaying(true);
    this.isSpinning.set(true);
    this.message.set('Rien ne va plus...');

    // 1. Decidi vincitore
    const winningIndex = Math.floor(Math.random() * this.wheelOrder.length);
    const resultNumber = this.wheelOrder[winningIndex];

    // 2. Animazione OTTIMIZZATA
    let currentIndex = this.activeIndex(); 
    let speed = 30; // Partenza molto veloce (30ms)
    let rounds = 0;
    const minRounds = 1; // Basta 1 giro completo di rincorsa

    const runStep = () => {
      currentIndex++;
      if (currentIndex >= this.wheelOrder.length) {
        currentIndex = 0;
        rounds++;
      }
      
      this.activeIndex.set(currentIndex);

      // Stop Condition Aggressiva
      // Ci fermiamo se:
      // 1. Abbiamo fatto almeno 1 giro
      // 2. Siamo sul numero vincente
      // 3. La velocità è scesa abbastanza (o abbiamo fatto troppi giri di sicurezza)
      if (rounds >= minRounds && currentIndex === winningIndex) {
        if (speed > 100 || rounds > 3) { // Se è abbastanza lento (>100ms) FERMATI
          this.finishGame(resultNumber);
          return;
        }
      }

      // Rallentamento Esponenziale (Frenata brusca)
      // Solo dopo il primo giro inizia a rallentare
      if (rounds >= 1) {
        // Moltiplica la velocità per 1.15 a ogni passo (+15% più lento)
        speed = Math.floor(speed * 1.15); 
      }

      // Cap velocità massima (per evitare che si fermi per 2 secondi su un numero)
      if (speed > 300) speed = 300;

      setTimeout(runStep, speed);
    };

    runStep();
  }

  finishGame(number: number) {
    this.isSpinning.set(false);
    this.wallet.setPlaying(false);
    
    const color = number === 0 ? 'green' : (this.isRed(number) ? 'red' : 'black');
    this.addToHistory(number, color);

    this.checkWin(number);
  }

  checkWin(number: number) {
    const isRed = this.isRed(number);
    const isEven = number !== 0 && number % 2 === 0;
    const isOdd = number !== 0 && number % 2 !== 0;
    const bets = this.currentBets();
    
    let totalWin = 0;

    for (const [key, amount] of Object.entries(bets)) {
      let won = false;
      let payout = 0;

      if (key === number.toString()) { won = true; payout = 36; }
      else if (key === 'RED' && isRed) { won = true; payout = 2; }
      else if (key === 'BLACK' && !isRed && number !== 0) { won = true; payout = 2; }
      else if (key === 'EVEN' && isEven) { won = true; payout = 2; }
      else if (key === 'ODD' && isOdd) { won = true; payout = 2; }
      else if (key === '1-18' && number >= 1 && number <= 18) { won = true; payout = 2; }
      else if (key === '19-36' && number >= 19 && number <= 36) { won = true; payout = 2; }

      if (won) {
        totalWin += amount * payout;
      }
    }

    if (totalWin > 0) {
      this.wallet.addWinnings(totalWin);
      this.message.set(`USCITO ${number}! VINTI ${totalWin}€`);
    } else {
      this.message.set(`Uscito ${number}. Nessuna vincita.`);
    }
    
    this.currentBets.set({}); 
  }

  addToHistory(val: number, color: string) {
    this.history.update(h => [{ val, color }, ...h].slice(0, 12));
  }

  isRed(n: number): boolean {
    const reds = [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36];
    return reds.includes(n);
  }

  getBetAmountOn(key: string | number): number {
    return this.currentBets()[key.toString()] || 0;
  }

  getLabel(type: string | number): string {
    if(type === 'RED') return 'ROSSO';
    if(type === 'BLACK') return 'NERO';
    if(type === 0) return 'ZERO';
    return type.toString();
  }
}