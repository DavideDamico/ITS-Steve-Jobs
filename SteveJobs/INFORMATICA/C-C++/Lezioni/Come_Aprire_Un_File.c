#include <stdio.h>

int main() {
    FILE *file1;
	FILE *file2;
    char buffer1[100];

    file1 = fopen("Nomi.txt", "r"); // apri in lettura
    file2 = fopen("NomiCopia.txt", "w"); // apri in scrittura
    
    if (file1 == NULL) {
        printf("Impossibile aprire il file.\n");
        return 1;
    }

    while (fgets(buffer1, 100, file1) != NULL) {
        fprintf(file2,"%s", buffer1);
    }

    fclose(file1);
    fclose(file2);

    return 0;
}