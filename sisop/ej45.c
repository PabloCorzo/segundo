#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stddef.h>


void * process(void * arg){
	int letter = *(int *) arg;
	int base = 97 + letter;
	printf("%c%c%c\n",base,base,base);
}

void main(){

	pthread_t th[8];
	for(int i = 0; i < 3; i++){
		pthread_create(&th[i],NULL,process,(void *) &i);
		sleep(1);
	}
}
