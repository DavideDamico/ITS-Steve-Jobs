// Dato il file "articolo_giornale.txt" ricopiare le prime 30 parole su una matrice 30x50 di char. Le parole vano ricopiate una per riga e vanno memorizzate in formato stringa.
// Il programma infine stamperà le stringhe (una per riga) memorizzate nella matrice

#include <stdio.h>
#define RIGHE 30
#define COLONNE 50

int main()
{
    FILE *file;
    char matrice[RIGHE][COLONNE];
    int i;

    file = fopen("articolo_giornale.txt", "r");

    if (file == NULL)
    {
        printf("Errore nell'apertura del file\n");
        return 1;
    }

    i = 0;
    while (fscanf(file, "%s", matrice[i]) != NULL)
    {
        i++;
        if (i == RIGHE)
            break;
    }

    for (i = 0; i < RIGHE; i++)
    {
        printf("%s\n", matrice[i]);
    }

    fclose(file);

    return 0;
}