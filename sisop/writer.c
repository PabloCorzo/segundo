#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

void main(){

char message[] = "Timshel";
int fd;
fd = open("text.txt", O_CREAT | O_RDWR, 0666);
write(fd,message,strlen(message));
printf("printing... \n");
lseek(fd,0,SEEK_SET);
char c;
while(read(fd,&c,1) == 1){
	sleep(1);
	write(1,&c,1);
	fflush(stdout);
	}
putchar('\n');
}
