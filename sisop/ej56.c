#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <pthread.h>
#include <stdbool.h>

bool turns[2] = {false,false};
int turn = 1;
int cuenta = 0;
int n = 100000;

void * sumar(void * args){
	int amt = *(int *) args;
	for(int i = 0; i < n; i++){
	turns [0] = true;
	turn = 1;
	while(turns[1] && turn == 1){}
	cuenta = cuenta + amt;
	turns[0] = false;
}
}

void * restar(void * args){
	int amt = *(int *) args;
	for(int i = 0; i < n; i++){
	turns[1] = true;
	turn = 0;	
	while(turns[0] && turn == 0){}
	cuenta = cuenta - amt;
	turns[1] = false;
}
}


void main(){
	pthread_t a,b;
	int amt = 500;
	
	pthread_create(&a,NULL,sumar,(void *)&amt);
	pthread_create(&b,NULL,restar,(void *)&amt);
	pthread_join(a,NULL);
	pthread_join(b,NULL);
	printf("Cantidad final es : %d\n", cuenta);

}
