#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <wait.h>

int main(int argc, char *argv[]){
	int rt;
	
	for(int i = 1; i <3; i++){
		rt = fork();
		if(rt == 0){
		if(i == 1)execl("/bin/ls", "ls", "-l",(char*)0);
		else execl("/bin/ps", "ps",(char*)0);
	}
	while(wait(NULL) > 0);
	}
}
