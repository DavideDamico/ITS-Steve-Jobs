#include <stdio.h>
#include <math.h>

void main(){
	int a;
	int b;
	int c;
	
    printf("Inserisci il valore di a: ");
    scanf("%d", &a);
    printf("Inserisci il valore di b: ");
    scanf("%d", &b);
    printf("Inserisci il valore di c: ");
    scanf("%d", &c);
    
    if (a>c && a>b) {
                        printf("Il valore massimo e': %d\n",a);
                    }
    if (b>c && b>a) {
                        printf("Il valore massimo e': %d\n",b);
                    }
    if (c>a && c>b) {
                        printf("Il valore massimo e': %d\n",c);
                    }
}