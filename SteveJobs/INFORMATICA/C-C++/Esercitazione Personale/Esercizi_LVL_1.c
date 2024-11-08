#include <stdio.h>
#include <stdbool.h>
#include <math.h>
// Ecco una lista di esercizi semplici e graduali per esercitarti in C. Questi coprono vari concetti di base, come variabili, cicli, condizionali e funzioni:


// ### 1. **Stampa di numeri pari**
//    - **Descrizione**: Scrivi un programma che stampi tutti i numeri pari da 1 a 50.
//    - **Suggerimento**: Usa un ciclo `for` per iterare da 1 a 50 e stampa solo i numeri divisibili per 2.

// int main(){
//     int i;

//     for(i=0;i<50;i++){
//         if (i % 2 == 0){
//             printf("%d\n", i);
//         }
//     }
// }

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 2. **Somma dei numeri da 1 a N**
//    - **Descrizione**: Chiedi all'utente di inserire un numero `N`, quindi calcola e stampa la somma di tutti i numeri da 1 a `N`.
//    - **Suggerimento**: Usa un ciclo `for` per sommare tutti i numeri fino a `N`.

// int main(){
//     int i;
//     int num;
//     int somma;

//     printf("Inserisci un numero: ");
//     scanf("%d", &num);

//     for(i=0;i<num;i++){
//         somma = somma + i;
//     }

//     printf("La somma dei numeri fino a %d e': %d", num, somma);
// }

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 3. **Verifica di numero pari o dispari**
//    - **Descrizione**: Scrivi un programma che chieda all'utente di inserire un numero e dica se è pari o dispari.
//    - **Suggerimento**: Usa l'operatore modulo `%` per verificare la parità.

// int main(){
//     int i;
//     int num;

//     printf("Inserisci un numero: ");
//     scanf("%d", &num);

//     if (num % 2 == 0){
//         printf("%d e' un numero pari", num);
//     } else {
//         printf("%d e' un numero dispari", num);
//     }
// }

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 4. **Calcolo della media di tre numeri**
//    - **Descrizione**: Chiedi all'utente di inserire tre numeri, poi calcola e stampa la loro media.
//    - **Suggerimento**: Usa variabili `float` per una maggiore precisione e somma i tre numeri dividendo per 3.

// int main(){
//     float a, b, c;
//     float media;

//     printf("Inserisci il primo numero: ");
//     scanf("%f", &a);
//     printf("Inserisci il secondo numero: ");
//     scanf("%f", &b);
//     printf("Inserisci il terzo numero: ");
//     scanf("%f", &c);

//     media = (a + b + c) / 3;
//     printf("La media e': %f", media);
// }

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 5. **Convertitore di temperature (Celsius a Fahrenheit)**
//    - **Descrizione**: Chiedi all'utente di inserire una temperatura in gradi Celsius, quindi converti e stampa il valore in gradi Fahrenheit.
//    - **Formula**: \( F = C \times \frac{9}{5} + 32 \)
//    - **Suggerimento**: Usa la formula e stampa il risultato con `printf`.

// int main(){
//     float celsius;
//     float fahrenheit;

//     printf("Inserire una temperatura in gradi Celsius: ");
//     scanf("%f", &celsius);

//     fahrenheit = (celsius * 9/5) + 32;
//     printf("La temperatura in fahrenheit è: %f", fahrenheit);
// }

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 6. **Calcolo del fattoriale di un numero**
//    - **Descrizione**: Scrivi un programma che chieda all'utente di inserire un numero `n` e calcoli il fattoriale di `n` (`n!`).
//    - **Suggerimento**: Usa un ciclo `for` per moltiplicare i numeri da 1 a `n`.

// int main(){
//     int i;
//     int num;
//     int moltiplicazione = 1;

//     printf("Inserisci un numero: ");
//     scanf("%d", &num);

//     for(i=1;i<num+1;i++){
//         moltiplicazione = moltiplicazione * i;
//     }

//     printf("La moltiplicazione dei numeri fino a %d è: %d", num, moltiplicazione);
// }

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 7. **Verifica di numero primo**
//    - **Descrizione**: Chiedi all'utente di inserire un numero e verifica se è un numero primo.
//    - **Suggerimento**: Un numero è primo se è divisibile solo per 1 e per sé stesso. Usa un ciclo `for` per controllare se ha divisori oltre 1 e sé stesso.

// int main() {
//     int numero;
//     bool isPrimo = true;

//     printf("Inserisci un numero: ");
//     scanf("%d", &numero);

//     if (numero <= 1) {
//         isPrimo = false;  // I numeri <= 1 non sono primi
//     } else {
//         for (int i = 2; i <= sqrt(numero); i++) {
//             if (numero % i == 0) {  
//                 isPrimo = false;
//                 break;             
//         }
//     }

//     if (isPrimo) {
//         printf("%d è un numero primo.\n", numero);
//     } else {
//         printf("%d non è un numero primo.\n", numero);
//     }

//     return 0;
// }

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 8. **Invertire un numero**
//    - **Descrizione**: Scrivi un programma che legga un numero intero dall'utente e stampi il numero al contrario.
//    - **Suggerimento**: Usa un ciclo `while` per ottenere le cifre in ordine inverso.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 9. **Conta delle cifre in un numero**
//    - **Descrizione**: Chiedi all'utente di inserire un numero e stampa il numero di cifre in esso contenute.
//    - **Suggerimento**: Usa un ciclo `while` per contare quante volte puoi dividere il numero per 10 prima di arrivare a zero.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 10. **Stampa di una tabella di moltiplicazione**
//    - **Descrizione**: Chiedi all'utente di inserire un numero `n` e stampa la tabella di moltiplicazione da 1 a 10 per `n`.
//    - **Suggerimento**: Usa un ciclo `for` per moltiplicare `n` per ogni numero da 1 a 10 e stampa il risultato.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 11. **Calcolo dell'area e della circonferenza di un cerchio**
//    - **Descrizione**: Chiedi all'utente di inserire il raggio di un cerchio, poi calcola e stampa l'area e la circonferenza.
//    - **Formule**:
//      - Area: \( \pi \times r^2 \)
//      - Circonferenza: \( 2 \times \pi \times r \)
//    - **Suggerimento**: Usa `3.14159` come valore di π.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 12. **Trova il massimo di tre numeri**
//    - **Descrizione**: Chiedi all'utente di inserire tre numeri e trova il maggiore tra loro.
//    - **Suggerimento**: Usa condizioni `if` per confrontare i numeri e determinare quello più grande.

// -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ### 13. **Calcolatrice semplice**
//    - **Descrizione**: Scrivi un programma che chieda all'utente due numeri e un'operazione (somma, sottrazione, moltiplicazione o divisione) e restituisca il risultato.
//    - **Suggerimento**: Usa un `switch` per gestire le quattro operazioni.