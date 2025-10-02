#include <stdio.h>
#include <stdlib.h>

// Struttura del nodo
struct Nodo {
    int valore;
    struct Nodo* next;
};

// Funzione per aggiungere un nodo in testa
struct Nodo* aggiungiInTesta(struct Nodo* testa, int valore) {
    struct Nodo* nuovo = (struct Nodo*) malloc(sizeof(struct Nodo));
    nuovo->valore = valore;
    nuovo->next = testa;
    return nuovo;
}

// Funzione per stampare la lista
void stampaLista(struct Nodo* testa) {
    struct Nodo* temp = testa;
    while (temp != NULL) {
        printf("%d -> ", temp->valore);
        temp = temp->next;
    }
    printf("Fine lista\n");
}

// Funzione per cercare un valore
struct Nodo* cerca(struct Nodo* testa, int valore) {
    struct Nodo* temp = testa;
    while (temp != NULL) {
        if (temp->valore == valore) {
            return temp; // trovato
        }
        temp = temp->next;
    }
    return NULL; // non trovato
}

int main() {
    struct Nodo* lista = NULL;  // lista vuota

    // aggiungo alcuni elementi
    lista = aggiungiInTesta(lista, 10);
    lista = aggiungiInTesta(lista, 20);
    lista = aggiungiInTesta(lista, 30);

    printf("Lista: ");
    stampaLista(lista);

    // cerco un valore
    int daCercare = 40;
    struct Nodo* trovato = cerca(lista, daCercare);
    if (trovato != NULL) {
        printf("Ho trovato il valore %d nella lista.\n", daCercare);
    } else {
        printf("Il valore %d non e' nella lista.\n", daCercare);
    }

    return 0;
}
