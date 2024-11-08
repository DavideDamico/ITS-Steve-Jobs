// Scrivere un programma in C che presenti il seguente menù:
// 1) Calcolare la media di due valori
// 2) Scambiare i due valori memorizzati nelle variabili
// 3) Dati i due valori dei cateti di un triangolo rettangolo, calcolare il valore dell'ipotenusa 
// 4) Dati due valori verificare se sono uguali altrimenti indicare il maggiore dei due
// Se la scelta è errata si ripresenta il menù
// L'operatore sceglierà le voci di menù e successivamente il programma richiederà i due valori per potere effettuare i calcoli

#include <stdio.h>
#include <math.h>

int main(){

    int scelta;
    int valore1, valore2;
    int media;
    char input;

    do {
        printf("Scegli una delle seguenti opzioni:\n");
        printf("1) Calcolare la media di due valori\n");
        printf("2) Scambiare i due valori memorizzati nelle variabili\n");
        printf("3) Dati i due valori dei cateti di un triangolo rettangolo, calcolare il valore dell'ipotenusa\n");
        printf("4) Dati due valori verificare se sono uguali altrimenti indicare il maggiore dei due\n");        
        printf("Inserisci la tua scelta: ");

        input = getchar();
        // Controlla se l'input è un numero
        if (input >= '0' && input <= '9') {
            scelta = input - '0'; // Converti il carattere in numero
        } else {
            printf("Input non valido. Inserisci un numero.\n");
            // Pulisci il buffer di input
            while (getchar() != '\n');
            scelta = 0; // Imposta una scelta non valida per continuare il loop
        }

        switch (scelta)
        {
        //Calcolo media
        case 1:        
            printf("Inserisci il primo valore: ");
            scanf("%d", &valore1);
            printf("Inserisci il secondo valore: ");
            scanf("%d", &valore2);
            media = (valore1 + valore2) / 2;
            printf("La media è: %d\n", media);
            break;

        //Scambio valori
        case 2: 
        {
            printf("Inserisci il primo valore: ");
            scanf("%d", &valore1);
            printf("Inserisci il secondo valore: ");
            scanf("%d", &valore2);
            int temp;
            temp = valore1;
            valore1 = valore2;
            valore2 = temp;
            printf("Il primo valore è: %d\n", valore1);
            printf("Il secondo valore è: %d\n", valore2);
            break;
        }

        //Calcolo ipotenusa
        case 3: 
        {
            printf("Inserisci il primo valore: ");
            scanf("%d", &valore1);
            printf("Inserisci il secondo valore: ");
            scanf("%d", &valore2);
            int ipotenusa;
            printf("L'ipotenusa è: %f\n", sqrt(pow(valore1, 2) + pow(valore2, 2)));
            break;
        }

        //Verifica se i valori sono uguali o no
        case 4:
            printf("Inserisci il primo valore: ");
            scanf("%d", &valore1);
            printf("Inserisci il secondo valore: ");
            scanf("%d", &valore2);
            if (valore1 == valore2) {
                printf("I valori sono uguali\n");
            } else if (valore1 > valore2) {
                printf("Il valore maggiore è: %d\n", valore1);
            } else {
                printf("Il valore maggiore è: %d\n", valore2);
            }
            break;
        
        default:
            printf("------------------------------------------------------\n");
            break;
        }
    } while (scelta < 1 || scelta > 4);
}