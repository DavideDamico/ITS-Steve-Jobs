//Switch case

#include <stdio.h>


void main (){
	int a;
	printf("Inserisci scelta (da 1 a 5): ");
	scanf("%d",&a);
	switch (a) {
		case 1: printf("Scelta = 1");
				break;
		case 2: printf("Scelta = 2");
				break;
		case 3: printf("Scelta = 3");
				break;
		case 4: printf("Scelta = 4");
				break;
		case 5: printf("Scelta = 5");
				break;
		default:
				printf("Scelta ERRATA");
	}
	printf("\n");

}