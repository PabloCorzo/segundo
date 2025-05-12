#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdlib.h>

sem_t gaps,data,mutex;
pthread_t producers[20];
int indexes[20];
pthread_t consumer;
int data_count = 0;

void * produce(void * args){
	sem_wait(&gaps);
	sem_wait(&mutex);
	data_count++;
	printf("Soy el productor %d\n Datos: %d\n",*(int *)args,data_count);
	sem_post(&mutex);
	fflush(stdout);
	sleep(1);
	sem_post(&data);
	produce(args);
}

void * consume(){
	sem_wait(&data);
	sem_wait(&mutex);
	data_count--;
	printf("Soy el consumidor\n Datos: %d\n",data_count);
	sem_post(&mutex);
	fflush(stdout);
	sleep(1);
	sem_post(&gaps);
	consume();
}

void main(){

	sem_init(&gaps,0,5);
	sem_init(&mutex,0,1);
	sem_init(&data,0,0);
	
	int i;
	for(int i = 0; i < 20; i ++) indexes[i] = i + 1;
	for(i = 0; i < 20; i++) pthread_create(&producers[i],NULL,produce,(void *) &indexes[i]);
	pthread_create(&consumer,NULL,consume,NULL);
	
	sleep(30);
	exit(0);
}
