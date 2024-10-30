source("tema2/utils.R")
source("utils.R")
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
#19

f19 <- function(x,y){
  if(x < 4 & (y-1) < 4 & (x+y) < 3) (x*y)/96
  else 0
}
f19 <- Vectorize(f19)
integrate2_dxdy(f19,function(y)0,function(y)4,1,5)
1/48

#20
f20 <- function(x,y){
  c * exp(-2*x) * exp(-3*y)
}
f20 <- Vectorize(f20)
#c = 6
#integrate2_dxdy(f20,function(y)1,function(y)3,0,Inf)$value
#integrate2_dydx(f20,3,Inf,function(x)0,function(x)(x-3))$value

#21
f21 <- function(x,y){
  if(x <= 1 & y <= 2) (3/5) *x*(x+y)
  else 0
}
f21 <- Vectorize(f21)
f21_x <- function(x){
  if(x <= 2) integrate(f21(x = x, y), 0, 2)$value
  else 0
}
f21_x <- Vectorize(f21_x)
EX = integrate(function(x) x * f21_x(x), 0, 1)$value

f21_y <- function(y){
  if(y <= 2) integrate(f21(x,y = y),0,1)$value
}
f21_y <- Vectorize(f21_y)
EY =integrate(function(y) y * f21_y(y), 0, 2)$value
EXY = EY +EX
E_XY <- integrate2_dxdy(function(x,y)x * y * f21(x, y), function(y)0, function(y)1, 0, 2)$value

#24
f24 <- function(x){
  if(x >= 0)exp(-x)
  else 0
}
f24 <- Vectorize(f24)
#e^-x representa una distribucion exponencial estandar, de lambda = 1, media 1/lambda y sd = 1/lambda^2

#26
f26 <- function(x,y){
  if(x <= 1 & y <= 1) x+y
  else 0
}
f26 <- Vectorize(f26)
#VAR[X] = E[X^2]-(E[X])^2
#funcion marginal de x: integrar respecto a y
fx26 <- function(x){
  if(x <= 1) x+0.5
  else 0
}
fx26 <- Vectorize(fx26)
r1 <- integrate(function(x) (x^2 * fx26(x)), 0, 1)$value
r2 <- (integrate(function(x) (x*fx26(x)),0,1)$value)^2
result <- r1-r2
#Cov[X,Y] = E[(X- mux)(Y-muy)]
E <- sqrt(r2)
covf <- function(x,y){
  (x-E)*(y-E)
}
covf <- Vectorize(cov)
cov <- integrate2_dxdy(cov,function(x)0,function(x)1,0,1)$value
#MULTIPLICAR LAS DOS RAICES DE LAS VARIANZAS; COMO SON IGUALES SE CANCELA Y QUEDA SOLO 1
corr <- cov/((11/144))


#28
#X <- n de pacientes que llegan al hospital
#Y <- n de pacientes que son ingresados
X <- rpois(n= 10000,5)
#EN VERDAD ES Y|X <- BINOM(x,0.1)
Y <- rbinom(n= 10000,X,0.1)
hist(Y)
#Funcion de distribucion: P(Y = y)
#se puede hacer mediante simulaciones o mediante manipulacion matematica
#Problema de árbol (probabilidad condicionada)
#sum(P(X = x)*P*(Y|X=x))
p_y <- function(y){
  xs <- 0:100
  sum(dpois(xs,5)*dbinom(y,xs,0.1))
}
p_y <- Vectorize(p_y)
ys <- p_y(0:20)
#P(X = n | Y = 10)
px_y10 <- function(n){
  pdenom <- p_y(10)
  pnum <- dpois(n,5) * dbinom(10,n,0.1)
  pnum/pdenom
}
px_y10 <- Vectorize(px_y10)
#E[X|Y = 10] = sum(xs * px_y10(xs))
E <- sum(0:1000 * px_y10(0:1000))

#40
#f(x) = exp(-x), lambda 1
#f(y) = 2*exp(-2*y) lambda 2
#se necesita la probabilidad conjunta, pero como son independientes se puede hacer un outer
#P(X > 2, Y > 2)
(1-pexp(2,1))*(1-pexp(2,2))
#c
#D: defectuosos al dia
#X: t hasta fallo
#1000
#D: Binom(1000,p(X< 1/52)) X se mide en años


#10
#3 bolas blancas
#5 bolas negras
#Orden y repeticion: PEPPER
#Con distincion y orden:
#LAPLACE: #CASOS FAVORABLES/#CASOS TOTALES
#TOTALES POR PEPPER(8!/(5!*3!))
totales <- choose(8,j)
#FAVORABLES
#X1 = 3, primera blanca en pos 3
#COMPLETAR:
#PEPPER: 2 NEGRAS Y 1 BLANCAS EN NNBNB
favorables <- choose(3,k)

#36
#X n tazas adivinadas