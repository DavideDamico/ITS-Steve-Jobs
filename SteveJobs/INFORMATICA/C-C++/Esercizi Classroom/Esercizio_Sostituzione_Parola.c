// Dato il file di testo "articolo_giornale.txt." , scrivere u programma in C in grado di sostituire la parola 

//  "alunni" con la parola "allievi" in tutto il file generando un nuovo file denominato articolo_giornale_new.txt

// Non utilizzare la libreria string.h

#include <stdio.h>

int main(){
    FILE *file1;
    FILE *file2;
    char buffer[2500];
    char parola[6] = "alunni";
    char sostituzione[7] = "allievi";
    char c,i,j;

    file1 = fopen("articolo_giornale.txt", "r");
    file2 = fopen("articolo_giornale_new.txt", "w");

    if (file1 == NULL) {
        printf("Impossibile aprire il file.\n");
        return 1;
    }
    
    while (fgets(buffer,2500,file1)!= NULL)
    {
        for(i=0;buffer[i]!='\0';i++){
            c = 1;
            for(j=0;j<6;j++){
                if(buffer[i+j] != parola[j]){
                    c = 0;
                    break;
                }
            }
            if(c == 1){
            fprintf(file2,"%s ",sostituzione);
            i+=6;
        } else {
            fprintf(file2,"%c",buffer[i]);
        }
        }
    }

    fclose(file1);
    fclose(file2);
    printf("Sostituzione effettuata con successo\n");
    return 0;
    
}