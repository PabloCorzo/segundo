#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>

sem_t mutex;
int cuenta = 0;

void * sumar(void * args){
	
	for(int i = 0; i < 100000; i++){
	sem_wait(&mutex);
	cuenta = cuenta + 500;
	sem_post(&mutex);
	}
}

void * restar(void * args){
	
	for(int i = 0; i < 100000; i++){
	sem_wait(&mutex);
	cuenta = cuenta - 500;
	sem_post(&mutex);
}
}

void main(){
	
  sem_init(&mutex,0,1);

  pthread_t a,b;
  pthread_create(&a,NULL,sumar,NULL);
  pthread_create(&b,NULL,restar,NULL);
  
  
  
  pthread_join(a,NULL);
  pthread_join(b,NULL);
  printf("cuenta es %d\n", cuenta);
}
