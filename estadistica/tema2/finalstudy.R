#1
p <- 0.35
lambda <- 100
#a
#X -> N huevos puestos en una flor
#Y -> N huevos puestos del que nace insecto
#para X = 10:
py_x <- function(y,x){
  dbinom(y,x,p)
}
py_x <- Vectorize(py_x)
x=10
y = 0:x
plot(py_x2(y,x),type = "h")
#E[Y|X = 10]
sum(y * py_x(y,10))
moda <- which.max(y * py_x(y,10))-1

#b
#prob nazcan mas de 50 
sims <- replicate(100000,{
  puestos <- rpois(1,lambda)
  nacen <- rbinom(1,puestos,p)
  if(nacen > 50) 1
  else 0
})
mean(sims)

#c
py <- function(y){
  sum(dbinom(y,0:200,p)*dpois(0:200,lambda))
}
px_y <- function(x,y){
  (py_x(y,x)*dpois(x,lambda))/py(y)
}
py <- Vectorize(py)
px_y <- Vectorize(px_y)
probs <- px_y(0:200,50)
plot(probs)
E <- sum(0:200*px_y(0:200,50)) 
moda <- which.max(px_y(0:200,50))


#2
#a
p <- 0.03
n <- 100
1-pbinom(3,n,p)

#
paquetes <- 0
prob <- 0
while(prob < 0.05){
  paquetes <- paquetes + 1
  prob <- 1-pbinom(3,paquetes,p)
}
paquetes <- paquetes - 1
paquetes

#3
fxy_u <- function(x,y){
  if(x < 0) 0
  else exp(-3*x) * y * exp(-y^2)
}
fxy_u <- Vectorize(fxy_u)
source("utils.R")
c = round(1/integrate2_dxdy(fxy_u,function(x)0,function(x)Inf,0,Inf)$value)
#b: 1 < x,y < 3
fxy <- function(x,y){
  if(x < 0) 0
  else c* exp(-3*x) * y * exp(-y^2)
}
fxy <- Vectorize(fxy)
integrate2_dxdy(fxy, function(x)1,function(x)3,1,3)$value
#c
integrate2_dydx(fxy,0,Inf,function(x) x+1,function(x) Inf)$value
