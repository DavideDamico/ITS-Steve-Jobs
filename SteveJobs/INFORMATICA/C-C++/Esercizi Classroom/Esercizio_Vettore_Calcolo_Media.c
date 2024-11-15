// Dato un vettore precaricato di 10 elementi (si usi il #define N 10) si vuole generare il vettore calcolato come segue:
// ogni elemento del vettore calcolato è la media di 5 elementi , l’elemento i-esimo è dato dalla media dei seguenti 5 elementi: vett[i-2] vett[i-1] vett[i] vett[i+1] vett[i+2]
// gli elementi che sono fuori dal vettore sono da considerarsi nulli
// Si pensi il programma per N generico

#include <stdio.h>
#define N 10

int main(){

    int vett[N] = {7,5,2,6,5,1,0,5,9,1};
    float vettCalcolato[N] = {0};
    int i;

    for(i = 0; i < N; i++){
        if (i==0){
            vettCalcolato[i]= (vett[i]+vett[i+1]+vett[i+2])/5.0;
        } else if (i==1){
            vettCalcolato[i]= (vett[i-1]+vett[i]+vett[i+1]+vett[i+2])/5.0;
        } else if (i >= 2 && i <= N-3){
            vettCalcolato[i]= (vett[i-2]+vett[i-1]+vett[i]+vett[i+1]+vett[i+2])/5.0;
        } else if (i==N-2){
            vettCalcolato[i]= (vett[i-2]+vett[i-1]+vett[i]+vett[i+1])/5.0;
        } else if (i==N-1){
            vettCalcolato[i]= (vett[i-2]+vett[i-1]+vett[i])/5.0;
        } 
    } 
    for(i = 0; i < N; i++){
        printf("%.1f \n", vettCalcolato[i]);
    }
}