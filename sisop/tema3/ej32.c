#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <fcntl.h>

void main(){
	
	int fd = open("ej32.txt", O_CREAT | O_RDWR |O_TRUNC,0666);

	char c[] = "SOY EL PADRE";
	for(int i = 0; i < 12; i++) write(fd,(c+i),1);	
	int rd = fork();
	
	if(rd == 0){
	lseek(fd,13,SEEK_SET);
	char c2[] = "soy el hijo";
	for(int i = 0; i < 11; i++) write(fd,(c2+i),1);
	}
	}
