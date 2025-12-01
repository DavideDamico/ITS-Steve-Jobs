import { Injectable, signal } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class WalletService {
  balance = signal<number>(1000.00); 
  gameInProgress = signal<boolean>(false);

  placeBet(amount: number): boolean {
    if (amount < 0.10 || amount > this.balance()) return false;
    
    // Arrotondiamo per sicurezza
    const newBal = this.balance() - amount;
    this.balance.set(this.round(newBal));
    return true;
  }

  addWinnings(amount: number) {
    const newBal = this.balance() + amount;
    this.balance.set(this.round(newBal));
  }

  refill() {
    this.balance.set(1000.00);
    this.gameInProgress.set(false);
  }

  setPlaying(status: boolean) {
    this.gameInProgress.set(status);
  }

  // Funzione helper per arrotondare a 2 cifre decimali
  private round(value: number): number {
    return Math.floor(value * 100) / 100;
  }
}