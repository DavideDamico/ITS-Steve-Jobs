#include <stdio.h>

int main() {
    FILE *file;
    char buffer[100];

    file = fopen("readme.txt", "r");
    if (file == NULL) {
        printf("Impossibile aprire il file.\n");
        return 1;
    }

    while (fgets(buffer, 100, file) != NULL) {
        printf("%s", buffer);
    }

    fclose(file);

    return 0;
}