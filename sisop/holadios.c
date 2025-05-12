#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>
#include <string.h>

sem_t mutex;
int c = 0;

void *process(void *args){
	
	int i = * (int *) args;
	if(i == 1){
		printf("Hola, ");
		sem_post(&mutex);
	}
	if(i == 2){
		sem_wait(&mutex);
		printf("adios\n");
	}
	
}


void main(){

	pthread_t a,b;
	sem_init(&mutex,0,0);
	
	int i = 1;
	int j = 2;
	
	pthread_create(&a,NULL,process,&i);
	pthread_create(&b,NULL,process,&j);
	
	pthread_join(a,NULL);
	pthread_join(b,NULL);

}
