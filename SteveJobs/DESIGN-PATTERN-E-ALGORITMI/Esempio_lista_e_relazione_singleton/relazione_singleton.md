# Relazione sul Design Pattern Singleton

**Definizione:**  
Il pattern Singleton serve a fare in modo che una classe abbia una sola istanza (cioè un solo oggetto creato) e che sia accessibile da tutte le parti del programma.

**Perché serve:**  
In alcuni casi non ha senso avere più copie di un oggetto. Per esempio:

- un gestore delle impostazioni del programma
- un logger che scrive messaggi di debug
- un accesso a un file o al database

Con il Singleton, ci assicuriamo che ci sia sempre e solo **uno** di questi oggetti.

---

## Come funziona

Normalmente in C o C++ quando facciamo una funzione che crea un oggetto, possiamo chiamarla più volte e ottenere tante copie diverse.  
Con il Singleton invece la prima volta che si crea l’oggetto, lo memorizziamo in una variabile globale o statica. Le volte successive restituiamo sempre la stessa.

---

## Vantaggi

- C’è una sola istanza, quindi il programma è più ordinato.
- Possiamo accedere facilmente all’oggetto da più punti.

## Svantaggi

- Se usato male diventa come una “variabile globale gigante”, e rende il codice difficile da modificare o testare.

---

## Esempio in C

```c
#include <stdio.h>
#include <stdlib.h>

// Struttura di configurazione (esempio)
struct Config {
    int valore;
};

// Puntatore all'istanza unica
struct Config* istanza = NULL;

// Funzione che restituisce sempre la stessa istanza
struct Config* getInstance() {
    if (istanza == NULL) {
        istanza = (struct Config*) malloc(sizeof(struct Config));
        istanza->valore = 0; // valore di default
    }
    return istanza;
}

int main() {
    struct Config* c1 = getInstance();
    struct Config* c2 = getInstance();

    c1->valore = 42;
    printf("Valore in c2: %d\n", c2->valore); // stampa 42, perché è la stessa istanza

    return 0;
}
```
