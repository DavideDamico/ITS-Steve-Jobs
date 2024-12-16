// Dato il file di testo "articolo_giornale.txt." , scrivere u programma in C in grado di sostituire la parola 

//  "alunni" con la parola "allievi" in tutto il file generando un nuovo file denominato articolo_giornale_new.txt

// Non utilizzare la libreria string.h

#include <stdio.h>

int main() {
    FILE *file1, *file2;
    char buffer[2500];
    char parola[] = "alunni";
    char sostituzione[] = "allievi";
    int i, j, k;

    file1 = fopen("articolo_giornale.txt", "r");
    file2 = fopen("articolo_giornale_new.txt", "w");

    if (file1 == NULL || file2 == NULL) {
        printf("Impossibile aprire il file.\n");
        return 1;
    }

    // Legge il file e scrive il contenuto nel nuovo file
    while (fgets(buffer, 2500, file1) != NULL) {
        // Sostituisce la parola
        for (i = 0; buffer[i] != '\0'; i++) {
            // Se trova la prima lettera della parola
            if (buffer[i] == parola[0]) {
                // Controlla se la parola è presente
                for (j = 1; parola[j] != '\0' && buffer[i + j] == parola[j]; j++);
                // Se la parola è presente
                if (parola[j] == '\0' && (buffer[i + j] == ' ' || buffer[i + j] == '\n' || buffer[i + j] == '\0')) {
                    // Sostituisce la parola
                    for (k = 0; sostituzione[k] != '\0'; k++) {
                        fputc(sostituzione[k], file2);
                    }
                    i += j - 1; 
                } 
                // Se la parola non è presente
                else {
                    fputc(buffer[i], file2);
                }
            } 
            // Se non trova la prima lettera della parola
            else {
                fputc(buffer[i], file2);
            }
        }
    }

    fclose(file1);
    fclose(file2);
    return 0;
}