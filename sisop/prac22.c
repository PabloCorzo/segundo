#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>
#include <signal.h>
#include <fcntl.h>

int j = 0;
void router(){
	printf("ENTRANDO PARA J = %d\n",j);
	switch(j){
		case 2:
			int file = open("prac2.txt", O_CREAT | O_RDWR, 0666);
			sleep(1);
			break;
		case 3:
			char str[] = "Soy el proceso p3 y he recibido una senal de P5\n";
			write(1,str,48);
			//printf("%d",strlen(str));
			break;
		case 5:
			printf("He recibido una senal de mi proceso padre\n");
			break;
		case 6:
			char arr[] = "Soy p6\n";
			for(int i = 0; i < 7; i++)putchar(arr[i]);
			break;
		default:
			break;
	}
}
void main(){
	int rt;
	int rd;
	int wait();
	int k = 0;
	for(int i = 0; i < 4; i++){
		j++;
		rt = fork();
		//if is one of the two later children, it will fork again
		if(rt == 0 & i > 1){
			k++;
			rd = fork();
			if(rd == 0)j = j+2;
			break;
		}
		else if(rt == 0 & i <= 1){
			k++;
			break;
		}		
	}
	if(k == 0)j = 0;
		
	printf("soy el proceso %d,de i = %d y mi padre es %d\n",getpid(),j,getppid());	
	
	signal(SIGUSR1,router);
	
	sleep(3);
		
	if(j == 3)kill(rd,SIGUSR1);
	if(j == 5)kill(getppid(),SIGUSR1);
	
	sleep(10);
	
	while(wait(NULL) > 0);
	//if(father)printf("SOY EL PADRE, DE PID %d Y DE PPID %d \n",getpid(),getppid());	
	//else printf("soy el proceso %d,de i = %d y mi padre es %d\n",getpid(),j,getppid());
	
	
}
