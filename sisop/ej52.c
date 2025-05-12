#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <pthread.h>


int cuenta = 0;
int turn = 0;
int n = 100000;

void * sumar(void * args){
	for(int i = 0; i < n; i++){
	int amt = *(int *) args;
	while(turn == 1){}
	cuenta = cuenta + amt;
	turn = 1;
}
}

void * restar(void * args){
	for(int i = 0; i < n; i++){
	int amt = *(int *) args;
	while(turn == 0){}
	cuenta = cuenta - amt;
	turn = 0;
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
