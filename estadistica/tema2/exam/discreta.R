source("utils.R")
print("Apartado a")
fxy_u <- function(x,y){
  if(x * y == 12) (x^2)+(2*(y^2))
  else 0
}
fxy_u <- Vectorize(fxy_u)
#casos: 12*1,6*2,4*3,1*12,2*6,3*4 y negativos
xs <- c(-12,-6,-4,-3,-2,-1,1,2,3,4,6,12)
ys <- c(-12,-6,-4,-3,-2,-1,1,2,3,4,6,12)
tabla_u <- outer(xs,ys,fxy_u)
c <- 1/sum(tabla_u)
fxy <- function(x,y){
  c * fxy_u(x,y)
}
fxy <- Vectorize(fxy)
tabla<- (outer(xs,ys,fxy))
sum(tabla)
print("c debe ser correcto ya que la suma de la funcion normalizada es 1")
print("Apartado b")
integrate2_dxdy(fxy,function(x)-Inf,function(y)y+5,-Inf,Inf)$value

print("apartado c")
print("la probabilidad de cada valor x e y se hace ejecutando colSums y rowSums")
rowSums(tabla)
colSums(tabla)

print("apartado d")
#si son independientes se puede calcular E[XY] como E[X]*E[Y]
fy <- function(y){
  sum(fxy(-12:12,y))
}
fx <- function(x){
  sum(fxy(x,-12:12))
}
Ex <- sum(-12:12,fx(-12:12))
Ey <- sum(-12:12,fy(-12:12))
paste0("E[X+Y] es igual a: ", ex+ey)
print("Son independientes")
paste0("E[XY] es igual a: ", ex*ey)
