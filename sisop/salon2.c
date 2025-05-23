#include <semaphore.h>
#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stdbool.h>
#include <stdlib.h>

sem_t salon,sofa,chair,employee,wait_time,mutex;
pthread_t threads[50];
int threads_id[50];
pthread_t hairdressers[3];
int n = 50;

void * clients(void * args){
	int arg = *(int *) args;
	sem_wait(&salon);
	printf("Cliente %d entra a la peluqueria\n",arg);
	sem_wait(&sofa);
	printf("Cliente %d se sienta en el sofa\n",arg);
	sem_wait(&chair);
	printf("Cliente %d se sienta en la silla\n",arg);
	sem_post(&sofa);
	sem_post(&employee);
	sem_wait(&wait_time);
	

}

void * employees(void * args){
	sem_wait(&mutex);
	while(n > 0){
	n--;
	printf("%d\n",50-n);
	sem_post(&mutex);
	sem_wait(&employee);
	printf("Empezando corte de pelo\n");
	fflush(stdout);
	sleep(2);
	printf("Fin del corte de pelo\n");
	fflush(stdout);
	sem_post(&wait_time);
	sem_post(&chair);
	sem_post(&salon);
	}
}




void main(){
sem_init(&mutex,0,1);
sem_init(&salon,0,20);
sem_init(&sofa,0,4);
sem_init(&chair,0,3);
sem_init(&employee,0,0);
sem_init(&wait_time,0,0);

for(int i = 0; i < 50; i++) threads_id[i] = i;

for(int i = 0; i < 3; i++)pthread_create(&hairdressers[i],NULL,employees,NULL);
for(int i = 0; i < 50; i++) pthread_create(&threads[i],NULL,clients,(void *) &threads_id[i]);

for(int i = 0; i < 50; i++) pthread_join(threads[i],NULL);
for(int i = 0; i < 3; i++)pthread_join(hairdressers[i],NULL);
}
