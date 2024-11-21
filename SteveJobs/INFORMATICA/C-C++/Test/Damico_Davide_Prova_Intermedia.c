// Si realizzi un programam in C che nella fase iniziale chieda all'operatore di inserire il valore del raggio (r)
// di una sfera (in metri), immaginando che il raggio possa assumere solo valori interi.

// Il programma proporrù il seguente menù:
// 1) Calcolo del diametro della sfera di raggio r
// 2) Calcolo volume della sfera di raggio r
// 3) Calcolo del peso della sfera di alluminio di raggio r
// 4) Calcolo del vettore dei pesi dell'alluminio e del peso complessivo
// 5) Esci

//Ricorda: 
// il diametro è il doppio del raggio
// Il volume di una sfera vale: V = (4p.greco r elevato a 3)/ 3
// Il peso in Kg è pari a P= Ps*V dove Ps è il peso specifico dell'alluminio che è pari a 2700kg/metri cubi

#include <stdio.h>
#include <math.h>

int main(){
    int raggio;
    float diametro;
    float volume;
    float pesoSfera;
    float PesoSpecifico = 2700;
    int scelta;
    int i;


    printf("Inserire il valore del raggio (r) di una sfera (in metri): \n");
    scanf("%d", &raggio);

    do
    {
        printf("\n");
        printf("***MENU***\n");
        printf("1) Calcolo del diametro della sfera di raggio %d\n", raggio);
        printf("2) Calcolo volume della sfera di raggio %d\n", raggio);
        printf("3) Calcolo del peso della sfera di alluminio di raggio %d\n", raggio);
        printf("4) Calcolo del vettore dei pesi dell'alluminio e del peso complessivo\n");
        printf("5) Esci\n");
        printf("---------------------------------------------------------------------\n");
        printf("Inserisci un numero da 1 a 5 per scegliere l'operazione da svolgere: \n");
        scanf("%d", &scelta);

        switch (scelta)
        {
        case 1:
            diametro = (float)raggio * 2;
            printf("Il diametro della sfera di raggio %d e': %.2f", raggio, diametro);
            break;

        case 2:
            volume = (float)((4 * 3.14 * pow(raggio, 3))/3);
            printf("Il volume della sfera di raggio %d e': %.4f", raggio, volume);
            break;

        case 3: 
        {
            volume = (float)((4 * 3.14 * pow(raggio, 3))/3);
            pesoSfera = PesoSpecifico * volume;
            printf("Il peso della sfera di alluminio di raggio %d in Kg e': %.2fKg", raggio, pesoSfera);
        }
        break;
            
        
        case 4:
        {
            float raggioSfere[4] = {(raggio), (raggio*2), (raggio*4), (raggio*6)};
            float pesoSfere[4] = {};
            float accumulatore;

            printf("\n");

            for(i = 0; i < 4; i++){
                volume = (float)((4 * 3.14 * pow(raggioSfere[i], 3))/3);
                pesoSfera = PesoSpecifico * volume;
                pesoSfere[i] = pesoSfera; 
            }

            printf("Il vettore dei vari pesi dell'alluminio sono:\n");

            for(i = 0; i < 4; i++){
                printf("%.2f ", pesoSfere[i]);
            }

            for(i = 0; i < 4; i++){
                accumulatore += pesoSfere[i];
            }
            printf("\n");
            printf("Il peso complessivo in Kg e': %.2fKg", accumulatore);
        }
            break;
        
        default:
            break;
        }
    } while ( scelta < 1 || scelta > 5 );
}