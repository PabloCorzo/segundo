#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <wait.h>

void main(int argc, char *argv[]){

	int rt;
	rt = fork();
	
	
	//El primer parametro es el directorio del ejecutable (el classpath)
	//Los siguientes parametros son las diferentes "palabras" que se introducirian en terminal, terminadas por (char *) 0, que indica el final del comando
	if(rt == 0) execl("/bin/ls","ls","-l",(char *)0);
	
	while(wait(NULL) > 0);
}

