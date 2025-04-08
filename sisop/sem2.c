#include <stddef.h>
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
int vueltas = 1000000;
int c = 0;
bool busy  = false;

void * process(void * args){


	//peterson: 2 estados para acceso concurrente y turno para evitar interbloqueo
	bool add = *(bool *) args;
	for(int i = 0; i <= vueltas; i++){
	while(busy){}
	busy == true;
	if(add) c = c + 1;
	else c = c - 1;
	busy = false;	
	}
}


void main(){
	
	pthread_t a,b;
	
	bool t = true;
	bool f = false;
	
	pthread_create(&a,NULL,process,(void *)&t);
	pthread_create(&b,NULL,process,(void *)&f);
	
	pthread_join(a,NULL);
	pthread_join(b,NULL);
	
	printf("%d\n",c);
}
