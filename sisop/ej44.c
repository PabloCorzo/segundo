#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stddef.h>


void * process(void * arg){
	int i = * (int *) arg;
	printf("Soy el hilo %d.\n", ++i);
}

void main(){

	pthread_t th[8];
	for(int i = 0; i < 8; i++){
		pthread_create(&th[i],NULL,process,(void *) &i);
		sleep(1);
	}
}
