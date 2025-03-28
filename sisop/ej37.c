#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <stdio.h>

#define VUELTAS 1000000000

void Salir(int sig){
	switch(sig){
		case(SIGTERM):
			printf("Saliendo por SIGTERM.\n");
			exit(EXIT_SUCCESS);
			break;
		case(SIGINT):
			printf("Saliendo del programa al recibir la senal SIGINT\n");
			exit(EXIT_SUCCESS);
			break;
	}
}

void main(){

	int i;
	signal(SIGTERM,Salir);
	signal(SIGINT,Salir);
	for(i = 0; i < VUELTAS; i++){}
	printf("Fin del programa sin recibir la senal SIGTERM\n");
	exit(EXIT_SUCCESS);
	
}
