#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


void subtracter(int *p){
 --*p;
}

void main(){
	printf("Introduce un numero mayor a 0: ");
	int var; 
	char input = scanf("%d",&var);
	subtracter(&var);
	printf("%d",var);
	fflush(stdout);
	while(var !=0){
		sleep(1);
		subtracter(&var);
		printf("%d",var);
		fflush(stdout);
	}
putchar('\n');
}
