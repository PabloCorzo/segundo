#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdlib.h>

sem_t cup,delivery,Dolce,sleepycode;
pthread_t programmers[20];
int programmer_id[20];
pthread_t dolce,deliverer;
//coge taza y programa 10s - pide cafe, duerme hasta que llegue, avisa de la llegada 
//1 termo = 1 taza empieza lleno

void * code(void * args){
	
	int id = *(int *) args;
	sem_wait(&cup);
	printf("Matao %d is programming...\n",id);
	fflush(stdout);
	sleep(10);
	sem_post(&delivery);
	sem_wait(&sleepycode);
	code(args);

}

void * deliver(void * args){
	
	sem_wait(&delivery);
	printf("Waking up Dolce\n");
	fflush(stdout);
	sem_post(&Dolce);
	sem_wait(&delivery);
	printf("Delivering the ja\n");
	fflush(stdout);
	sleep(10);
	sem_post(&cup);
	deliver(NULL);
}

void * brew(void * args){
	
	sem_wait(&Dolce);
	printf("Brewing...\n");
	fflush(stdout);
	sleep(5);
	sem_post(&delivery);
	brew(NULL);
}


void main(){
	sem_init(&cup,0,1);
	sem_init(&delivery,0,0);
	sem_init(&Dolce,0,0);
	sem_init(&sleepycode,0,0);
	
	for(int i = 0; i < 20; i++) programmer_id[i] = i;
	for(int i = 0; i < 20; i++) pthread_create(&programmers[i],NULL,code,(void *)&programmer_id[i]);
	
	pthread_create(&deliverer,NULL, deliver,NULL);
	pthread_create(&dolce,NULL,brew,NULL);
	for(int i = 0; i < 20; i++) pthread_join(programmers[i],NULL);
	pthread_join(deliverer,NULL);
	pthread_join(dolce,NULL);
}	
