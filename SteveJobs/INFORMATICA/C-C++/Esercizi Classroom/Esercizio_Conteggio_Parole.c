// Data una stringa prefissata creare una funzione che conta le parole considerando le seguenti eccezioni:
// 1) la stringa può contenere spazi multipli
// 2) la stringa può avere uno spazio iniziale
// 3) la stringa può avere lunghezza nulla
// 4) la stringa può avere spazi in coda

#include <stdio.h>

int ParoleStrng(char stringa[]){
    int i, acc = 0;
    for (i = 0; stringa[i] != '\0'; i++){
        if (i==0){
            if (stringa[0] != ' '){
                acc++;
            }
        }
        if (stringa[i] == ' ' && stringa[i + 1] != ' ' && stringa[i + 1] != '\0'){
            acc++;
        }
    };
    return acc;
}

int main(){
    char stringa[100] = "     apelle     figlio   di   apollo    fece  una palla di pelle di pollo             ";
    int i;

    printf("Il numero di parole e': %d\n", ParoleStrng(stringa));
}