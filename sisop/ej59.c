#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdlib.h>


sem_t mutex;
sem_t writer;
int readers = 0;
int max = 100;

void * leer(void * args){

  sem_wait(&mutex);
  if(max > 0){
  readers++;
  max--;
  if(readers == 1) sem_wait(&writer);
  sem_post(&mutex);
  printf("Leyendo\n");
  sem_wait(&mutex);
  readers--;
  if(readers == 0) sem_post(&writer);
}else pthread_exit(0);
  sem_post(&mutex);
  sleep(1);
  leer(NULL);
}

void * escribir(void * args){

  sem_wait(&writer);
  if(max > 0) {
  printf("Escribiendo\n");  
  max--;
  }else pthread_exit(0);
  sem_post(&writer);
  sleep(1);
  escribir(NULL);
}

void main(){
	sem_init(&mutex,0,1);
	sem_init(&writer,0,1);
	
	pthread_t lectora,lectorb,escritora,escritorb;
	
	pthread_create(&lectora,NULL,leer,NULL);
	pthread_create(&lectorb,NULL,leer,NULL);
	pthread_create(&escritora,NULL,escribir,NULL);
	pthread_create(&escritorb,NULL,escribir,NULL);
	
	pthread_join(lectora,NULL);
	pthread_join(lectorb,NULL);
	pthread_join(escritora,NULL);
	pthread_join(escritorb,NULL);
	
}
