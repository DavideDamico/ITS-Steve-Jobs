- ALU = Arithmetic Logic Unit

Commento multilinea /\* \*/

Commento monolinea //

void main(){} = cuore del programma , non si può non usare

funzione printf() = per l'output
funzione scanf("%d", &j) = prende ciò che viene digitato e lo inserisce nella variabile j (int j;)

- PRIMO ESEMPIO:

#include <stdio.h>

// il programma fa la somma di due variabili
void main(){
int i;
int j;
int somma;
/_
printf("Inserisci i: ");
scanf("%d" ,&i);
printf("Inserisci j: ");
scanf("%d", &j);
_/
i=3;
j=4;
somma=i+j; //somma di i e j
printf("Ciao a tutti. i=%d j=%d somma=%d\n", i, j, somma);
i=j;
somma=i+j;
printf("Ciao a tutti. i=%d j=%d somma=%d", i, j, somma);
}

- SECONDO ESEMPIO

#include <stdio.h>

void main(){
int lato,perimetro;
printf("Inserisci lato: ");
scanf("%d", &lato);
perimetro=lato\*4;
printf("Il perimetro di un quadrato di lato %d e' uguale a: %d", lato, perimetro);
}

float = serve per rendere il valore con la virgola

#include <math.h> = serve per utilizzare la libreria Math per calcoli più complessi che richiedono l'usilio di sen, cos , radice quadrata etc.

Ip univoco = Ipv4
WAN = Wide Area Network
LAN = Local Area Network
DNS = Ip della compagnia telefonica che si presenta col router
Gateway = Porta di uscita (router)

Il router serve a fare da ponte tra i vari ip per permettere di collegarsi

CICLI:
For (se si sa quante volte bisogna fare l'operazione)
While (quando non sappiamo quante volte si dovrà ripetere il ciclo)
Do While (la condizione viene valutata alla fine. Questo significa che il codice all'interno del ciclo viene eseguito almeno una volta, indipendentemente dalla condizione.)
