#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdlib.h>


int descartes = 2;
int names[5];
int nietzsche = 1;
int davo = 5; 
int beauvoir = 4;
int socrates = 3;
pthread_t philosophers[5];
sem_t sticks[5];
sem_t gluttony;

void * philosophize(void * args){
	int name = *(int *) args;
	while(true){
		if(name == 1) printf("God is dead and so is the queen of England.\n");
		if(name == 2) printf("Cogito ergo cum\n");
		if(name == 3) printf("Why tho\n");
		if(name == 4) printf("Women amirite\n");
		if(name == 5) printf("Wachin es el subconsciente universal jungiano, que viene representado por el deseo Schopenhaueriano de intimidad que no llega a ser realizado.\n");
		fflush(stdout);
		sleep(2);
		sem_wait(&gluttony);
		sem_wait(&sticks[name]);
		sem_wait(&sticks[(name+1)%5]);
		printf("delisioso\n");
		sem_post(&sticks[(name+1)%5]);
		sem_post(&sticks[name]);
		sem_post(&gluttony);
	}

}

void main(){
sem_init(&gluttony,0,4);
for(int i = 0; i < 5; i++) sem_init(&sticks[i],0,1);
for(int i = 0; i < 5; i++) names[i] = i;

for(int i = 0; i < 5; i++) pthread_create(&philosophers[i],NULL,philosophize,(void *) &names[i]);
for(int i = 0; i < 5; i++) pthread_join(philosophers[i],NULL);
}

