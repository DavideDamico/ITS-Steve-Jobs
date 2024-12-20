//Interpretando il file nel file 'access.log', si calcoli la durata in secondi della sessione di login dell'utente mario.rossi

#include <stdio.h>

#define N 200

int main() {
    FILE *file;
    char buffer[N];
    char tempoLogin[9];
    char tempoLogout[9];
    int login_sec, logout_sec;
    int durataSessione;
    int loginTrovato;

    file = fopen("access.log", "r");

    if (file == NULL) {
        printf("Impossibile aprire il file.\n");
        return 1;
    }

    while (fgets(buffer, N, file) != NULL) {

    }

    fclose(file);

    if (durataSessione > 0) {
        printf("La durata della sessione di login di mario.rossi è: %d secondi\n", durataSessione);
    } else {
        printf("Non è stato possibile calcolare la durata della sessione di login di mario.rossi.\n");
    }

    return 0;
}