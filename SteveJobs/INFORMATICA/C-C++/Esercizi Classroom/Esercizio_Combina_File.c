// Un file di testo contiene un elenco di nomi
// Un altro file di testo contiene il rispettivo elenco di cognomi

// Scrivere un programma n C in grado di generare un altro file di testo contenente l'elenco di Nomi e Cognomi (un nominativo per riga)

#include <stdio.h>
#include <string.h>

int main(){

    // Dichiarazione delle variabili
    FILE *file1;
    FILE *file2;
    FILE *file3;
    char buffer1[100];
    char buffer2[100];

    // Codice per aprire i files
    file1 = fopen("Nomi.txt", "r");
    file2 = fopen("Cognomi.txt", "r");
    file3 = fopen("NomiCognomi.txt", "w");

    // Codice per controllare se i file sono stati aperti correttamente
    if (file1 == NULL || file2 == NULL) {
        printf("Impossibile aprire il file.\n");
        return 1;
    }

    // Codice per leggere i file e scrive il contenuto nel file3
    while (fgets(buffer1, 100, file1) != NULL && fgets(buffer2, 100, file2) != NULL) {

        // Codice per eliminare il carattere di a capo
        int len = strlen(buffer1);
        if (buffer1[len - 1] == '\n') {
            buffer1[len - 1] = '\0';
        }

        len = strlen(buffer2);
        if (buffer2[len - 1] == '\n') {
            buffer2[len - 1] = '\0';
        }

        // Codice per scrivere i dati nel file3
        fprintf(file3, "%s %s", buffer1, buffer2);
        fprintf(file3, "\n\n");
    }

    // Codice per chiudere i files
    fclose(file1);
    fclose(file2);
    fclose(file3);

    return 0;
}