// Si definisca un vettore1 N (numero pari).Dato un vettore di input N elementi preinizializzato il programma generarà tre vettori:
// 1) il primo vettore avrà i primi N/2 elementi del vettore scambiati con gli ultimi N/2 elementi del vettore .
//     Ad esempio
//     1 2 3 4 5 6 7 8 9 10  diventerà  6 7 8 9 10 1 2 3 4 5

// 2) Il secondo vettore sarà il vettore con gli elementi tutti ribaltati.
//     Ad esempio:
//     1 2 3 4 5 6 7 8 9 10  diventerà  10 9 8 7 6 5 4 3 2 1

// 3) Il terzo vettore negli elementi conterrà il valore 1 se il corrispondente elemento del vettore di input è pari, altrimenti conterrà 0
//     Ad esempio:
//     1 2 5 7 5 6 2 8 9 12  diventerà  0 1 0 0 0 1 1 1 0 1

#include <stdio.h>
#define N 8

void main(){
    int vett[N] = {0, 6, 2, 1, 5, 4, 7, 3};
    int vett1[N], vett2[N], vett3[N];
    int i, temp;

    //STAMPA VETTORE ORIGINALE
    for(i=0; i<N; i++){
        printf("%d " ,vett[i]);
    }

    printf("\n");

    // 1) il primo vettore avrà i primi N/2 elementi del vettore scambiati con gli ultimi N/2 elementi del vettore
    //     Ad esempio
    //     1 2 3 4 5 6 7 8 9 10  diventerà  6 7 8 9 10 1 2 3 4 5

    //COPIA VETTORE
    for(i=0; i<N; i++){
        vett1[i] = vett[i];
    }

    // SCAMBIO DELLE DUE META'
    temp = vett1[0];
    for(i=0; i<N/2; i++){
        temp = vett1[i];
        vett1[i] = vett1[i+N/2];
        vett1[i+N/2] = temp;
    }

    //STAMPA VETTORE
    for(i=0; i<N; i++){
        printf("%d " ,vett1[i]);
    }
    printf("\n");


    // 2) Il secondo vettore sarà il vettore con gli elementi tutti ribaltati
    //     Ad esempio:
    //     1 2 3 4 5 6 7 8  diventerà  8 7 6 5 4 3 2 1

    //COPIA VETTORE
    for(i=0; i<N; i++){
        vett2[i] = vett[i];
    }

    // RIBALTAZIONE ELEMENTI
    for(i=0; i<N; i++){
        vett2[N-1-i] = vett2[i];
    }

    //STAMPA VETTORE
    for(i=0; i<N; i++){
        printf("%d " ,vett2[i]);
    }
    printf("\n");


    // 3) Il terzo vettore negli elementi conterrà il valore 1 se il corrispondente elemento del vettore di input è pari, altrimenti conterrà 0
    //     Ad esempio:
    //     1 2 5 7 5 6 2 8 9 12  diventerà  0 1 0 0 0 1 1 1 0 1

    //COPIA VETTORE
    for(i=0; i<N; i++){
        vett3[i] = vett[i];
    }

    // CONTROLLO PARI
    for(i=0; i<N; i++){
        if(vett3[i] % 2 == 0){
            vett3[i] = 1;
        }else{
            vett3[i] = 0;
        }
    }

        //STAMPA VETTORE
    for(i=0; i<N; i++){
        printf("%d " ,vett3[i]);
    }
    printf("\n");

}
