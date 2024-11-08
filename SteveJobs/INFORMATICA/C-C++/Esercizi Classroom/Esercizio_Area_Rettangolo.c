#include <stdio.h>

void main(){
	int base, altezza, area;
	
	
	printf("Inserisci la base: ");
	scanf("%d", &base);
	printf("Inserisci l'altezza': ");
	scanf("%d", &altezza);
	
	area=base*altezza;
	
	printf("L'area di un rettangolo' e' uguale a: %d", area);
}