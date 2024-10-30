#1
#X = Huevos puestos
#Y = Huevos que nacen

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
