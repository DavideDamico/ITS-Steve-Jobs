//Interpretando il file nel file 'access.log', si riporti in una stringa l'orario di login, letto dal file di log, dell'utente mario.rossi

#include <stdio.h>

int main() {
    FILE *fileEntrata;
    char buffer[200];
    char tempoLogin[9];
    char user[] = "mario.rossi";  
    int i, j;
    int trovaUtente;


    fileEntrata = fopen("access.log", "r");
    if (fileEntrata == NULL) {
        printf("Errore nell'aprire il file\n");
        return 1;
    }

    while (fgets(buffer, 200, fileEntrata) != NULL) {
        i = 0;
        while (buffer[i] != '\0') {
            if (buffer[i] == 'T') {
                for (j=0; j<8; j++) {
                    tempoLogin[j] = buffer[i + 1 + j];
                }
                tempoLogin[8] = '\0';
                break;
            }
            i++;
        }

        if (buffer[0] == 'l' && buffer[1] == 'o' && buffer[2] == 'g' && buffer[3] == 'i' && buffer[4] == 'n' && buffer[5] == ' ' ) {
            trovaUtente = 1;
            for (j=0; user[j] != '\0'; j++) {
                if (buffer[6 + j] != user[j]) {
                    trovaUtente = 0;
                    break;
                }
            }

            if (trovaUtente) {
                break;
            }
        }
    }

    fclose(fileEntrata);

    printf("%s \x8a loggato all'orario: %s\n", user, tempoLogin);

    return 0;
}
