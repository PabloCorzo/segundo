#include <stdio.h>
#include <unistd.h>
#include <pthread.h>
#include <stddef.h>

void *process(void *args){
	
	printf("%s",(char *) args);
	fflush(stdout);
	pthread_exit(0);

}


void main(){

	pthread_t ta, tb;
	
	pthread_create(&ta,NULL,process,"Hello ");
	pthread_create(&tb,NULL,process,"World ");	
	sleep(1);
}
