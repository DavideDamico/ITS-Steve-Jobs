import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DeckService {
  private http = inject(HttpClient);
  private apiUrl = 'https://deckofcardsapi.com/api/deck';

  // Chiede all'API un nuovo mazzo mescolato
  newDeck(): Observable<any> {
    return this.http.get(`${this.apiUrl}/new/shuffle/?deck_count=1`);
  }

  // Pesca carte dal mazzo specificato
  drawCard(deckId: string, count: number): Observable<any> {
    return this.http.get(`${this.apiUrl}/${deckId}/draw/?count=${count}`);
  }
}