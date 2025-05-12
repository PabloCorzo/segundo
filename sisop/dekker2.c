#include <stddef.h>
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
int vueltas = 1000000;
int c = 0;
bool state[2];

void * process(void *args){
	
	bool adds = *(bool *) args;
	
	for(int i = 0; i <= vueltas; i++){
		if(add){
			while(state[1]);
			state[0] = true;
			c = c + 1;
			state[0] = false;
		}
		else{
			while(state[0]);
			state[1] = true;
			c = c - 1;
			state[1] = false;
		}
	}
}

void main(){
	state[0] = false;
	state[1] = true;
	
	p_thread_t a,b;
	
	bool t = true;
	bool f = false;
	
	pthread_create(&a,NULL,process,(void *)&t);
	pthread_create(&b,NULL,process,(void *)&f);
	
	pthread_join(a,NULL);
	pthread_join(b,NULL);
	
}
