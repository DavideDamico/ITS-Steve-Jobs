import { Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { BlackjackComponent } from './components/blackjack/blackjack.component';
import { MonopolyComponent } from './components/monopoly/monopoly.component';
import { SlotsComponent } from './components/slots/slots.component';
import { HiloComponent } from './components/hilo/hilo.component';
import { MinesComponent } from './components/mines/mines.component'; // Nuovo
import { CrashComponent } from './components/crash/crash.component'; // Nuovo
import { PlinkoComponent } from './components/plinko/plinko.component';
import { BankerComponent } from './components/banker/banker.component';
import { RouletteComponent } from './components/roulette/roulette.component';
import { VideoPokerComponent } from './components/video-poker/video-poker.component';
import { KenoComponent } from './components/keno/keno.component';
import { RaceComponent } from './components/race/race.component';
import { CoinFlipComponent } from './components/coin-flip/coin-flip.component';
import { DiceComponent } from './components/dice/dice.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'blackjack', component: BlackjackComponent },
  { path: 'monopoly', component: MonopolyComponent },
  { path: 'slots', component: SlotsComponent },
  { path: 'hilo', component: HiloComponent },
  { path: 'mines', component: MinesComponent }, // Rotta Mines
  { path: 'crash', component: CrashComponent }, // Rotta Crash
  { path: 'plinko', component: PlinkoComponent },
  { path: 'banker', component: BankerComponent },
  { path: 'roulette', component: RouletteComponent },
  { path: 'video-poker', component: VideoPokerComponent },
  { path: 'keno', component: KenoComponent },
  { path: 'race', component: RaceComponent },
  { path: 'coin-flip', component: CoinFlipComponent },
  { path: 'dice', component: DiceComponent }
];