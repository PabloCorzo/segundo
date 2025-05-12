
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>

int c = 0;

void *process(void *args){

	bool adder = * (bool *) args;
	for(int i = 1; i <= 1000000; i++){
		if(adder) c = c + 1;
		else c = c - 1;
	}
	
}


void main(){

	pthread_t a,b;
	bool adder = true;
	bool subber = false;
	
	pthread_create(&a,NULL,process,(void *) &adder);
	pthread_create(&b,NULL,process,(void *)&subber);
	
	pthread_join(a,NULL);
	pthread_join(b,NULL);
	
	printf("El resultado final es: %d\n", c);

}
