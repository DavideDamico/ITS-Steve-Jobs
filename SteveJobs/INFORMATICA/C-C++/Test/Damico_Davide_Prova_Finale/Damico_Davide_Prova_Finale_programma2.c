//Stampare a video il numero di caratteri presenti nel file 'access.log' escludendo i caratteri di ritorno a capo

#include <stdio.h>

int lungStringa(char strng[]) {
    int i;
    int acc = 0;

    for (i = 0; strng[i] != '\0'; i++) {
        if (strng[i] != '\n') {
            acc++;
        }
    }
    return acc;
}

int main() {
    char buffer[200];
    int numb;
    FILE *file;

    file = fopen("access.log", "r");
    if (file == NULL) {
        printf("Errore nell'aprire il file\n");
        return 1;
    }

    numb = 0;
    while (fgets(buffer, sizeof(buffer), file) != NULL) {
        numb += lungStringa(buffer);
    }

    fclose(file);

    printf("Il numero di caratteri nel file (esclusi i ritorno a capo) \x8a: %d\n", numb);
    return 0;
}
