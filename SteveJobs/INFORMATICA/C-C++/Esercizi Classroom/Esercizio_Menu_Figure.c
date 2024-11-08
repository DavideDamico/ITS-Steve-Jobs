#include <stdio.h>

//Creare un programma con quattro scelte:
// 1) disegna un quadrato pieno
// 2) disegna un quadrato vuoto
// 3) disegna un triangolo rettangolo pieno
// 4) disegna un quadrato semipieno (tipo bicchiere)

// Il programma richiederà di inserire il lato

// utilizzare la struttura switch

int main(){
    int scelta;
    int i,j;
    int lato;
    
    printf("1) disegna un quadrato pieno\n");
    printf("2) disegna un quadrato vuoto\n");
    printf("3) disegna un triangolo rettangolo pieno\n");
    printf("4) disegna un quadrato semipieno (tipo bicchiere)\n");
    printf("------------------------------------------------------\n");
    printf("Inserisci la tua scelta: ");
    scanf("%d", &scelta);
    printf("Inserisci quanto deve essere il lato: ");
    scanf("%d", &lato);

    switch (scelta)
    {
        case 1:
            for (i = 0; i < lato; i++) {
                for (j = 0; j < lato; j++) {
                    printf("* ");
                }
                printf("\n");
            }
            break;

        case 2:
            for(i=0;i<lato;i++){
                for(j=0;j<lato;j++){
                    if (i == 0 || i == lato-1 || j == 0 || j == lato-1){
                        printf("* ");
                    }
                    else {
                        printf("  ");
                    }
                }
                printf("\n");
            } 
            break;

        case 3:
            for(i=0;i<lato;i++){
                for(j=0;j<i;j++){
                        printf("*");
                }
            printf("\n");
        }
        break;

        case 4:
            for(i=0;i<lato;i++){
                for(j=0;j<lato;j++){
                    if (i == 0 || i == lato-1 || i == lato-2 || i == lato-3 || i == lato-4 || i == lato-5 || j == 0 || j == lato-1 ){
                        printf("* ");
                    } else {
                        printf("  ");
                    }
                }
                printf("\n");
        }
    }
}