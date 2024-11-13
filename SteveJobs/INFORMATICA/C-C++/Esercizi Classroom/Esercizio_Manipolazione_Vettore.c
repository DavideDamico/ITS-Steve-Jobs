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
#define N 10

void main(){
    int vettore[N] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int vettore1[N], vettore2[N], vettore3[N];
    int i, j;

}
