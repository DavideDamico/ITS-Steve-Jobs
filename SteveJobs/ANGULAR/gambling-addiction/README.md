# 🎰 Gambling Addiction - Angular Project

Questo progetto è una simulazione di un Casinò online realizzata interamente con **Angular (versione moderna)**.
L'obiettivo è dimostrare l'uso di **Signals**, **Standalone Components**, **Control Flow** (`@if`, `@for`) e la gestione dello stato centralizzata tramite **Services**.

## 🛠 Tecnologie Chiave
* **Angular Standalone Components:** Nessun `NgModule`, architettura più leggera.
* **Angular Signals:** Utilizzati per la gestione reattiva dello stato (saldo, animazioni, input).
* **RxJS & HttpClient:** Per il consumo dell'API esterna (Deck of Cards).
* **SCSS:** Per animazioni avanzate (3D, transizioni, effetti neon).
* **TypeScript:** Logica di gioco complessa e tipizzazione forte.

---

## 🏛 Architettura del Progetto

### 1. `WalletService` (Il cuore pulsante)
Gestisce il saldo globale dell'utente.
* **Perché un Service?** Per condividere i dati tra componenti diversi (es. vinco alla Slot, il saldo si aggiorna nella Navbar).
* **Pattern Singleton:** Essendo `providedIn: 'root'`, esiste una sola istanza del portafoglio per tutta l'app.
* **Sicurezza:** Gestisce l'arrotondamento dei decimali (`Math.floor * 100`) e impedisce puntate se il saldo è insufficiente o se un gioco è in corso (`gameInProgress` signal).

### 2. `DeckService`
Gestisce le chiamate HTTP all'API esterna `deckofcardsapi.com`.
* Restituisce `Observable` che i componenti (Blackjack, Poker, Hi-Lo) sottoscrivono (`.subscribe`) per ricevere le carte in modo asincrono.

### 3. Gestione Errori e Bancarotta
Nel `AppComponent` c'è un controllo globale: se il saldo scende a 0 e non ci sono partite in corso, appare un **Modal di Bancarotta** che permette di ricaricare fittiziamente il conto.

---

## 🎮 Analisi Logica dei Giochi

Di seguito la spiegazione tecnica per ogni gioco, utile per rispondere alle domande del professore.

### 1. Blackjack ♠️
* **Logica:** Gestisce il punteggio delle carte. L'Asso vale 1 o 11 dinamicamente.
* **Particolarità:** Implementa il "Natural Blackjack" (pagamento 3:2 immediato) e la logica del Banco che deve "stare" a 17.
* **Sfida Tecnica:** Gestire l'asincronicità delle pescate (aspettare che arrivi la carta dall'API prima di calcolare il punteggio).

### 2. Monopoly 🎡
* **Logica:** Una griglia 4x4. Il vincitore è pre-calcolato matematicamente (`Math.random`).
* **Animazione:** Non usa `setInterval` standard, ma una funzione ricorsiva con `setTimeout` variabile per creare un effetto di "frenata" (rallenta man mano che si avvicina alla fine).
* **Bonus:** I dadi (4R/8R) sono simulati generando numeri reali da 1 a 6 e sommandoli.

### 3. Slot Machine (5x5) 🎰
* **Logica:** Genera una matrice 5x5 di stringhe (Emoji).
* **Algoritmo di Vincita:** Controlla iterativamente **5 righe** e **2 diagonali**. Usa un contatore di occorrenze consecutive per determinare se ci sono 3, 4 o 5 simboli uguali.
* **Jackpot:** C'è una piccola probabilità (forzata nel codice) di generare una matrice con tutti simboli uguali per un payout 1000x.

### 4. Hi-Lo (Alta o Bassa) ⬆️⬇️
* **Logica:** Confronta il valore numerico della carta attuale (`currentCard`) con la prossima (`nextCard`).
* **Algoritmo:** Converte le figure (J, Q, K) in numeri (11, 12, 13) per il confronto matematico. Gestisce la vittoria anche in caso di pareggio (>=).

### 5. Mines 💣
* **Logica:** Un array di oggetti `Tile`. All'inizio, X mine vengono piazzate in indici casuali.
* **Moltiplicatore:** Ogni volta che si clicca una casella "sicura", il moltiplicatore aumenta in base a una formula esponenziale.
* **Stato:** Gestisce il "Cashout" (ritiro volontario) prima di trovare una mina.

### 6. Crash 📈
* **Logica:** Un moltiplicatore (`signal`) cresce ogni 50ms.
* **Probabilità:** Il punto di crash è pre-determinato prima dell'inizio del round usando una funzione di probabilità inversa (è molto più probabile che esca un numero basso che uno alto).
* **Storico:** Usa un array per salvare gli ultimi 10 risultati, colorandoli in base alla vittoria/sconfitta.

### 7. Plinko 🟣
* **Logica (La più complessa):** Non usa un motore fisico. Pre-calcola il percorso della pallina (Sinistra/Destra) in un array.
* **Posizionamento:** Calcola le coordinate X/Y esatte sommando gli spostamenti. La pallina si muove usando CSS `transform: translate`, garantendo fluidità a 60fps.
* **Risultato:** L'indice del secchio finale è matematicamente uguale alla somma dei movimenti a destra.

### 8. The Banker (Affari Tuoi) 💼
* **Logica:** Gestisce un array di pacchi con valori nascosti.
* **Algoritmo Offerta:** Calcola la media dei valori rimasti (`reduce / length`) e offre una percentuale di quella media (bassa all'inizio, alta alla fine) per simulare la psicologia del banchiere.

### 9. Roulette 🔴⚫
* **Animazione:** Usa la tecnica del "Selettore Luminoso". Invece di ruotare fisicamente, un indice (`activeIndex`) scorre sull'array dei numeri.
* **Logica:** I numeri sono ordinati (0-36). L'algoritmo calcola esattamente dove fermarsi per far coincidere l'animazione col risultato RNG.

### 10. Video Poker 🃏
* **Logica Pura:** È il gioco con più algoritmi.
    * Riconosce i punti analizzando *Ranks* e *Suits*.
    * Ordina le carte per cercare le scale (`ranks[i] === ranks[i-1] + 1`).
    * Usa mappe di frequenza per trovare Coppie, Tris e Poker.

### 11. Keno 🔢
* **Logica:** Confronto tra due array: `selectedNumbers` (utente) e `drawnNumbers` (banco).
* **Funzione:** `filter` e `includes` per contare quante corrispondenze ("Hits") ci sono.

### 12. Virtual Race 🏇
* **Animazione:** Ogni partecipante ha una barra di progresso.
* **Loop:** Un `setInterval` aumenta la barra di una quantità casuale ad ogni tick. Questo rende la gara imprevedibile fino all'ultimo millisecondo.
* **CSS:** Usa `transform: translateX(-100%)` per far sì che l'icona del corridore tocchi il traguardo con la "punta" e non col centro.

---

## 🎓 Q&A - Domande Possibili del Professore

**D: Perché hai usato i `Signals` invece delle variabili normali o `RxJS`?**
> **R:** I Signals sono il nuovo standard di Angular. Offrono una reattività più fine ("fine-grained reactivity") rispetto a Zone.js. Quando un Signal cambia, Angular aggiorna *solo* la parte di DOM interessata, migliorando le prestazioni rispetto al vecchio Change Detection che controllava tutto l'albero dei componenti. Inoltre, rendono il codice più pulito senza bisogno di gestire troppe sottoscrizioni asincrone manuali.

**D: Come gestisci la sicurezza dei dati (es. puntate negative)?**
> **R:** Ho implementato controlli rigorosi nel `WalletService` e all'inizio di ogni metodo `play/spin`. Uso `parseFloat` per gestire i decimali e verifico sempre `isNaN(bet) || bet <= 0`. Inoltre, uso una variabile booleana `gameInProgress` per impedire click multipli o reset mentre un'animazione è attiva.

**D: Come hai realizzato l'animazione del Plinko o della Corsa senza librerie esterne?**
> **R:** Ho sfruttato la potenza del binding di Angular (`[style.left]`, `[style.transform]`) combinato con le transizioni CSS (`transition: all 0.3s`). La logica TypeScript calcola le coordinate, e il CSS si occupa di interpolare il movimento fluidamente.

**D: Come gestisci i dati tra i vari componenti?**
> **R:** Uso la *Dependency Injection* di Angular. Il `WalletService` è un Singleton (`providedIn: 'root'`), quindi la stessa istanza viene iniettata in ogni componente. Questo permette al saldo di essere persistente mentre navigo da una pagina all'altra.

**D: Hai usato API esterne?**
> **R:** Sì, per i giochi di carte (Blackjack, Poker, Hi-Lo) uso `HttpClient` per contattare `deckofcardsapi.com`. Gestisco la risposta asincrona tramite `Observable` e `.subscribe()`. Per gli altri giochi, la logica è interamente calcolata lato client in TypeScript.