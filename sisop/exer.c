#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <wait.h>

int main(int argc, char *argv[]){
	int rt;
	rt = fork();
	if(rt == 0) execl("/bin/ls", "ls", "-l",(char*)0);
	while(wait(NULL)>0);			
	if(rt != 0) execl("/bin/ps", "ps",(char*)0);
	
	//wait null returns number of child processess, thus the father will always go last
	printf("Hola\n");
}
