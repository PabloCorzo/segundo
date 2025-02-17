#include <stdio.h>
#include <stdlib.h>
// /^1?$|^(11+?)\1+$/ -> unary input regex for prime checks

void main(int argc, char *argv[]){

	if(argc != 2){
		printf("Argumento invalido");
		exit(0);
	}
	if(atoi(argv[1]) == 1 || atoi(argv[1]) == 2){
		printf("Es primo.\n");
		exit(0);
	}
	int foo = atoi(argv[1]);
	int i = 2;
	while(i < foo){
		if(foo%i == 0){
			printf("No Es primo.\n");	
			exit(0);
		}
		i++;
	}
	printf("Es primo. \n");
}
