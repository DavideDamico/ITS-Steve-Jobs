#include <stdio.h>
#include <stdbool.h>
#define N 10

// void main(){
// 	int i;
// 	int vett[N] = {1,2,3,4,5};
// 	int n=4;
// 	for(i=0; i<N; i++) {
// 		printf("vett[%d]=%d\n",i,vett[i]);
// 	}
// 	printf("vett[5]=%d",vett[5]);   //attenzione!!!! fuori range
// }

void main(){

    bool voti[N]={0};
    int i;

    voti[5]=1;

    for(i=0;i<N;i++){
        if (voti[i]){
            printf("1 ");
        } else {
            printf("0 ");
        }
    }
}