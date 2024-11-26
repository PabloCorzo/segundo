library("easystats")
library("tidyverse")
library("readr")
theme_set(theme_bw())  # cambia el tema de ggplot

#REGRESION
#Explanatory modeling 
#Predictive modeling

#regresion simple
#regresion lineal
#y = a + b * x + ∈
#∈ = ruido (de tipo gausiano)
#altura = a+b*edad + ∈ (altura media por edad)

age <- seq(0,12,0.1)

#straight line, the mean
mean_height <- 50+6.5*age

#generate noise
epsilon <- rnorm(length(mean_height),sd = 5)
height <- mean_height + epsilon

df = data.frame('age' = age,'height' = height,'mean height' = mean_height)
ggplot(df, aes(x = age, y = height)) + 
  geom_point() + 
  geom_line(aes(y = mean_height), col = 2)


#crear modelo lineal
#height ~ age -----> Height depends on age
naive_model <- lm(height ~ age, data = df)
summary(naive_model)
# 3) Obtener predicciones del modelo lineal
preds = predict(naive_model, interval = "confidence")
data_and_preds = bind_cols(df, preds)
ggplot(data_and_preds, aes(x = age)) + 
  geom_point(aes(y = height)) + 
  geom_line(aes(y = mean_height, col = "Expected")) + 
  geom_line(aes(y = fit, col = "Predicted")) + 
  geom_ribbon(aes(ymin = lwr, ymax = upr), alpha = 0.2, fill = "black")
x


#nov 22
library("ggplot2")
howell <- read.csv("data/howell1.csv",sep = ";")
howell$male <- factor(howell$male)
hist(mujeres)
#X = peso de un hombre adulto
#Y = peso de una mujer adulta
hombres <- howell[howell$male == 1,]$weight
mujeres <- howell[howell$male == 0,]$weight
t.test(hombres,mujeres,var.equal = T)
#los datos aportan bastante evidencia para afirmar que hay mayor peso de media entre hombres que entre mujeres (poblaciones adultas)
#pvalor = 2.2e-16, por lo que es 0, en la hipotesis de que sean iguales las 2 poblaciones
#de media se espera que la diferencia esté entre 7.9 y 5.6 kgs, teniendo los hombres más que las mujeres con 95% de confianza
#las medias observadas son 41.8 en las mujeres y 48.61 en los hombres




