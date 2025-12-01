import { Component, inject, signal, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { WalletService } from '../../services/wallet.service';

@Component({
  selector: 'app-dice',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './dice.component.html',
  styleUrl: './dice.component.scss'
})
export class DiceComponent {
  wallet = inject(WalletService);

  rollValue = signal(50.00); 
  result = signal<number | null>(null);
  
  isRolling = signal(false);
  message = signal('Scegli le probabilità e lancia!');
  
  multiplier = computed(() => {
    const chance = this.rollValue();
    if (chance <= 0) return 0;
    const mult = 98 / chance;
    return parseFloat(mult.toFixed(4));
  });

  winChance = computed(() => this.rollValue());

  roll(betInput: string) {
    if (this.isRolling()) return;
    
    // USA parseFloat PER ACCETTARE VIRGOLE (es. 0.5)
    const bet = parseFloat(betInput);
    
    if (isNaN(bet) || bet < 0.10) { 
      this.message.set('Puntata minima 0.10€!'); return; 
    }
    if (!this.wallet.placeBet(bet)) { 
      this.message.set('Saldo insufficiente!'); return; 
    }

    this.wallet.setPlaying(true);
    this.isRolling.set(true);
    this.message.set('Rolling...');

    let counter = 0;
    const interval = setInterval(() => {
      this.result.set(Math.floor(Math.random() * 10000) / 100);
      counter++;
      if(counter > 10) {
        clearInterval(interval);
        this.finalizeRoll(bet);
      }
    }, 50);
  }

  finalizeRoll(bet: number) {
    const outcome = Math.floor(Math.random() * 10000) / 100;
    this.result.set(outcome);

    if (outcome < this.rollValue()) {
      const win = bet * this.multiplier();
      // Arrotonda vincita a 2 decimali
      const finalWin = Math.floor(win * 100) / 100;
      
      this.wallet.addWinnings(finalWin);
      this.message.set(`VINTO! Uscito ${outcome}. +${finalWin.toFixed(2)}€`);
    } else {
      this.message.set(`Perso. Uscito ${outcome}. Serviva < ${this.rollValue()}`);
    }

    this.isRolling.set(false);
    this.wallet.setPlaying(false);
  }
}