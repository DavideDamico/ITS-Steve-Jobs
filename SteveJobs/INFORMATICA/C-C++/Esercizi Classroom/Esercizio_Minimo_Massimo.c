#include <stdio.h>

int main(){
    int minimo;
    int massimo;
    int numeroIns;
    int i;

    for (i = 0;i < 8; i++){

        printf("Inserisci il %d° numero: ", i+1);
        scanf("%d", &numeroIns);

        if (i==0) {
            minimo=numeroIns;
            massimo=numeroIns;
        }
        else {
            if (numeroIns < minimo) {
            minimo=numeroIns;
            }

            if (numeroIns > massimo) {
            massimo=numeroIns;
            }
        }
    }

    printf ("Il valore minimo e': %d\n", minimo);
    printf ("Il valore massimo e': %d\n", massimo);

    return 0;
}