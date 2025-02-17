#include <stdio.h>
#include <stdlib.h>

void main(int argc, char *argv[]){

  if(argc != 3){
    printf("Argumentos invalidos.");
    exit(0);
  }
  
  else printf("%d\n",atoi(argv[1]) * atoi(argv[2]));
}
