//Interpretando il file nel file 'access.log', generare un file denominato 'access.csv' dove i campi sono separati dal carattere ';' sostituendo 
//anche la 'T' compresa tra la data e l'ora

#include <stdio.h>

void sostituzioneSpazioeT(char *strng) {
    int i;
    for (i = 0; strng[i] != '\0'; i++) {
        if (strng[i] == 'T' || strng[i] == ' ') {
            strng[i] = ';';
        }
    }
}

int main() {
    char buffer[200];
    FILE *fileEntrata;
    FILE *fileUscita;

    fileEntrata = fopen("access.log", "r");
    if (fileEntrata == NULL) {
        printf("Errore nell'aprire il file di input\n");
        return 1;
    }

    fileUscita = fopen("access.csv", "w");
    if (fileUscita == NULL) {
        printf("Errore nell'aprire il file di output\n");
        fclose(fileEntrata);
        return 1;
    }

    while (fgets(buffer, sizeof(buffer), fileEntrata) != NULL) {
        sostituzioneSpazioeT(buffer);
        fprintf(fileUscita, "%s", buffer);
    }

    fclose(fileEntrata);
    fclose(fileUscita);

    printf("Il file è stato generato con successo\n");
    return 0;
}
