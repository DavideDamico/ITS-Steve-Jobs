#include <stdio.h>
#include <math.h>

void main(){
	int a;
	int b;
	int c;
	float delta;
    float soluzione1, soluzione2;


    printf("Inserisci il valore di a: ");
    scanf("%d", &a);
    printf("Inserisci il valore di b: ");
    scanf("%d", &b);
    printf("Inserisci il valore di c: ");
    scanf("%d", &c);

    delta= (b*b)-(4*a*c);
    soluzione1= (-b + (sqrt(delta)))/(2*a); 
    soluzione2= (-b - (sqrt(delta)))/(2*a);

    printf("La prima soluzione e': %f \n", soluzione1);
    printf("La seconda soluzione e': %f", soluzione2);
}