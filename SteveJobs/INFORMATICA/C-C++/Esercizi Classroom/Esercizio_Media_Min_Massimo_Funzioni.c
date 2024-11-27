// Scrivere un programma che utilizzi le funzioni per il calcolo della media, del minino e del massimo. 
// Il programma chiederà di inserire 5 valori che verranno memorizzati in un vettore.
// Successivamente verrà proposto il seguente menù:

// 1) Calcola Media
// 2) Calcola Minino
// 3) Calcola Massimo
// 4) Esci

// Effettuando la scelta il programma richiamerà la funzione relativa e stamperà il risultato e ripresenterà il menù

#include <stdio.h>
#define N 5

float media(int vett[N]){
    int i;
    int somma = 0;
    float media;
    for (i=0; i < N; i++){
        somma += vett[i];
    }
    return media = (float)somma / N;
}

int minimo(int vett[N]){
    int i;
    int minimo;
    for (i=0; i < N; i++){
        if (i==0){
            minimo = vett[i];
        } else {
            if (vett[i] < minimo){
                minimo = vett[i];
            }
        }
    }
    return minimo;
}

int massimo(int vett[N]){
    int i;
    int massimo;
    for (i=0; i < N; i++){
        if (i==0){
            massimo = vett[i];
        } else {
            if (vett[i] > massimo){
                massimo = vett[i];
            }
        }
    }
    return massimo;
}

int main(){
    int i;
    int scelta;
    int vett[5];

    printf("Inserire il 1' valore intero: ");
    scanf("%d", &vett[0]);
    printf("Inserire il 2' valore intero: ");
    scanf("%d", &vett[1]);
    printf("Inserire il 3' valore intero: ");
    scanf("%d", &vett[2]);
    printf("Inserire il 4' valore intero: ");
    scanf("%d", &vett[3]);
    printf("Inserire il 5' valore intero: ");
    scanf("%d", &vett[4]);
    printf("\n");

    do
    {

        
        printf("***MENU***\n");
        printf("1) Calcola Media\n");
        printf("2) Calcola Minimo\n");
        printf("3) Calcola Massimo\n");
        printf("4) Esci\n");
        printf("Scegli un opzione inserendo un numero da 1 a 4: \n");
        scanf("%d", &scelta);

        switch (scelta)
        {
        case 1:
            printf("La media dei 5 elementi e': %.2f \n", media(vett));
            printf("\n");
            break;

        case 2:
            printf("Il numero minimo tra i 5 elementi e': %d \n", minimo(vett));
            printf("\n");
            break;

        case 3:
            printf("Il numero massimo tra i 5 elementi e': %d \n", massimo(vett));
            printf("\n");
            break;
        
        case 4:
            printf("Au revoir mon amour <3");
            break;
        }
    } while ( scelta != 4);
    
}