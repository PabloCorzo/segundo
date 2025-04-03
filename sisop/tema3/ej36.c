#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>

void main(){

	int rt;
	printf("Proceso padre, de ppid %d y de pid %d \n",getppid(),getpid());
	for(int i = 0; i <= 2; i++){
		rt = fork();
		
		//!= para ejercicio 4, == para ejercicio 3
		if(rt != 0){
   			if(i == 1) execl("/bin/ls","ls",(char *)0);
		break;
		}
		if(rt == 0 && i == 2)execl("/bin/ps","ps",(char *)0);
	}
	
//	if(getppid() == 0) printf("Soy el hijo y mi PID es %i \n mi ppid es %d \n",getpid(),getppid());
//	else printf("Soy el padre y mi PID es %i \n mi ppid es %d \n",getpid(),getppid());
		
sleep(1);
}

