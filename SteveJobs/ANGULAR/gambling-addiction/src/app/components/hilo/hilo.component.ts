import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DeckService } from '../../services/deck.service';
import { WalletService } from '../../services/wallet.service';

@Component({
  selector: 'app-hilo',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './hilo.component.html',
  styleUrl: './hilo.component.scss'
})
export class HiloComponent {
  deckSrv = inject(DeckService);
  wallet = inject(WalletService);

  currentCard = signal<any>(null);
  nextCard = signal<any>(null); 
  deckId = '';
  
  message = signal('Inizia una nuova partita!');
  gameActive = signal(false);
  
  streak = signal(0);
  // NUOVO: Record personale
  maxStreak = signal(0);
  
  currentBet = 0;

  startGame(betInput: string) {
    const bet = parseInt(betInput);
    if (!this.wallet.placeBet(bet)) { this.message.set('Saldo insufficiente!'); return; }
    if (isNaN(bet) || bet <= 0) { 
      this.message.set('Inserisci una puntata valida!'); 
      return; 
    }
    this.currentBet = bet;
    
    // FIX: Resettiamo visivamente le carte per non vedere quella vecchia
    this.currentCard.set(null); 
    this.nextCard.set(null);
    
    this.wallet.setPlaying(true);
    this.gameActive.set(true);
    this.streak.set(0);
    this.message.set('ALTA o BASSA? (Il pareggio vince!)');

    this.deckSrv.newDeck().subscribe(res => {
      this.deckId = res.deck_id;
      this.drawFirstCard();
    });
  }

  drawFirstCard() {
    this.deckSrv.drawCard(this.deckId, 1).subscribe(res => {
      this.currentCard.set(res.cards[0]);
    });
  }

  guess(direction: 'HIGH' | 'LOW') {
    if (!this.gameActive()) return;

    this.deckSrv.drawCard(this.deckId, 1).subscribe(res => {
      const newCard = res.cards[0];
      this.nextCard.set(newCard);

      const oldVal = this.getValue(this.currentCard().value);
      const newVal = this.getValue(newCard.value);

      let win = false;
      if (direction === 'HIGH' && newVal >= oldVal) win = true; 
      if (direction === 'LOW' && newVal <= oldVal) win = true;  
      
      if (win) {
        this.streak.update(s => s + 1);
        
        // Aggiorna Max Streak se necessario
        if (this.streak() > this.maxStreak()) {
          this.maxStreak.set(this.streak());
        }

        const winAmount = Math.floor(this.currentBet * 0.5); 
        this.wallet.addWinnings(winAmount);
        this.message.set(`GIUSTO! +${winAmount}€`);
        
        setTimeout(() => {
          this.currentCard.set(newCard);
          this.nextCard.set(null);
        }, 1000);

      } else {
        this.message.set(`SBAGLIATO! Era ${newCard.value}. Hai perso.`);
        this.gameActive.set(false);
        this.wallet.setPlaying(false);
      }
    });
  }

  getValue(val: string): number {
    if (val === 'ACE') return 14; 
    if (val === 'KING') return 13;
    if (val === 'QUEEN') return 12;
    if (val === 'JACK') return 11;
    if (val === '0' || val === '10') return 10;
    return parseInt(val);
  }
}