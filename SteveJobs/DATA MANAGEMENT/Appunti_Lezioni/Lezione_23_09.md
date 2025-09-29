# Appunti: Insiemi, Sottoinsiemi e Prodotto Cartesiano nei Database

## 1. Insiemi in Matematica

Gli **insiemi** sono raccolte di elementi **senza ripetizioni**. Possono essere descritti in due modi principali:

- **Per elencazione**: si indicano esplicitamente tutti gli elementi.
  - Esempio: `A = {0, 1, 2, 3, 4}`
  - Questo metodo **non è scalabile**, perché diventa difficile da usare con insiemi molto grandi o infiniti.

- **Per descrizione (o proprietà)**: si descrivono le caratteristiche comuni degli elementi.
  - Esempio: `A = {x ∈ ℕ | x ≤ 4}`  
    (*L'insieme A contiene tutti i numeri naturali minori o uguali a 4*)

### L’insieme vuoto

L’**insieme vuoto** è un insieme che **non contiene alcun elemento**. Si indica con: ∅ oppure {}

Nel contesto dei **database**, un’operazione di interrogazione (query) può restituire **nessun risultato**. Questo è l’equivalente dell’insieme vuoto:

> Esempio: `SELECT * FROM utenti WHERE età > 150;`  
> **Risultato:** nessun record → `∅`

---

## 2. Sottoinsiemi

Un **sottoinsieme** è un insieme i cui elementi appartengono tutti a un altro insieme.

> Esempio:  
> A = {1, 2, 3, 4, 5, 6}  
> B = {2, 4, 6}  
> Allora: `B ⊆ A`

📌 Il simbolo `⊆` significa **"sottoinsieme di"**.

> **Interpretazione visuale:** Immagina l’insieme A come un *sacco* che contiene degli oggetti. L’insieme B è una *sacca più piccola* con alcuni di quegli oggetti.

---

## 3. Prodotto Cartesiano

Il **prodotto cartesiano** di due insiemi A e B è l’insieme di tutte le **coppie ordinate (a, b)** dove `a ∈ A` e `b ∈ B`.

### Formula:
A × B = { (a, b) | a ∈ A e b ∈ B }

> Esempio:
> - A = {1, 2, 4}  
> - B = {a, b}  
> - A × B = {(1, a), (1, b), (2, a), (2, b), (4, a), (4, b)}

Nel contesto dei **database relazionali**, il prodotto cartesiano è la **base teorica** per:

- **Join** tra tabelle
- **Associazione tra chiavi primarie e chiavi esterne**

### Caso pratico: Ordini e Prodotti

- **Tabelle**: `ordini` e `prodotti`
- A **ogni ordine** possono essere associati **più prodotti**
- La **quantità** dipende da entrambe le entità: ordine e prodotto

> Quante pizzette sono state vendute nell’ordine 1?  
> Quante nell’ordine 2?  
> → Questo richiede una combinazione ordine × prodotto → **prodotto cartesiano**

### Altro esempio:

> Abbiamo due insiemi:  
> - Giorno = {Lunedì, Martedì, ...}  
> - Classe = {1A, 2B, 3C, ...}

La combinazione **Giorno × Classe** rappresenta tutte le possibili situazioni del tipo:

- (Lunedì, 1A)  
- (Martedì, 2B)  
- (Mercoledì, 3C)  
- ...ecc.

Queste **combinazioni** sono fondamentali nei database per modellare situazioni complesse dove le entità **dipendono l'una dall'altra**.

---

## 4. Collegamento con i Database

- Ogni **tabella** ha **almeno una Primary Key (PK)**.
- Alcune tabelle hanno anche **Foreign Key (FK)** che si collegano ad altre tabelle.
- Queste relazioni sono gestite proprio tramite **insiemi** e **prodotti cartesiani**.

| Concetto | Relazione con i Database |
|---------|---------------------------|
| Insieme | Una colonna o un intero set di dati |
| Sottoinsieme | Un subset filtrato tramite una query |
| Prodotto cartesiano | Tutte le combinazioni possibili tra due insiemi (JOIN) |
| Insieme vuoto | Risultato di una query senza corrispondenze |

---

## ✅ Riepilogo

- Un **insieme** è una raccolta di elementi unici.
- Un **sottoinsieme** contiene solo elementi di un altro insieme.
- Il **prodotto cartesiano** genera combinazioni tra elementi di due insiemi.
- Nei database, questi concetti si riflettono in **tabelle, join, chiavi** e **query**.
- L’**insieme vuoto** è l’equivalente di una query senza risultati.

---

## 📌 Note aggiuntive

- Il **modello relazionale** dei database è profondamente basato sulla teoria degli insiemi.
- Le **operazioni su insiemi** come **unione**, **intersezione**, **differenza** e **prodotto cartesiano** sono alla base delle operazioni SQL.

