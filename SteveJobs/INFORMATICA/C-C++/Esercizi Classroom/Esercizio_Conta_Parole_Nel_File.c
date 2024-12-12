// Dato il file "articolo_giornale.txt", scrivere un programma in C che restituisca il numero di occorrenze della parola "alunni" nel file.
// Proporre una soluzione senza l'uso della libreria string.h

#include <stdio.h>

int main(){
    
        FILE *file;
        char buffer[100];
        int count = 0;
    
        file = fopen("articolo_giornale.txt", "r");
    
        if (file == NULL) {
            printf("Impossibile aprire il file.\n");
            return 1;
        }
    
        while (fgetc(file) != EOF) {
            fgets(buffer, 100, file);
            for (int i = 0; buffer[i] != '\0'; i++) {
                if (buffer[i] == 'a' && buffer[i + 1] == 'l' && buffer[i + 2] == 'u' && buffer[i + 3] == 'n' && buffer[i + 4] == 'n' && buffer[i + 5] == 'i') {
                    count++;
                }
            }
        }
    
        fclose(file);
    
        printf("Il numero di occorrenze della parola 'alunni' nel file e': %d\n", count);
    
        return 0;
}