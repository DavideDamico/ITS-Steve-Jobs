#include <stdio.h>

void main(){
	int voti, voto1, voto2, voto3, voto4, voto5;
	float media;
	
	
	printf("Inserisci il voto del primo esame: ");
	scanf("%d", &voto1);
	printf("Inserisci il voto del secondo esame: ");
	scanf("%d", &voto2);
    printf("Inserisci il voto del terzo esame: ");
	scanf("%d", &voto3);
    printf("Inserisci il voto del quarto esame: ");
	scanf("%d", &voto4);
    printf("Inserisci il voto del quinto esame: ");
	scanf("%d", &voto5);
	
	voti=voto1+voto2+voto3+voto4+voto5;
    media=(float)voti/5;
	
	printf("La media dei voti e': %f", media);
}