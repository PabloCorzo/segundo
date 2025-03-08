#include <stdio.h>
#include <stdlib.h>
// /^1?$|^(11+?)\1+$/ -> unary input regex for prime checks

void main(int argc, char *argv[]){

	//executable got called with invalid amount of args
	if(argc != 2){
		printf("Argumento invalido");
		exit(0);
	}
	//if input is either 1 or 2 its handled separately
	int foo = atoi(argv[1]);
	if(foo == 1 || foo == 2){
		printf("Es primo.\n");
		exit(0);
	}

	//check for a perfect divider: if found its not prime
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
