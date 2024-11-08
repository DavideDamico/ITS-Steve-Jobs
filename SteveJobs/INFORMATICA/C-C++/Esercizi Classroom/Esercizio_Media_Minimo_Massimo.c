// All'operatore verrà richiesto di inserire 5 valori interi (che verranno memorizzati in un vettore).
// Il programma stamperà orizzontalmente il vettore.
// In seguito restituirà il valore Max, Min indicando le relative posizioni di inserimento
// Infine stamperà il valore calcolato della Media

#include <stdio.h>
#define N 5

int main(){
    int valori[N];
    int i;
    int max;
    int min;
    int posMax;
    int posMin;
    float somma = 0;
    float media;

    printf("Inserire i 1' valore intero: ");
    scanf("%d", &valori[0]);
    printf("Inserire i 2' valore intero: ");
    scanf("%d", &valori[1]);
    printf("Inserire i 3' valore intero: ");
    scanf("%d", &valori[2]);
    printf("Inserire i 4' valore intero: ");
    scanf("%d", &valori[3]);
    printf("Inserire i 5' valore intero: ");
    scanf("%d", &valori[4]);
    printf("\n");

    printf("I valori inseriti sono: ");
    for (i=0; i<N; i++){
        printf("%d ", valori[i]);
    }

    for (i=0; i<N; i++){
        if (i==0){
            max = valori[i];
            min = valori[i];
        }
        if (valori[i] > max){
            max = valori[i];
            posMax = i;
            
        }
        if (valori[i] < min){
            min = valori[i];
            posMin = i;

        }
        somma = somma + valori[i];
    }

    media = somma/N;

    printf("\n\n");
    printf("Il valore massimo e': %d alla posizione %d\n", max, posMax);
    printf("Il valore minimo e': %d alla posizione %d\n", min, posMin);
    printf("La media e': %.2f \n", media);
}