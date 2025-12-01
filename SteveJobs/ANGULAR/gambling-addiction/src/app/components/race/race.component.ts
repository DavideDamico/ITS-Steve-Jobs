import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WalletService } from '../../services/wallet.service';

interface Racer {
  id: number;
  name: string;
  color: string;
  progress: number;
}

@Component({
  selector: 'app-race',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './race.component.html',
  styleUrl: './race.component.scss'
})
export class RaceComponent {
  wallet = inject(WalletService);

  // ORA È UN SIGNAL PER GARANTIRE L'AGGIORNAMENTO GRAFICO
  participants = signal<Racer[]>([
    { id: 1, name: 'Cavallo 🐎', color: '#e74c3c', progress: 0 },
    { id: 2, name: 'Auto 🏎️', color: '#3498db', progress: 0 },
    { id: 3, name: 'Razzo 🚀', color: '#f1c40f', progress: 0 },
    { id: 4, name: 'Lumaca 🐌', color: '#2ecc71', progress: 0 }
  ]);

  isRacing = signal(false);
  message = signal('Punta sul tuo campione!');
  selectedRacerId = signal<number | null>(null); // Anche questo Signal
  betAmount = 0;

  selectRacer(id: number, betInput: string) {
    if (this.isRacing()) return;
    const bet = parseFloat(betInput);
    if (isNaN(bet) || bet < 0.10) return;

    this.selectedRacerId.set(id);
    this.betAmount = bet;
    
    // Trova il nome per il messaggio
    const racerName = this.participants().find(p => p.id === id)?.name;
    this.message.set(`Puntato ${bet}€ su ${racerName}`);
  }

  startRace(betInput: string) {
    const bet = parseFloat(betInput);
    
    if (isNaN(bet) || bet < 0.10) { this.message.set('Puntata minima 0.10€!'); return; }
    if (!this.selectedRacerId()) { this.message.set('Seleziona chi vince!'); return; }
    if (!this.wallet.placeBet(bet)) { this.message.set('Saldo insufficiente!'); return; }

    this.wallet.setPlaying(true);
    this.isRacing.set(true);
    this.message.set('PARTITI!');
    
    // RESET POSIZIONI
    this.participants.update(racers => racers.map(r => ({ ...r, progress: 0 })));

    const interval = setInterval(() => {
      let winner: any = null;

      // AGGIORNA IL SIGNAL AD OGNI TICK
      this.participants.update(racers => {
        return racers.map(r => {
          // Se c'è già un vincitore, ferma tutti
          if (winner) return r;

          // Velocità variabile
          const speed = Math.random() * 1.5 + 0.2; // Minimo 0.2 per non fermarsi mai del tutto
          let newProgress = r.progress + speed;
          
          if (newProgress >= 100) {
            newProgress = 100;
            if (!winner) winner = r; // Abbiamo un vincitore!
          }
          
          return { ...r, progress: newProgress };
        });
      });

      if (winner) {
        clearInterval(interval);
        setTimeout(() => this.finishRace(winner), 500);
      }
    }, 50); 
  }

  finishRace(winner: Racer) {
    if (this.selectedRacerId() === winner.id) {
      const win = this.betAmount * 3;
      const finalWin = Math.floor(win * 100) / 100;
      this.wallet.addWinnings(finalWin);
      this.message.set(`VITTORIA! Vince ${winner.name}! +${finalWin.toFixed(2)}€`);
    } else {
      this.message.set(`Vince ${winner.name}. Hai perso.`);
    }
    
    this.isRacing.set(false);
    this.wallet.setPlaying(false);
  }
}