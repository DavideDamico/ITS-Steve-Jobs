#include <stdio.h>

int main() {
    int i;
    int voto;
    int numeroCicli;
    float media;
    float accumulatore = 0;

    printf("Inserisci il numero di voti da mediare: ");
    scanf("%d", &numeroCicli);

    for (i=0; i < numeroCicli; i++)
    {
        printf("Inserisci il %d° voto: ", i+1);
        scanf("%d", &voto);

        accumulatore = accumulatore + voto;
    }

    media = accumulatore / numeroCicli;
    printf("La media dei voti e': %f", media);
}