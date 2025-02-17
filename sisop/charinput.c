#include <stdio.h>

void main(void){
 
 //char input = getchar();
 //putchar(input);
 //putchar('\n');
 //also works
 //printf("%c",input);
 //putchar('\n');
 
 char nombre[20];
 int edad;
 float peso;
 
 // required to use addresses here and not values themselves.
 // nombre is the first direction of its array, thus & isnt necessary
 scanf("%s %d %f", nombre, &edad, &peso);
 
 printf("%s", nombre);
 putchar('\n');
  
}
