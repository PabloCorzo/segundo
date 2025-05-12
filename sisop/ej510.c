#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <sys/types.h>
#include <pthread.h>

sem_t mutex[4];
int n = 6 * 3;
int counter = 0;

void add(){

	sem_wait(&mutex[3]);
	counter++;
	sem_post(&mutex[3]);
}

void * writea(void * args){
  if(counter > n) pthread_exit(0);
  sem_wait(&mutex[0]);
  printf("A");
  add();
  sem_post(&mutex[1]);
  writea(NULL);
}

void * writeb(void * args){
  if(counter > n) pthread_exit(0);
  sem_wait(&mutex[1]);
  printf("B");
  add();
  sem_post(&mutex[2]);
  writeb(NULL);
}

void * writec(void * args){
  if(counter > n) pthread_exit(0);
  sem_wait(&mutex[2]);
  printf("C");
  add();
  sem_post(&mutex[0]);
  writec(NULL);
}

void main(){
	sem_init(&mutex[0],0,1);
	sem_init(&mutex[1],0,0);
	sem_init(&mutex[2],0,0);
	sem_init(&mutex[3],0,1);
	
	pthread_t a,b,c;
	pthread_create(&a,NULL,writea,NULL);
	pthread_create(&b,NULL,writeb,NULL);
	pthread_create(&c,NULL,writec,NULL);
	
	pthread_join(a,NULL);
	pthread_join(b,NULL);
	pthread_join(c,NULL);
	putchar('\n');
}
