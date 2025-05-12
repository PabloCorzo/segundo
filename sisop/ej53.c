#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <pthread.h>
#include <stdbool.h>

bool turns[2] = {false,false};
int cuenta = 0;
int n = 100000;

void * sumar(void * args){
	for(int i = 0; i < n; i++){
	int amt = *(int *) args;
	while(turns[1]){}
	turns [0] = true;
	cuenta = cuenta + amt;
	turns[0] = false;
}
}

void * restar(void * args){
	for(int i = 0; i < n; i++){
	int amt = *(int *) args;
	while(turns[0]){}
	turns[1] = true;
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
