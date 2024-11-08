// Il programma richiederà all'operatore la dimensione del lato. 
// Successivamente il programma stamperà, tramite una serie di caratteri *, 
// un quadrato pieno e dopo un quadrato vuoto (cioè stamperà solo i lati del quadrato)

#include <stdio.h>

int main(){
    int i,j;
    int lato;

    printf("Quanto deve essere il lato: ");
    scanf("%d", &lato);

    for (i = 0; i < lato; i++) {
        for (j = 0; j < lato; j++) {
            printf("* ");
        }
        printf("\n");
    }

    printf("\n");

    for(i=0;i<lato;i++){
        for(j=0;j<lato;j++){
            if (i==0 || i== lato-1 || j==0 || j == lato-1){
                printf("* ");
                }
            else {
                printf("  ");
            }
        }
        printf("\n");
    }
}

 // int i,j;
    // for(i=0;i<5;i++){
    //     for(j=0;j<5;j++){
    //         printf("%c",j+65);
    //     }
    //     printf("\n");
    // }