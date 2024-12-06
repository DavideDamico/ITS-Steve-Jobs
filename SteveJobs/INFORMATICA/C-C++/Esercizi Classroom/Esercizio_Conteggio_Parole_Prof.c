// Data una stringa prefissata creare una funzione che conta le parole considerando le seguenti eccezioni:
// 1) la stringa può contenere spazi multipli
// 2) la stringa può avere uno spazio iniziale
// 3) la stringa può avere lunghezza nulla
// 4) la stringa può avere spazi in coda

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

void main(){
    int i, conta_a;
    bool a_trovata;
    char stringa[100] = "     oggi e' una bella     giornata ";

    a_trovata = false; //Per vedere se c'è 'a'
    // conta_a = 0; //Per contare le 'a'
    for (i = 0; i < strlen(stringa); i++){
        if (stringa[i] == 'a'){
            // conta_a++;
            a_trovata = true;
            // break; //Se voglio fermarmi alla prima 'a'
        }
    }

    if (a_trovata){
        printf("La lettera 'a' e' presente\n");
    } else {
        printf("La lettera 'a' non e' presente\n");
    }
    // printf("Il numero di a e': %d\n", conta_a);
}