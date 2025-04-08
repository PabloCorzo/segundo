#include <stddef.h>
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>

int vueltas = 1000000;
int c = 0;
bool turn = false;

void * process(void * args){

	bool add = *(bool *) args;
	for(int i = 0; i <= vueltas; i++){
		if(add){
			while(turn){}
			c = c + 1;
			turn = true;
		}
		if(!add){
			while(!turn){}
			c = c - 1;
			turn = false;
		}
		}
	}
}


void main(){
	
	pthread_t a,b;
	
	bool t = true;
	bool f = false;
	
	pthread_create(&a,NULL,process,(void *)&t);
	pthread_create(&b,NULL,process,(void *)&f);
	
	//pthread_join(a,NULL);
	//pthread_join(b,NULL);
	
	printf("%d\n",c);
}
