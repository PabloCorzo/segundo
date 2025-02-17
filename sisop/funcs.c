#include <stdio.h>

void func1(int u, int v);
void func2(int *pu, int *pv);

void main(){

int u = 1;
int v = 3;

printf("\nAntes de la llamada a func1: u=%d v=%d",u,v);
func1(u,v);
printf("\nDespues de la llamada a func1: u=%d v=%d" , u,v);
printf("\nAntes de la llamada a func2: u=%d v=%d",u,v);
func2(&u,&v);
printf("\nDespues de la llamada a func2: u=%d v=%d" , u,v);

}

void func1(int u, int v){
u = 0;
v = 0;
printf("\nDentro de func1: u=%d v=%d", u,v);
return;
}
void func2(int *pu, int *pv){
*pu = 0;
*pv = 0;
printf("\nDentro de func1: u=%d v=%d", *pu,*pv);
return;
}
