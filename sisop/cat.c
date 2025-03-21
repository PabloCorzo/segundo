#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void main(int argc, char *argv[]){

	if(argc != 2)exit(0);
	
	int src = open(argv[1], O_CREAT | O_RDWR, 0666);
	
	char c;
	while(read(src,&c,1) == 1){
		write(1,&c,1);
	}
}
