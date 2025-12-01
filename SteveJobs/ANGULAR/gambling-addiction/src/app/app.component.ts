import { Component, inject } from '@angular/core';
import { RouterOutlet, RouterLink } from '@angular/router';
import { WalletService } from './services/wallet.service';
import { CommonModule } from '@angular/common'; // Serve per @if nell'HTML

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, RouterLink, CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'gambling-addiction';
  walletService = inject(WalletService);
  
  // Funzione chiamata dal bottone del modal
  askForMoney() {
    this.walletService.refill();
  }
}