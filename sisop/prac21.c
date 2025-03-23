#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>

void main(){


	//APARTADO B

	//en creacion de procesos primero se crea el padre y luego los hijos (ordenados segun el indice dado en el bucle de abajo)

	//en cuanto a la ejecucion, siempre iran los hijos primero porque el padre espera a que los hijos terminen de ejecutar:
	//p5,p6,p1 y p2 primero, luego p3 y p4, luego el proceso padre

	//APARTADO C
	


	int rt;
	int rd;
	//id para apartado c
	int c;
	int wait();
	int i;
	for(i = 0; i < 4; i++){
		rt = fork();
		if(rt == 0 & i < 3) c++;
		//if is one of the two later children, it will fork again
		if(rt == 0 & i > 1){
			rd = fork();
			break;
		}
		else if(rt == 0 & i <= 1){
		break;
		}		
	}
	
		if(rt == 0 & i == 3 & rd != 0) execl("/bin/ls","ls",(char*)0);
		while(wait(NULL) > 0);
		printf("soy el proceso %d y mi padre es %d\nmi id es %d\n",getpid(),getppid(),c);
	
}
