// Dato un vettore precaricato di 10 elementi, implementare l'algoritmo
// Selection sort e stampare via via il vettore ad ogni giro di scansione alla ricerca del minimo

#include <stdio.h>
#define N 10

int main(){
    int vett[N] = {5,2,7,8,1,6,9,0,3,4};
    int i,j;
    int temp;

    temp = vett[0];
    
    printf("Vettore iniziale: ");
    for(i=0; i<N; i++){
        printf("%d ", vett[i]);
    }

    printf("\n");
    printf("\n");
    
    for(i=0; i<N-1; i++){
        for(j=i+1; j<N; j++){
            if(vett[j] < vett[i]){
                temp = vett[i];
                vett[i] = vett[j];
                vett[j] = temp;
            }
        }
        for(j=0; j<N; j++){
            printf("%d ", vett[j]);
        }
    printf("\n");
    }
}