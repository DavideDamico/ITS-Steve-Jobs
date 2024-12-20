// Dato il file "articolo_giornale.txt", scrivere un programma in C che restituisca il numero di occorrenze della parola "alunni" nel file.
// Proporre una soluzione senza l'uso della libreria string.h

#include <stdio.h>

int main(){
    
        FILE *file;
        char buffer[1000];
        int count;
        int i;
    
        file = fopen("articolo_giornale.txt", "r");
    
        if (file == NULL) {
            printf("Impossibile aprire il file.\n");
            return 1;
        }
    
        count = 0;
        // Legge il file e conta le occorrenze della parola
        while (fgets(buffer,1000,file) != NULL) {
            i=0;
            // Controlla se la parola è presente
            while(buffer[i] != 0){
                //Assicura che ci siano i caratteri -5 -4 -3 -2 -1 
                if (i>5){
                    // Se trova la prima lettera della parola
                    if(buffer[i-5] == 'a' && buffer[i-4] == 'l' && buffer[i-3] == 'u' && buffer[i-2] == 'n' && buffer[i-1] == 'n' && buffer[i] == 'i'){
                    count++;
                    }
                }
                i++;
            }
        }
    
        fclose(file);
    
        printf("Il numero di occorrenze della parola 'alunni' nel file e': %d\n", count);
    
        return 0;
}