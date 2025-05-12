#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>

sem_t mutex;
int c = 0;

void *process(void *args){

	bool adder = * (bool *) args;
	for(int i = 1; i <= 1000000; i++){
		sem_wait(&mutex);
		if(adder) c = c + 1;
		else c = c - 1;
		sem_post(&mutex);
	}
	
}


void main(){

	pthread_t a,b;
	bool adder = true;
	bool subber = false;
	
	
	sem_init(&mutex,0,1);
	
	pthread_create(&a,NULL,process,(void *) &adder);
	pthread_create(&b,NULL,process,(void *)&subber);
	
	pthread_join(a,NULL);
	pthread_join(b,NULL);
	
	printf("El resultado final es: %d\n", c);

}
