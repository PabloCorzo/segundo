#sin simulaciones:

#X = n de rubios en seleccion de 10
#X es binom(10, 0.75)
#P(X > 1)
#p = 1-pbinom(X<=2)
xprob = 1- pbinom(2,size = 10,prob = 0.075)
print(xprob)
#E[Y]
#Y = nbinom(x,prob = x,size = 5)
ys = 0:200
y = dnbinom(ys,size = 5, prob = xprob)
plot(ys,y)
#E[Y] = rq/p
(5*(1-xprob))/xprob

  
#SIMULACIONES
#Z = n veces X > 2
xs = 0:100
z = dbinom(xs,1000,prob =1-pbinom(2,size = 10,prob = 0.075))
plot(xs,z)
z2 = dnbinom(xs, size = )
#Un jurado de audiciones asociado a una productora musical necesita encontrar 5 nuevos grupos musicales compuestos por 10 integrantes. El jurado únicamente evalúa un requisito antes de aceptar al grupo: se requiere que haya al menos dos componentes rubios en el grupo. Teniendo en cuenta que el 7.5% de la población española es rubia y los grupos han sido formados al azar y de manera independiente sin repeticiones. ¿Cuántas entrevistas espera realizar el jurado? Resuelve CON y SIN simulaciones el ejercicio.


