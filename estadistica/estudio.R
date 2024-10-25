source("tema2/utils.R")
#5
f5 <- function(x,y){
  ifelse(((x==1|x==2|x==3)&(y==1|y==2|y==3)),yes=x*y,no=0)
}
f5 = Vectorize(f5)
c= 1/(1+2+3+2+4+6+3+6+9)

#8
pbinom(30,400,0.1)
pbinom(50,400,0.1) - pbinom(29,400,0.1)
1-pbinom(64,400,0.1)
#9
choose(5,3)*3*2
choose(5,2)*4

#11
fu <- function(x){
  ifelse(x<0,0,3*exp(-3*x))
}
fu = Vectorize(fu)
integrate(fu,0,1)
1-exp(-3)

#12
fu <- function(x){
  if(1 <= x & x <= 2) return ((6/29) * (x^2))
  if(2 <= x & x <= 3) return ((6/29) * x)
  if(x < 0) return (0)
  else return (0)
}
fu = Vectorize(fu)
c = 1/(integrate(fu,1,2)$value +integrate(fu,2,3)$value)
integrate(fu,2,Inf)$value
integrate(fu,1,1.5)$value
19/116
#15
fu <- function(x){
  if(x >= 27) k*27^4/x^2
  else k*x^2
}
fu = Vectorize(fu)
integrate(fu,0,100)$value
p = 0 
i = 100
while (p < 0.95) {
   i = i+1
   p = integrate(fu,0,i)$value
}
#406
integrate(fu,0,405)
#k = 1/integrate(fu,0,Inf)$value

#16
fu <- function(x,y){
  if(x <= 1 & y <= 1) c*(x^2 + y^2)
  else 0
}
fu = Vectorize(fu)

integrate2_dxdy(fu,function(y)0,function(y)0.5,0.5,1)

integrate2_dxdy(fu,function(y)0.25,function(y)0.75,0,1)
29/64

integrate2_dxdy(fu,function(y)0,function(y)1,0,0.5)
5/16

  #c = 1/integrate2_dxdy(fu,function(y)0,function(y)1,0,1)$value
