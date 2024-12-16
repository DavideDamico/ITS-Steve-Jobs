#include <stdio.h>
#include <string.h>
// ricerca parola 'alunni' e sostiuisce con 'allievi'

int main(){
    
        FILE *file,*file_out;
        char buffer[1000];
        char buffer_out[1000];
        int count;
        int i,j;
    
        file = fopen("articolo_giornale.txt", "r");
        file_out = fopen("articolo_giornale_out.txt", "w");
    
        if (file == NULL) {
            printf("Impossibile aprire il file.\n");
            return 1;
        }
    
        count = 0;
        // Legge il file e conta le occorrenze della parola
        while (fgets(buffer,1000,file) != NULL) {
            i=0;
            j=0;
            // Controlla se la parola è presente
            while(buffer[i] != 0){
                //Ricopio lettera per lettera sul buffer_out
                buffer_out[j]=buffer[i];
                //Assicura che ci siano i caratteri -5 -4 -3 -2 -1 
                if (i>5){
                    // Se trova la prima lettera della parola
                    if(buffer[i-5] == 'a' && buffer[i-4] == 'l' && buffer[i-3] == 'u' && buffer[i-2] == 'n' && buffer[i-1] == 'n' && buffer[i] == 'i'){
                        count++;
                        buffer_out[j-5]='a';
                        buffer_out[j-4]='l';
                        buffer_out[j-3]='l';
                        buffer_out[j-2]='i';
                        buffer_out[j-1]='e';
                        buffer_out[j]='v';
                        // Incremento j per evitare di sovrascrivere , poichè aggiungo una lettera
                        j++;
                        buffer_out[j]='i';
                    }
                }
                i++;
                j++;
            }
            buffer_out[j]=0;
            fprintf(file_out,"%s",buffer_out);
        }
    
        fclose(file);
        fclose(file_out);
    
        printf("Il numero di occorrenze della parola 'alunni' nel file e': %d\n", count);
    
        return 0;
}