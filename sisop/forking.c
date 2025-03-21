#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>

void main(){

	int rt;
	printf("Proceso padre, de ppid %d y de pid %d \n",getppid(),getpid());
	for(int i = 0; i <= 7; i++){
		rt = fork();
		//!= for chain, == for 1 gen
		if(rt != 0){
		printf("Proceso de padre %d y de pid %d y de indice %d\n",getppid(),getpid(),i+1);
		break;
		}
	}
	
//	if(getppid() == 0) printf("Soy el hijo y mi PID es %i \n mi ppid es %d \n",getpid(),getppid());
//	else printf("Soy el padre y mi PID es %i \n mi ppid es %d \n",getpid(),getppid());
		
sleep(1);
}

