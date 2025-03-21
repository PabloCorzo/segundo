#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <stdio.h>

int rd = 1;

void signaler(int sig){
	if(rd == 0){
	printf("Signal SIGUSR1 Recibida Por Nieto\n%d\n",getppid());
	kill(getppid(),SIGUSR2);
	}
	else{
	if(sig == SIGUSR2){
		printf("HIJO RECIBIO SIGUSR2");
		exit(EXIT_SUCCESS);
	}
	printf("Signal SIGUSR1 RECIBIDA POR HIJO\n");
	kill(rd,SIGUSR1);
	}
}

void main(){
	int rt = fork();
	if(rt == 0){
	printf("%d\n",getpid());
	rd = fork();
	signal(SIGUSR1,signaler);
	if(rd == 0){
		signal(SIGUSR1,signaler);
	}
	signal(SIGUSR2,signaler);
	}
	sleep(20);
	//while(wait(NULL)>0);
}
