// Il primo operatore inserisce un numero intero tra 1 e 9. Se viene inserito un numero al di fuori di questo 
// intervallo verrà richiesto al primo operatore di reinserire un numero valido.
// Il gioco passa al secondo operatore che tenterà di indovinarlo. 
// Se lo indovina il programma esce altrimenti chiede di ritentare.
// Quando il secondo operatore indovinerà il valore il programma uscendo stamperà il numero di tentativi effettuati.

int main(){
    int numeroDaInd;
    int sceltaSecOper;
    int tentativi = 0;

do {
        printf("Primo operatore, inserisci un numero tra 1 e 9: ");
        scanf("%d", &numeroDaInd);
        if (numeroDaInd < 1 || numeroDaInd > 9){
            printf("Numero errato , inserisci un numero valido\n");
        }

        do {
            printf("Secondo operatore, indovina il numero (da 1 a 9): \n");
            scanf("%d", &sceltaSecOper);
            if (sceltaSecOper != numeroDaInd){
                printf("Numero errato , ritenta\n");
                tentativi++;
            } else {
                tentativi++;
                printf("Hai indovinato in %d tentativi", tentativi);
            }
        } while (sceltaSecOper != numeroDaInd);
    } while (numeroDaInd < 1 || numeroDaInd > 9);
}