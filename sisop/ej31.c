#include <stdio.h>
#include <string.h>
#include <sys/types.h>

void main(){

	pid_t pid;
	pid = fork();
	if(pid == 0)printf("Soy el proceso hijo con PID %d y con PPID %D \n");
	else printf("Soy el proceso padre con PID %d y con PPID %D \n")
}
