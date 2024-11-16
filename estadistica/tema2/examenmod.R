#1
#X = Huevos puestos
#Y = Huevos que nacen
source("C:/Users/Usuario/segundo/estadistica/tema2/utils.R")

p <- 0.35
lambda <- 100

py_x <- function(y,x){
  dbinom(y,x,p)
}
py_x <- Vectorize(py_x)
#a
huevos <- 0:10
plot(py_x(huevos,10),type = "h")
esperanza <- sum(huevos*py_x(huevos,10))
moda <- which.max(py_x(huevos,10)) -1
#b
N <- 100000
sims <- replicate(N,{
  nhuevos <- rpois(1,lambda)
  nacidos <- rbinom(1,nhuevos,p)
  if(nacidos > 50) 1
  else 0
})
prob <- mean(sims)

#c
py <- function(y){
  x <- 0:200
  px <- dpois(x,lambda)
  pyx <- py_x(y,x)
  sum(px*pyx)
}
py <- Vectorize(py)

y <- 50

px_y <- function(x,y){
  py_x(y,x) * dpois(x,lambda) / py(y)
}
px_y <- Vectorize(px_y)
plot(0:200,px_y(0:200,y),type = "h")
moda <- which.max(px_y(0:200,y)) - 1
esp <- sum(0:200*px_y(0:200,y))

#2
#X -> paquetes de los 100 enviados con aire
#P(X > 3) = 1- P (X <= 3
#X es Binom con p = 0.03 y n = 100)
n <- 100
p <- 0.03
a <- 1-pbinom(3,n,p)
#n max para que P(X > 3) sea menor que 5%
prob <-  0
n <- 0
while (prob < 0.05) {
  n <- n + 1
  prob <- 1-pbinom(3,n,p)
}
max <- n - 1

#3 
#X -> duracion comp 1 en años
#Y -> duracion comp 2 en años
fu <- function(x,y){
  if(x >= 0 & y >= 0)exp(-3*x)*y*exp(-y^2)
  else 0
}
fu <- Vectorize(fu)
c <- 1/integrate2_dxdy(fu,function(x)0,function(x)Inf,0,Inf)$value
#redondeo a 6
c <- 6
f <- function(x,y){
  if(x >= 0 & y >= 0)c*exp(-3*x)*y*exp(-y^2)
  else 0
}
f <- Vectorize(f)
b <- integrate2_dxdy(f,function(x)1,function(x)3,1,3)$value
#C: comp 2 dura 1 año mas que comp 1 (X + 1)
C <- integrate2_dydx(f,0,Inf,function(x)x+1,function(x)Inf)$value

#4
pa <- 0.2
pb <- 0.5
pc <- 0.3
ta <- 3
tb <- 5
tc <- 3
adder <- 0.5
t <- 0
tries <- 0
#X camino escogido (A,B,C)
sims <- replicate(1000000,{
  
  camino <- which.max(rmultinom(1,1,c(pa,pb,pc)))
  if(camino == 1) t <- t + ta
  else if(camino == 2) t <- t + tb
  else if(camino == 3) t <- t + tc
  
  while (camino != 3) {
    tries <- tries + 1
    camino <- which.max(rmultinom(1,1,c(pa,pb,pc)))
    if(camino == 1) t <- t + ta + (adder*tries)
    else if(camino == 2) t <- t + tb + (adder*tries)
    else if(camino == 3) t <- t + tc + (adder*tries)
  }
  
  t
})
mean(sims)
