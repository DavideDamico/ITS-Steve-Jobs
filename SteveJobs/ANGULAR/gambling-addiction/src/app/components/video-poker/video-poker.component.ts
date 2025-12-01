import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DeckService } from '../../services/deck.service';
import { WalletService } from '../../services/wallet.service';

interface PokerCard {
  image: string;
  value: string;
  suit: string;
  held: boolean; 
}

@Component({
  selector: 'app-video-poker',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './video-poker.component.html',
  styleUrl: './video-poker.component.scss'
})
export class VideoPokerComponent {
  deckSrv = inject(DeckService);
  wallet = inject(WalletService);

  // TABELLA PAGAMENTI (Jacks or Better Standard)
  paytable = [
    { name: 'SCALA REALE', mult: 250 },
    { name: 'SCALA COLORE', mult: 50 },
    { name: 'POKER', mult: 25 },
    { name: 'FULL', mult: 9 },
    { name: 'COLORE', mult: 6 },
    { name: 'SCALA', mult: 4 },
    { name: 'TRIS', mult: 3 },
    { name: 'DOPPIA COPPIA', mult: 2 },
    { name: 'COPPIA (J+)', mult: 1 }
  ];

  hand = signal<PokerCard[]>([]);
  deckId = '';
  gameState = signal<'START' | 'DEAL' | 'DRAW'>('START');
  message = signal('Punta e vinci!');
  currentBet = 0;
  
  // Per illuminare la riga della tabella quando vinci
  lastWinName = signal<string>('');

  startGame(betInput: string) {
    const bet = parseInt(betInput);
    
    // Check Sicurezza
    if (isNaN(bet) || bet <= 0) { 
      this.message.set('Puntata non valida!'); return; 
    }
    if (!this.wallet.placeBet(bet)) { 
      this.message.set('Saldo insufficiente!'); return; 
    }

    this.currentBet = bet;
    this.wallet.setPlaying(true);
    this.lastWinName.set(''); // Reset evidenziazione
    
    this.deckSrv.newDeck().subscribe(res => {
      this.deckId = res.deck_id;
      this.drawInitialHand();
    });
  }

  drawInitialHand() {
    this.deckSrv.drawCard(this.deckId, 5).subscribe(res => {
      const cards = res.cards.map((c: any) => ({ ...c, held: false }));
      this.hand.set(cards);
      this.gameState.set('DEAL');
      this.message.set('Scegli le carte da tenere (HOLD).');
    });
  }

  toggleHold(index: number) {
    if (this.gameState() !== 'DEAL') return;
    this.hand.update(h => {
      h[index].held = !h[index].held;
      return [...h];
    });
  }

  drawCards() {
    const cardsToReplace = this.hand().filter(c => !c.held).length;
    
    if (cardsToReplace === 0) {
      this.evaluateHand(this.hand());
      return;
    }

    this.deckSrv.drawCard(this.deckId, cardsToReplace).subscribe(res => {
      this.hand.update(currentHand => {
        let drawIdx = 0;
        return currentHand.map(card => {
          if (card.held) return card;
          const newCard = res.cards[drawIdx];
          drawIdx++;
          return { ...newCard, held: false };
        });
      });
      
      this.evaluateHand(this.hand());
    });
  }

  evaluateHand(hand: PokerCard[]) {
    this.gameState.set('DRAW');
    const ranks = hand.map(c => this.getRankValue(c.value)).sort((a,b) => a-b);
    const suits = hand.map(c => c.suit);

    const isFlush = suits.every(s => s === suits[0]);
    const isStraight = this.checkStraight(ranks);
    const counts = this.getCounts(ranks);

    let winMult = 0;
    let winName = '';

    // Ordine di controllo (dal più alto al più basso)
    if (isFlush && isStraight && ranks[0] === 10) { winMult = 250; winName = 'SCALA REALE'; }
    else if (isFlush && isStraight) { winMult = 50; winName = 'SCALA COLORE'; }
    else if (counts.includes(4)) { winMult = 25; winName = 'POKER'; }
    else if (counts.includes(3) && counts.includes(2)) { winMult = 9; winName = 'FULL'; }
    else if (isFlush) { winMult = 6; winName = 'COLORE'; }
    else if (isStraight) { winMult = 4; winName = 'SCALA'; }
    else if (counts.includes(3)) { winMult = 3; winName = 'TRIS'; }
    else if (counts.filter(c => c === 2).length === 2) { winMult = 2; winName = 'DOPPIA COPPIA'; }
    else if (this.checkJacksOrBetter(ranks)) { winMult = 1; winName = 'COPPIA (J+)'; }

    if (winMult > 0) {
      const win = this.currentBet * winMult;
      this.wallet.addWinnings(win);
      this.message.set(`${winName}! Vinti ${win}€`);
      this.lastWinName.set(winName); // Evidenzia la riga
    } else {
      this.message.set('Hai perso.');
      this.lastWinName.set('');
    }
    
    this.wallet.setPlaying(false);
  }

  getRankValue(val: string): number {
    if (val === 'ACE') return 14;
    if (val === 'KING') return 13;
    if (val === 'QUEEN') return 12;
    if (val === 'JACK') return 11;
    if (val === '0' || val === '10') return 10;
    return parseInt(val);
  }

  checkStraight(ranks: number[]): boolean {
    let isNormalStraight = true;
    for (let i = 0; i < 4; i++) {
      if (ranks[i+1] !== ranks[i] + 1) isNormalStraight = false;
    }
    if (isNormalStraight) return true;
    // Scala A-2-3-4-5
    if (ranks[0] === 2 && ranks[1] === 3 && ranks[2] === 4 && ranks[3] === 5 && ranks[4] === 14) return true;
    return false;
  }

  getCounts(ranks: number[]): number[] {
    const counts: any = {};
    ranks.forEach(x => { counts[x] = (counts[x] || 0) + 1; });
    return Object.values(counts);
  }

  checkJacksOrBetter(ranks: number[]): boolean {
    const counts: any = {};
    ranks.forEach(x => { counts[x] = (counts[x] || 0) + 1; });
    for (const rank in counts) {
      if (counts[rank] === 2 && parseInt(rank) >= 11) return true;
    }
    return false;
  }

  reset() {
    this.gameState.set('START');
    this.hand.set([]);
    this.message.set('Nuova Partita');
    this.lastWinName.set('');
  }
}