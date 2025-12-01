import { Component, inject, signal, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DeckService } from '../../services/deck.service';
import { WalletService } from '../../services/wallet.service';

interface Hand {
  cards: any[];
  bet: number;
  score: number;
  isFinished: boolean;
  message?: string;
  hasBlackjack?: boolean; // Nuovo flag per indicare se è un BJ naturale
}

@Component({
  selector: 'app-blackjack',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './blackjack.component.html',
  styleUrl: './blackjack.component.scss'
})
export class BlackjackComponent {
  deckSrv = inject(DeckService);
  walletSrv = inject(WalletService);

  deckId = '';
  playerHands = signal<Hand[]>([]);
  activeHandIndex = signal(0);
  dealerHand = signal<any[]>([]);
  dealerScore = signal(0);
  gameActive = signal(false);
  globalMessage = signal('');

  // Lo split è permesso solo se NON hai fatto Blackjack e hai due carte uguali
  canSplit = computed(() => {
    const hands = this.playerHands();
    if (hands.length !== 1) return false;
    const cards = hands[0].cards;
    // Se hai fatto Blackjack (21 con 2 carte), non puoi splittare, hai già vinto (o perso col banco)
    if (this.calcScore(cards) === 21) return false;
    
    return cards.length === 2 && this.getCardValue(cards[0]) === this.getCardValue(cards[1]);
  });

  startGame(betInput: string) {
    const bet = parseInt(betInput);
    if (!this.walletSrv.placeBet(bet)) { this.globalMessage.set('Saldo insufficiente!'); return; }
    if (isNaN(bet) || bet <= 0) { 
      this.globalMessage.set('Inserisci una puntata valida!'); 
      return; 
    }
    this.walletSrv.setPlaying(true);
    this.resetTable();
    this.gameActive.set(true);

    // Crea la mano iniziale vuota
    this.playerHands.set([{ cards: [], bet: bet, score: 0, isFinished: false, hasBlackjack: false }]);

    this.deckSrv.newDeck().subscribe(res => {
      this.deckId = res.deck_id;

      // 1. Pesca le 2 carte del GIOCATORE
      this.deckSrv.drawCard(this.deckId, 2).subscribe(resP => {
        const pCards = resP.cards;
        const pScore = this.calcScore(pCards);
        
        // Aggiorna la mano del giocatore
        this.playerHands.update(h => {
          h[0].cards = pCards;
          h[0].score = pScore;
          return [...h];
        });

        // 2. CONTROLLO BLACKJACK GIOCATORE (Asso + Figura/10)
        if (pScore === 21) {
          this.handlePlayerBlackjack(bet);
        } else {
          // Se non è Blackjack, pesca la carta del dealer e continua normalmente
          this.drawCardForDealer(1);
        }
      });
    });
  }

  // NUOVO METODO: Gestisce la logica speciale del Blackjack
  handlePlayerBlackjack(bet: number) {
    this.globalMessage.set('BLACKJACK! Controllo il banco...');
    
    // Pesca subito 2 carte per il dealer per vedere se anche lui ha BJ
    this.deckSrv.drawCard(this.deckId, 2).subscribe(resD => {
      const dCards = resD.cards;
      const dScore = this.calcScore(dCards);

      this.dealerHand.set(dCards);
      this.dealerScore.set(dScore);

      // Aggiorna stato mano giocatore
      this.playerHands.update(hands => {
        hands[0].hasBlackjack = true;
        hands[0].isFinished = true;
        return [...hands];
      });

      // CONFRONTO
      if (dScore === 21) {
        // CASO: Anche il banco ha BJ. Vince il banco (come da tua richiesta).
        this.globalMessage.set('Anche il Banco ha Blackjack. Vince il Banco.');
        // Non ridiamo soldi, la puntata è persa.
      } else {
        // CASO: Solo giocatore ha BJ. Vince 1.5x
        const winAmount = bet + (bet * 1.5); // Restituisci puntata + 1.5x vincita
        this.walletSrv.addWinnings(winAmount);
        this.globalMessage.set(`BLACKJACK! Vinci ${winAmount}€ (Pagato 3:2)`);
        
        this.playerHands.update(hands => {
          hands[0].message = 'Blackjack! 🏆';
          return [...hands];
        });
      }

      // Chiudi tutto
      this.gameActive.set(false);
      this.walletSrv.setPlaying(false);
    });
  }

  // --- I METODI SOTTO SONO RIMASTI QUASI UGUALI ---

  drawCardForHand(handIndex: number, count: number, isDouble: boolean = false) {
    this.deckSrv.drawCard(this.deckId, count).subscribe(res => {
      this.playerHands.update(hands => {
        const hand = hands[handIndex];
        hand.cards = [...hand.cards, ...res.cards];
        hand.score = this.calcScore(hand.cards);
        
        if (hand.score > 21) {
          hand.isFinished = true;
          hand.message = 'Sballato!';
          this.nextHand();
        } else if (isDouble) {
          hand.isFinished = true;
          this.nextHand();
        }
        return [...hands];
      });
    });
  }

  drawCardForDealer(count: number) {
    this.deckSrv.drawCard(this.deckId, count).subscribe(res => {
      this.dealerHand.update(h => [...h, ...res.cards]);
      this.dealerScore.set(this.calcScore(this.dealerHand()));
    });
  }

  hit() { this.drawCardForHand(this.activeHandIndex(), 1); }

  stand() {
    this.playerHands.update(hands => {
      hands[this.activeHandIndex()].isFinished = true;
      return [...hands];
    });
    this.nextHand();
  }

  doubleDown() {
    const currentHand = this.playerHands()[this.activeHandIndex()];
    if (!this.walletSrv.placeBet(currentHand.bet)) {
      this.globalMessage.set('Non hai abbastanza soldi!'); return;
    }
    this.playerHands.update(hands => {
      hands[this.activeHandIndex()].bet *= 2;
      return [...hands];
    });
    this.drawCardForHand(this.activeHandIndex(), 1, true);
  }

  split() {
    const currentHand = this.playerHands()[0];
    if (!this.walletSrv.placeBet(currentHand.bet)) {
      this.globalMessage.set('Soldi insufficienti!'); return;
    }
    const card1 = currentHand.cards[0];
    const card2 = currentHand.cards[1];
    this.playerHands.set([
      { cards: [card1], bet: currentHand.bet, score: this.calcScore([card1]), isFinished: false },
      { cards: [card2], bet: currentHand.bet, score: this.calcScore([card2]), isFinished: false }
    ]);
    this.drawCardForHand(0, 1);
    this.drawCardForHand(1, 1);
  }

  nextHand() {
    const hands = this.playerHands();
    const nextIndex = hands.findIndex((h, i) => i > this.activeHandIndex() && !h.isFinished);
    if (nextIndex !== -1) {
      this.activeHandIndex.set(nextIndex);
    } else {
      this.dealerPlay();
    }
  }

  dealerPlay() {
    const allBusted = this.playerHands().every(h => h.score > 21);
    if (allBusted) {
      this.finalizeGame();
      return;
    }
    const playLoop = () => {
      if (this.dealerScore() < 17) {
        this.drawCardForDealer(1);
        setTimeout(playLoop, 1000);
      } else {
        this.finalizeGame();
      }
    };
    playLoop();
  }

  finalizeGame() {
    const dScore = this.dealerScore();
    let totalWin = 0;
    this.playerHands.update(hands => {
      return hands.map(hand => {
        // Se la mano era già finita (es: Blackjack) ignorala
        if (hand.hasBlackjack) return hand;

        if (hand.score > 21) {
          hand.message = 'Perso (Sballato)';
        } else if (dScore > 21 || hand.score > dScore) {
          hand.message = `Vinto! (+${hand.bet * 2}€)`;
          totalWin += hand.bet * 2; // Vittoria normale 1:1 (quindi 2x totale)
        } else if (hand.score === dScore) {
          hand.message = 'Pareggio';
          totalWin += hand.bet;
        } else {
          hand.message = 'Perso';
        }
        return hand;
      });
    });
    if (totalWin > 0) this.walletSrv.addWinnings(totalWin);
    this.gameActive.set(false);
    this.globalMessage.set('Partita terminata.');
    this.walletSrv.setPlaying(false);
  }

  calcScore(hand: any[]): number {
    let score = 0, aces = 0;
    hand.forEach(c => {
      score += this.getCardNumericValue(c.value);
      if (c.value === 'ACE') aces++;
    });
    while (score > 21 && aces > 0) { score -= 10; aces--; }
    return score;
  }

  getCardNumericValue(val: string): number {
    if (['KING','QUEEN','JACK', '0'].includes(val)) return 10;
    if (val === 'ACE') return 11;
    return parseInt(val);
  }

  getCardValue(card: any) {
    return card.value.replace('KING','10').replace('QUEEN','10').replace('JACK','10').replace('0','10'); 
  }

  resetTable() {
    this.playerHands.set([]);
    this.activeHandIndex.set(0);
    this.dealerHand.set([]);
    this.dealerScore.set(0);
    this.globalMessage.set('');
  }
}