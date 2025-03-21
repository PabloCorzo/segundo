#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

void main(int argc,char *argv[]){

	//get file
	int fd = open(argv[2], O_CREAT | O_RDWR, 0666);
	//get word
	char word[strlen(argv[1])];
	strcpy(word,argv[1]);
	//words visited
	int place = 1;
	
	char c;
	char foo[100];
	int i = 0;
	while(read(fd,&c,1) == 1){
	//whitespace ascii = 32	
	if((int) c == 32){
		//for debugging
		//printf("Analyzing %s \n",foo);
		if (!strcmp(word,foo) == 1){
		printf("Encontrado %s en la posicion %i \n",word,place);
		exit(0);
		}
		for(int j = 0; foo[j] != '\0';j++)foo[j] = '\0';
		i = 0;
		place++;
	}
	else{
		foo[i] = c;
		i++;
	}
	
	}
	foo[i-1] = '\0';
	if (!strcmp(word,foo) == 1) printf("Encontrado %s en la posicion %i \n",word,place); 
	else printf("No se ha encontrado %s.", word);
}

