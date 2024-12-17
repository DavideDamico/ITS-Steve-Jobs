// Scrivere un programma in C che interpreti i numeri a 4 cifre contenuti nel file numeri.txt  e li trasformi in valori decimali stampandoli a video

// Formula con 123: 1 x 100 + 2 x 10 + 3 x 1 = 123

#include <stdio.h>
#define N 1000

// FATTO DA ME
// int converti_a_decimale(char *numero) {
//     int valore = 0;
//     int i;
//     for (i = 0; i < 4; i++) {
//         valore = (numero[i] - '0') + valore * 10;
//     }
//     return valore;
// }

// int main() {
//     FILE *file;
//     char buffer[1000];
//     int i;

//     file = fopen("numeri.txt", "r");

//     if (file == NULL) {
//         printf("Impossibile aprire il file.\n");
//         return 1;
//     }

//     while (fgets(buffer, 1000, file) != NULL) {
//         for (i = 0; buffer[i] != '\0'; i += 5) { // 4 cifre + 1 spazio
//             if (buffer[i] >= '0' && buffer[i] <= '9') {
//                 char numero[5];
//                 for (int j = 0; j < 4; j++) {
//                     numero[j] = buffer[i + j];
//                 }
//                 numero[4] = '\0';
//                 int valore = converti_a_decimale(numero);
//                 printf("%d\n", valore);
//             }
//         }
//     }

//     fclose(file);

//     return 0;
// }

//FATTO DAL PROF
int main(){
    FILE *file;
    char buffer[1000];
    int i, temp;

    file = fopen("numeri.txt", "r");

    if (file == NULL) {
        printf("Impossibile aprire il file.\n");
        return 1;
    }

    while(fgets(buffer,N,file) != NULL){
        temp = (buffer[0] - 48) * 1000 + (buffer[1] - 48) * 100 + (buffer[2] - 48) * 10 + (buffer[3] - 48);
        printf("%d\n", temp);
    }

    fclose(file);
}