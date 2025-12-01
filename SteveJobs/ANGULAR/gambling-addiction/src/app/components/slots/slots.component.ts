import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

@Component({
  selector: 'app-slots',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './slots.component.html',
  styleUrl: './slots.component.scss'
})
export class SlotsComponent {
  wallet = inject(WalletService);

  symbols = ['🍒', '🍋', '🍇', '🔔', '💎', '7️⃣'];
  
  rows = signal<string[][]>([
    ['❓','❓','❓','❓','❓'],
    ['❓','❓','❓','❓','❓'],
    ['❓','❓','❓','❓','❓'],
    ['❓','❓','❓','❓','❓'],
    ['❓','❓','❓','❓','❓']
  ]);

  isSpinning = signal(false);
  message = signal('Slot 5x5: Cerca il FULL SCREEN (1000x)!');
  currentBet = 0;
  winningHighlights = signal<{ [key: string]: string }>({});

  spin(betInput: string) {
    if (this.isSpinning()) return;
    const bet = parseInt(betInput);
    if (isNaN(bet) || bet <= 0) { 
      this.message.set('Inserisci una puntata valida (solo numeri)!'); 
      return; 
    }
    if (bet <= 0 || !this.wallet.placeBet(bet)) { this.message.set('Errore puntata'); return; }

    this.currentBet = bet;
    this.wallet.setPlaying(true);
    this.isSpinning.set(true);
    this.message.set('Gira...');
    this.winningHighlights.set({});

    let counter = 0;
    const interval = setInterval(() => {
      this.rows.set(this.generateRandomGrid());
      counter++;
      if (counter > 15) {
        clearInterval(interval);
        this.finalizeSpin();
      }
    }, 100);
  }

  generateRandomGrid(): string[][] {
    const grid = [];
    for(let i=0; i<5; i++) {
      const row = [];
      for(let j=0; j<5; j++) {
        row.push(this.getRandomSymbol());
      }
      grid.push(row);
    }
    return grid;
  }

  finalizeSpin() {
    let finalGrid: string[][];

    // --- LOGICA JACKPOT FORZATO ---
    // Decidiamo una probabilità (es: 1 su 100).
    // Per la presentazione scolastica mettiamo 0.05 (5%) così esce spesso!
    // In un gioco reale sarebbe 0.0001
    const jackpotChance = 0.1; 
    
    if (Math.random() < jackpotChance) {
      // JACKPOT ATTIVATO!
      const luckySymbol = this.getRandomSymbol();
      // Riempiamo la griglia con lo stesso simbolo
      finalGrid = Array(5).fill(null).map(() => Array(5).fill(luckySymbol));
    } else {
      // Normale griglia casuale
      finalGrid = this.generateRandomGrid();
    }

    this.rows.set(finalGrid);
    this.isSpinning.set(false);
    this.wallet.setPlaying(false);
    this.checkWin(finalGrid);
  }

  checkWin(grid: string[][]) {
    // 1. CONTROLLO FULL SCREEN JACKPOT (Tutto uguale)
    const firstSymbol = grid[0][0];
    const isFullJackpot = grid.every(row => row.every(cell => cell === firstSymbol));

    if (isFullJackpot) {
      const win = this.currentBet * 1000;
      this.wallet.addWinnings(win);
      this.message.set(`🎰 JACKPOT LEGGENDARIO! FULL SCREEN! +${win}€ (1000x)`);
      
      // Illuminiamo tutto di oro
      let highlights: { [key: string]: string } = {};
      for(let r=0; r<5; r++) {
        for(let c=0; c<5; c++) {
          highlights[`${r}-${c}`] = 'line-jackpot';
        }
      }
      this.winningHighlights.set(highlights);
      return; // Fermiamo qui, non serve controllare le righe singole
    }

    // --- Se non è Jackpot, controlliamo righe e diagonali normalmente ---
    let totalWin = 0;
    let winDetails: string[] = [];
    let highlights: { [key: string]: string } = {};

    // Righe
    for(let r=0; r<5; r++) {
      const row = grid[r];
      const count = this.getConsecutiveCount(row);
      if(count >= 3) {
        totalWin += this.calculateWin(row[0], count);
        winDetails.push(`Riga ${r+1}`);
        for(let c=0; c<count; c++) highlights[`${r}-${c}`] = 'line-horizontal';
      }
    }

    // Diagonali
    const diag1 = [grid[0][0], grid[1][1], grid[2][2], grid[3][3], grid[4][4]];
    const countD1 = this.getConsecutiveCount(diag1);
    if(countD1 >= 3) {
      totalWin += this.calculateWin(diag1[0], countD1);
      winDetails.push('Diag ↘');
      for(let i=0; i<countD1; i++) highlights[`${i}-${i}`] = 'line-diag-main';
    }

    const diag2 = [grid[0][4], grid[1][3], grid[2][2], grid[3][1], grid[4][0]];
    const countD2 = this.getConsecutiveCount(diag2);
    if(countD2 >= 3) {
      totalWin += this.calculateWin(diag2[0], countD2);
      winDetails.push('Diag ↙');
      for(let i=0; i<countD2; i++) highlights[`${i}-${4-i}`] = 'line-diag-anti';
    }

    this.winningHighlights.set(highlights);

    if (totalWin > 0) {
      this.wallet.addWinnings(totalWin);
      this.message.set(`VITTORIA! +${totalWin}€`);
    } else {
      this.message.set('Nessuna linea vincente.');
    }
  }

  getConsecutiveCount(line: string[]): number {
    let count = 1;
    for(let i=1; i<line.length; i++) {
      if(line[i] === line[i-1]) count++;
      else break;
    }
    return count;
  }

  calculateWin(symbol: string, count: number): number {
    let baseMultiplier = 1;
    if (symbol === '7️⃣') baseMultiplier = 5;
    else if (symbol === '💎') baseMultiplier = 3;

    let countMult = 1; 
    if (count === 4) countMult = 5;
    if (count === 5) countMult = 20;

    return this.currentBet * baseMultiplier * countMult;
  }

  getRandomSymbol() {
    return this.symbols[Math.floor(Math.random() * this.symbols.length)];
  }
  
  getHighlightClass(r: number, c: number): string {
    return this.winningHighlights()[`${r}-${c}`] || '';
  }
}