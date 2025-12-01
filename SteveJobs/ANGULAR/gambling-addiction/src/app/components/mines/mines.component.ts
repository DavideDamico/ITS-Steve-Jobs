import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

interface Tile {
  id: number;
  isMine: boolean;
  revealed: boolean;
}

@Component({
  selector: 'app-mines',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './mines.component.html',
  styleUrl: './mines.component.scss'
})
export class MinesComponent {
  wallet = inject(WalletService);

  grid: Tile[] = [];
  gameActive = signal(false);
  message = signal('Scegli mine e puntata');
  
  // Impostazioni
  mineCount = 3; // Default 3 bombe
  currentBet = 0;
  currentMultiplier = 1.0;
  
  // Suoni/Visual
  exploded = signal(false); // Se hai perso

  constructor() {
    this.resetGrid();
  }

  // Crea una griglia vuota (senza bombe assegnate ancora)
  resetGrid() {
    this.grid = Array.from({ length: 25 }, (_, i) => ({ id: i, isMine: false, revealed: false }));
    this.exploded.set(false);
  }

  startGame(betInput: string, minesInput: string) {
    const bet = parseFloat(betInput);
    const mines = parseInt(minesInput);

    if (bet <= 0 || !this.wallet.placeBet(bet)) {
      this.message.set('Saldo insufficiente o puntata non valida!'); return;
    }
    if (mines < 1 || mines > 24) {
      this.message.set('Numero mine non valido (1-24)'); return;
    }
    // --- FIX DI SICUREZZA PUNTATA ---
    if (isNaN(bet) || bet <= 0) {
      this.message.set('Puntata non valida!'); return;
    }
    
    // --- FIX DI SICUREZZA MINE ---
    if (isNaN(mines) || mines < 1 || mines > 24) {
      this.message.set('Numero mine non valido (1-24)'); return;
    }

    this.currentBet = bet;
    this.mineCount = mines;
    this.currentMultiplier = 1.0;
    this.gameActive.set(true);
    this.wallet.setPlaying(true); // Blocca popup bancarotta
    this.message.set('Trova i diamanti! 💎');
    this.resetGrid();

    // Piazza le bombe casualmente
    let minesPlaced = 0;
    while (minesPlaced < this.mineCount) {
      const idx = Math.floor(Math.random() * 25);
      if (!this.grid[idx].isMine) {
        this.grid[idx].isMine = true;
        minesPlaced++;
      }
    }
  }

  clickTile(tile: Tile) {
    if (!this.gameActive() || tile.revealed) return;

    tile.revealed = true;

    if (tile.isMine) {
      // BOOM! Hai perso
      this.gameOver(false);
    } else {
      // DIAMANTE!
      this.calculateMultiplier();
      // Se hai rivelato tutte le caselle sicure, vinci in automatico
      const safeTiles = 25 - this.mineCount;
      const revealedSafe = this.grid.filter(t => t.revealed && !t.isMine).length;
      
      if (revealedSafe === safeTiles) {
        this.cashOut();
      }
    }
  }

  calculateMultiplier() {
    // Formula semplificata per aumentare il moltiplicatore
    // Ogni diamante aumenta il rischio e il premio
    // (Moltiplicatore attuale * 1.something) basato sulle mine
    const growth = 1 + (this.mineCount / 20); 
    this.currentMultiplier *= growth;
  }

  cashOut() {
    if (!this.gameActive()) return;
    
    const win = Math.floor(this.currentBet * this.currentMultiplier);
    this.wallet.addWinnings(win);
    this.message.set(`RITIRATO! Vinti ${win}€ (${this.currentMultiplier.toFixed(2)}x)`);
    this.gameOver(true); // True = vinto
  }

  gameOver(win: boolean) {
    this.gameActive.set(false);
    this.wallet.setPlaying(false);
    
    if (!win) {
      this.exploded.set(true);
      this.message.set('BOOM! Hai perso la puntata.');
    }
    
    // Rivela tutto alla fine
    this.grid.forEach(t => t.revealed = true);
  }

  // Helper per il template per mostrare quanti soldi vinceresti ora
  getCurrentWin() {
    return Math.floor(this.currentBet * this.currentMultiplier);
  }
}