#empresa hace chips a y b. chip a es barato
#2 muestras tamaño 16 y 10 y sus varianzas muestrales son 24 y 18
#nivel de confianz del 98%. Que metodo es preferible?

a <- rnorm(16)
mean(a)
sd(a)

#standarizar la variable
z_a <- ((a-mean(a))/sd(a))
mean(z_a)
sd(z_a)

#por sd mas media
a <- z_a * sqrt(24) + 10

mean(a)
var(a)

b <- rnorm(10)

z_b <- (b-mean(b))/sd(b)

b <- z_b * sqrt(18) + 10
mean(b)
var(b)

#32
#medicina funcione en 8h con 90% (claim). En muestra de 200 alivia a 160
#a: sospechas que la afirmacion del fabricante no es cierta.
#Determina si la afirmacion del fabricante es legitima usando un 1% como nivel de significacion
#H0: para X: n pacientes aliviados ~ Binom(200,p), p >= 0.9
#Ha: para X: n pacientes aliviados ~ Binom(200,p), p < 0.9
binom.test(160,200,p = 0.9,alternative = "less",conf.level = 0.99)
#hay mucha evidencia en contra de las afirmaciones del fabricante:
#es inverosimil que cure al mas del 90% de los pacientes (p_valor al orden de 10^-5)
#la media se comprende con un 99% de garantia entre 0% y 86%
#la media observada en los datos es de 0.8


#19
#estimar mediane un IC al 99% de las vacas sanas y enfermas. datos en cows.csv
#se puede asumir que las varianzas poblacionales son iguales
#diferencia de medias de peso: ttest

library("ggplot2")
cows <- read.csv("data_exercises/cows.csv")
cows$healthy <- factor(cows$healthy)
sane <- cows[cows$healthy == T,]
crazy <- cows[cows$healthy == F,]

#normalidad: histogramas
ggplot(cows,aes(x = weight_grams, fill = healthy)) +geom_density(alpha=0.5)
t.test(sane$weight_grams,crazy$weight_grams,var.equal = T,conf.level = 0.99)

#Independencia de muestras: asumimos poblacion infinita bla bla bla 

#para asumir independencia de poblaciones hay que asumir que vienen de diferentes granjas para que no haya influencia

#40
#casa farmaceutica produce pastilla con sd muy pequena. nuevo metodo solo se acepta si la sd
#del metodo es menor que o.4mg
#10 medicamentos con media de 5.724 y sd de 0.35. nivel de significacion del 1%
#hay evidencia que apoye el nuevo metodo?
#X: peso de las pastillas con el nuevo metodo
#H0: var del nuevo metodo >= 0.4^ xxxxxxxxxx
#H0: var del nuevo metodo = 0.4 (caso mas dificil de distinguir)
#Ha: var del nuevo metodo < 0.4^2
#Se opera con varianzas para poder usar qchisq

mu <- 5.724
dv <- 0.35
#Varianza muestral S^2: (n-1)S^2/sd^2 ~ X^2(n-1)
est <- 9*(0.35^2)/0.4^2
#p_value = p de obtener eventos tan o mas extremos como los observados
pval <- pchisq(est,9)
#no hay evidencia suficiente que poye que el nuevo metodo sea mejor(la varianza no es significativamente menor que en el metodo anterior)  
  
  
  
  
  
  
  


