// Si dichiarino due vettori VETT1 e VETT2 di numeri interi di 4 elementi. 

// Il programma
// dovrà restituire a video:
// 1)      il   VETT3 = VETT1+VETT2
// 2)      il    valore del prodotto scalare VETT1*VETT2



// Si ricorda
// che in geometria analitica, dati due vettori
// a = [a1, a2, …, an] e b = [b1, b2, …, bn],
// di definisce prodotto scalare: a * b = a1b1 + a2b2 + … + anbn.

#include <stdio.h>
#define N 4

int main(){
    int vett1[N] = {10,10,10,10};
    int vett2[N] = {1,1,1,1};
    int vett3[N];
    int i;
    int somma; 
    int accumulatore = 0;
    int prodScal;

    printf("La somma tra il primo vettore e il secondo e': ");
    for(i=0; i < N; i++){
        vett3[i] = vett1[i] + vett2[i];
        printf("%d ", vett3[i]);
    }

    printf("\n");
    
    for(i=0; i < N; i++){
        somma = vett1[i] * vett2[i];
        accumulatore += somma;
    }

    prodScal = accumulatore;
    printf("Il prodotto scalare e': %d", prodScal);
}