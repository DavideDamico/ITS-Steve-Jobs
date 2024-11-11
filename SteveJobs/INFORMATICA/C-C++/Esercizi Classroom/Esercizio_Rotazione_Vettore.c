// All'operatore verrà richiesto di inserire un vettore di 5 elementi  (utilizzare il #define)
// Dopo si presenterà un menù che proporrà:
// 1) Rotazione a destra del vettore
// 2) Rotazione a sinistra del vettore
// 3) Uscita

// La rotazione a destra funziona che tutti gli elementi del vettore scorrono di una posizione verso destra (verso l'indice più elevato). 
// Il valore che c'era inizialmente nell'indice più elevato verrà riportato nel valore con indice 0.

// La rotazione a sinistra funziona che tutti gli elementi del vettore scorrono di una posizione verso sinistra (verso l'indice più basso). 
// Il valore che c'era inizialmente nell'indice 0 verrà riportato nel valore con indice più alto. 

// Ogni volta che si fa la scelta 1) o 2) si stamperà il vettore ruotato

// esempio:
//  -  dato il vettore [ 1, 2, 3, 4, 5 ]  se si selezione rotazione a destra diventa  [5, 1, 2, 3, 4]
//  -  dato il vettore [ 1, 2, 3, 4, 5 ]  se si selezione rotazione a sinistra diventa  [2, 3, 4, 5, 1]

#include <stdio.h>
#define N 5

void main(){
    int valore[N];
    int i;
    int scelta;
    

    printf("Inserire i 1' valore intero: ");
    scanf("%d", &valore[0]);
    printf("Inserire i 2' valore intero: ");
    scanf("%d", &valore[1]);
    printf("Inserire i 3' valore intero: ");
    scanf("%d", &valore[2]);
    printf("Inserire i 4' valore intero: ");
    scanf("%d", &valore[3]);
    printf("Inserire i 5' valore intero: ");
    scanf("%d", &valore[4]);
    printf("\n");


    printf("1) Rotazione a destra del vettore\n");
    printf("2) Rotazione a sinistra del vettore\n");
    printf("3) Uscita\n");
    printf("Scegli cosa fare: ");
    scanf("%d", &scelta);

    switch (scelta)
    {
    case 1:{
        int temp;
        temp = valore[N-1];
        for (i=N-1; i>0; i--) {  
            valore[i] = valore[i-1]; 
        }
        valore[0] = temp;  


        for(i=0;i<N;i++){
            printf("%d ", valore[i]);
        }
    }
        break;

    case 2:{
        int temp;
        temp = valore[0];
        for(i=0;i<N;i++){
            valore[i] = valore[i+1];
        }
        valore[4] = temp;

        for(i=0;i<N;i++){
            printf("%d ", valore[i]);
        }
    }
        break;
    
    case 3:
        break;
    }
}