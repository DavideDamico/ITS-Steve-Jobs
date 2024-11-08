#include <stdio.h>

int main() {
    char i;
    char scelta;
    int alfabeto = 65;
    int alfabeto2 = 97;

    printf("Desidera l'alfabeto in maiuscolo(scrivi a) o minuscolo(scrivi b)?: ");
    scanf("%c", &scelta);
    
    if (scelta == 'a') {
        for(i=0; i < 26;i++)
        {
            printf("%c ",alfabeto);
            alfabeto++;
        }
    } else if (scelta == 'b') 
            {
                for(i=0; i < 26;i++) 
                {
                    printf("%c ",alfabeto2);
                    alfabeto2++;
                }
            } else 
                {
                    printf("Scelta non valida");
                }
}