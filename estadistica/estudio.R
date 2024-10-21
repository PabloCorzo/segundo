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
  if(x < 0) 0
  if(2 <= x & x <= 3) x
  if(1 <= x & x <= 2) x^2
}
fu = Vectorize(fu)
integrate(fu,-Inf,Inf)$value
