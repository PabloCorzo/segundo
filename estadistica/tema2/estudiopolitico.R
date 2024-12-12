#ESTUDIO POLITICO 

#Google forms con 40 entradas
polls <- read_csv("data/Unifacha.csv")

#Media global. el valor(0.7) significa que el 70% votaron derecha
mean <- sum(polls$side)/40

#Factorizamos los resultados
polls$side <- factor(polls$side)
polls$category <- factor(polls$category)


#Comparamos contrastes entre la media de cada carrera con la global(hay 8 carreras en el forms)
contrasts(polls$category) <- contr.sum(8)


#Generamos modelo de regresión logística
zmodel <- glm(side ~ category,polls,family = "binomial")

#Comparación diferencia significativa entre carreras
summary(zmodel)

#Comparación global
car::Anova(zmodel,type = 3)
pairs(
  emmeans(zmodel,~category)
)
