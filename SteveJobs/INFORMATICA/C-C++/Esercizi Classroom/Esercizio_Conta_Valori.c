// Dato un vettore precaricato di 20 numeri interi che possono assumere valori da 0 a 9, scrivere un programma che restituisca per ogni valore le occorrenze presenti nel vettore. Il programma stamperà:
// 1)  per ogni valore 0 - 9 le occorrenze trovate nel vettore 
// 2) se vengono individuati valori fuori range stamperà il numero di valori fuori range

#include <stdio.h>

int main(){
    int vettore[20] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int occorrenze[10] = {0};
    int fuoriRange = 0;
    int i;

    for(i = 0; i < 20; i++){
        if(vettore[i] >= 0 && vettore[i] <= 9){
            occorrenze[vettore[i]]++;
        } else {
            fuoriRange++;
        }
    }

    for(i = 0; i < 10; i++){
        printf("Il valore %d e' presente %d volte\n", i, occorrenze[i]);
    }

    printf("Sono stati trovati %d valori fuori range\n", fuoriRange);

    return 0;
}