#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <stdio.h>

void salir(int sig){
	if(sig == SIGINT){
		printf("\nSIGINT RECIBIDO \n");
		exit(EXIT_SUCCESS);
	}
}

int main(){
	signal(SIGINT, salir);
	
	for(int i = 0; i < 20;i++){sleep(1);}
	printf("No llego la senal a tiempo");
}
