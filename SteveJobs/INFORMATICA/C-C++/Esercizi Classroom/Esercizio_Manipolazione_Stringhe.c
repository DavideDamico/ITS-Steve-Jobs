// Definire una stringa di 100 char inizializzata come segue: "Oggi è una bella giornata"
// 1) contare le parole e stampare il valore
// 2) sostituire le vocali con la seguente logica:
// sostituire a con e
// sostituire e con i
// sostituire i con o
// sostituire o con u
// sostituire u con a
// infine stampare la nuova stringa

#include <stdio.h>

int ParoleStrng(char stringa[]){
    int i, acc = 0;
    for (i = 0; stringa[i] != '\0'; i++){
        if (stringa[i] == ' '){
            acc++;
        }
    };
    return acc + 1;
}

int main(){
    char stringa[100] = "oggi è una bella giornata";
    int i;
    int scelta;
    int parole;

    printf("***MENU***\n");
    printf("1) contare le parole e stampare il valore\n");
    printf("2) sostituire le vocali con la seguente logica:\n");
    printf("sostituire a con e\n"
            "sostituire e con i\n"
            "sostituire i con o\n"
            "sostituire o con u\n"
            "sostituire u con a\n");
    printf("Scelta: ");
    scanf("%d", &scelta);

    switch (scelta)
    {
    case 1:
        parole = ParoleStrng(stringa);
        printf("Il numero di parole e': %d\n", parole);

        break;
    
    case 2:
        for (i = 0; stringa[i] != '\0'; i++){
            if (stringa[i] == 'a'){
                stringa[i] = 'e';
            } else if (stringa[i] == 'e'){
                stringa[i] = 'i';
            } else if (stringa[i] == 'i'){
                stringa[i] = 'o';
            } else if (stringa[i] == 'o'){
                stringa[i] = 'u';
            } else if (stringa[i] == 'u'){
                stringa[i] = 'a';
            }
        }
        printf("La nuova stringa e': %s\n", stringa);
        break;

    default:
        break;
    }
}