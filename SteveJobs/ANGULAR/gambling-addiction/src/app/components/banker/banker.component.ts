import { Component, inject, signal, computed } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

interface Box {
  id: number;
  value: number;
  opened: boolean;
  isMyBox: boolean;
}

@Component({
  selector: 'app-banker',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './banker.component.html',
  styleUrl: './banker.component.scss'
})
export class BankerComponent {
  wallet = inject(WalletService);

  // --- ECONOMIA DEL CASINÒ ---
  // In un gioco 1/18, per essere sostenibile, la somma dei moltiplicatori dovrebbe essere circa 17-18.
  // Qui siamo un po' generosi per divertimento, ma molto più severi di prima.
  private multipliers = [
    // LATO BLU (Perdita netta): 9 pacchi che ti fanno perdere quasi tutto
    0.01, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8,
    
    // LATO ROSSO (Guadagno): 
    // Nota il salto: si vince poco fino alla fine.
    1.2, 1.5, 2, 3, 5, 10, 25, 100, 500
  ];

  currentPrizes = signal<number[]>([]);
  boxes = signal<Box[]>([]);
  
  // Fasi: START -> PICK_OWN -> PLAYING -> OFFER -> END
  gameState = signal<'START' | 'PICK_OWN' | 'PLAYING' | 'OFFER' | 'END'>('START');
  
  message = signal('Il Banco è spietato. Scegli la puntata.');
  
  myBoxId = signal<number | null>(null);
  currentOffer = signal(0);
  boxesToOpen = signal(5); 
  ticketCost = 0;

  // Mostra i premi ordinati nelle sidebar
  leftPrizes = computed(() => {
    const list = this.currentPrizes().length > 0 ? [...this.currentPrizes()] : this.multipliers.map(m => m * 10);
    return list.sort((a,b) => a - b).slice(0, 9);
  });

  rightPrizes = computed(() => {
    const list = this.currentPrizes().length > 0 ? [...this.currentPrizes()] : this.multipliers.map(m => m * 10);
    return list.sort((a,b) => a - b).slice(9);
  });

  startGame(betInput: string) {
    const bet = parseInt(betInput);
    if (bet <= 0 || !this.wallet.placeBet(bet)) {
      this.message.set('Non hai abbastanza soldi per questo tavolo!'); return;
    }
    if (isNaN(bet) || bet <= 0) {
      this.message.set('Puntata non valida!'); return;
    }
    
    this.ticketCost = bet;
    this.wallet.setPlaying(true);
    
    // Calcola i premi reali (Bet * Multiplier)
    // Esempio: Punti 10€. Pacco Max = 5000€. Pacco Min = 0.10€.
    const calculatedPrizes = this.multipliers.map(m => Math.floor(bet * m * 100) / 100); // Arrotonda a 2 decimali
    this.currentPrizes.set(calculatedPrizes);

    // Crea i pacchi
    const shuffledPrizes = [...calculatedPrizes].sort(() => Math.random() - 0.5);
    const newBoxes = shuffledPrizes.map((val, index) => ({
      id: index + 1,
      value: val,
      opened: false,
      isMyBox: false
    }));
    
    this.boxes.set(newBoxes);
    this.gameState.set('PICK_OWN');
    this.message.set('Scegli il tuo pacco! Spera che ci sia il 500x...');
    this.boxesToOpen.set(5);
  }

  resetGame() {
    this.gameState.set('START');
    this.boxes.set([]);
    this.currentPrizes.set([]);
    this.myBoxId.set(null);
    this.message.set('Nuova partita. Sfida il Dottore.');
    this.wallet.setPlaying(false);
  }

  clickBox(box: Box) {
    if (box.opened) return;

    // FASE 1: Scelta iniziale
    if (this.gameState() === 'PICK_OWN') {
      this.boxes.update(curr => {
        curr[box.id - 1].isMyBox = true;
        curr[box.id - 1].opened = true; // "Aperto" logicamente (non cliccabile), ma valore nascosto
        return [...curr];
      });
      this.myBoxId.set(box.id);
      this.gameState.set('PLAYING');
      this.message.set(`Hai il pacco ${box.id}. Elimina ${this.boxesToOpen()} pacchi.`);
      return;
    }

    // FASE 2: Eliminazione pacchi
    if (this.gameState() === 'PLAYING') {
      // Apri e mostra il valore
      this.boxes.update(curr => {
        curr[box.id - 1].opened = true;
        return [...curr];
      });

      this.boxesToOpen.update(v => v - 1);

      if (this.boxesToOpen() === 0) {
        this.makeOffer();
      } else {
        // Se rimangono solo 2 pacchi (il mio + 1), forza il finale
        const remaining = this.boxes().filter(b => !b.opened || b.isMyBox).length; 
        if (remaining <= 2 && this.boxesToOpen() === 0) {
             this.makeOffer();
        }
      }
    }
  }

  // --- IL CUORE DEL GIOCO: ALGORITMO DELL'OFFERTA ---
  makeOffer() {
    const remainingValues = this.boxes()
      .filter(b => (!b.opened) || b.isMyBox)
      .map(b => b.value);

    // Se è l'ultimo, si apre automaticamente
    if (remainingValues.length === 1) {
      this.endGame(remainingValues[0]);
      return;
    }

    // 1. Calcola la media matematica (Expected Value)
    const sum = remainingValues.reduce((a, b) => a + b, 0);
    const avg = sum / remainingValues.length;
    
    // 2. Calcola il "Fattore Tirchieria" del Dottore
    // Più pacchi ci sono, meno ti offre (per farti rischiare).
    // 18 pacchi totali.
    // Inizio gioco (13 rimasti): Offre il 30% della media.
    // Fine gioco (2 rimasti): Offre il 90% della media.
    const totalBoxes = 18;
    const remainingCount = remainingValues.length;
    
    // Formula progressiva: (18 - rimasti) / 18 -> va da 0 a 1 man mano che il gioco avanza
    const progress = (totalBoxes - remainingCount) / totalBoxes; 
    
    // Percentuale offerta: parte da 0.30 (30%) e arriva a max 0.90 (90%)
    let offerPercent = 0.30 + (progress * 0.60);
    
    // Piccola variazione casuale per sembrare umano (+/- 5%)
    offerPercent += (Math.random() * 0.1) - 0.05;

    const offer = Math.floor(avg * offerPercent);
    
    this.currentOffer.set(offer);
    this.gameState.set('OFFER');
    this.message.set(`Media reale: ${Math.floor(avg)}€. Offerta Dottore:`);
  }

  deal(choice: 'DEAL' | 'NO_DEAL') {
    if (choice === 'DEAL') {
      const win = this.currentOffer();
      this.wallet.addWinnings(win);
      this.message.set(`AFFARE FATTO! Vinti ${win}€ (Pacco aveva: ${this.getMyBoxValue()}€)`);
      this.gameState.set('END');
      this.revealAll();
      this.wallet.setPlaying(false);
    } else {
      this.gameState.set('PLAYING');
      
      const remaining = this.boxes().filter(b => !b.opened || b.isMyBox).length;
      let nextRound = 3;
      if (remaining <= 8) nextRound = 2;
      if (remaining <= 4) nextRound = 1; // Finale colpo su colpo
      
      // Se siamo alla fine (2 pacchi), andiamo allo showdown
      if (remaining === 2) {
         const myVal = this.getMyBoxValue();
         this.endGame(myVal);
         return;
      }

      this.boxesToOpen.set(nextRound);
      this.message.set(`Coraggioso! Elimina altri ${nextRound} pacchi.`);
    }
  }

  endGame(finalValue: number) {
    this.wallet.addWinnings(finalValue);
    this.message.set(`FINE GIOCO! Il tuo pacco conteneva: ${finalValue}€`);
    this.gameState.set('END');
    this.revealAll();
    this.wallet.setPlaying(false);
  }

  revealAll() {
    this.boxes.update(bs => bs.map(b => ({...b, opened: true})));
  }

  getMyBoxValue(): number {
    return this.boxes().find(b => b.isMyBox)?.value || 0;
  }

  isValueGone(val: number): boolean {
    // Un valore è andato se il box è aperto E non è il mio
    // Attenzione: i valori float (es 0.5) possono dare problemi di confronto, usiamo tolleranza o confronto stretto se generati uguali
    return this.boxes().some(b => Math.abs(b.value - val) < 0.001 && b.opened && !b.isMyBox);
  }
}