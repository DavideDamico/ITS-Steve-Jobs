// Data una stringa di testo predefinita (anche con spazi multipli, e anche con spazi iniziali e finali) scrivere un programma in 
// C in grado di stampare le singole parole individuate nella stringa, una per ogni riga. 
// Esempio "Facciamo insieme questo esercizio" stamperà:
// Facciamo
// insieme
// questo
// esercizio

#include <stdio.h>
#include <string.h>
#include <stdbool.h>

void main(){
    int i;
    bool spazio_trovato;
    char stringa[100] = "     facciamo insieme questo     esercizio ";
    char parola[100];

    spazio_trovato = false;
    for (i = 0; i < strlen(stringa); i++){
        if (stringa[i] == ' '){
            if (spazio_trovato){
                printf("%s\n", parola);
                spazio_trovato = false;
            }
        } else {
            spazio_trovato = true;
            printf("%c", stringa[i]);
        }
    }
    if (spazio_trovato){
        printf("%s\n", parola);
    }
}