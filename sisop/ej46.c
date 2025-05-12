#include <stddef.h>
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>

void * process(void * args){

	int num = *(int *)args;
	printf("%d",num);
	pthread_exit(0);
}

int main(void){
	
	pthread_t th[8];
	for(int i = 0; i < 8; i++){ 
		pthread_create(&th[i],NULL,process, (void *) &i);
		sleep(1);
	}

}
