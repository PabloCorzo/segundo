
accidentes <- read.csv("all_data/all_data/accidents.csv")$x
media <- mean(accidentes)


media + c(1,-1) * qnorm(0.01) * sqrt(media/n)

#n <- length(accidentes)
#top <- media - qnorm(0.01)*sqrt(media/n) 
#bottom <- media + qnorm(0.01)*sqrt(media/n) 
#paste0(bottom , "  " , top)

library("ggplot2")
juries <- read.csv("all_data/all_data/data_4/juries.csv")
ggplot(juries,aes(x = race,fill = race)) + geom_bar()
#H0: p >= 0.5
#Ha: p < 0.5
table(juries$race)
binom.test(x = 4, n = 76 + 4, alternative = "less",p = 0.5)
#el p valor es practicamente 0
#Conclusion: los datos aportan mucha evidencia de que la seleccion de jurados no es al azar,
#con un sesgo en contra de la gente afroamericana (p_valor = 0) Putos racistas ~Tino.

#Conversion = user clicks buy now
#A|B testing
#Variables:
#A: n de conversiones en la web version A 
#B: n de conversiones en la web version B 

#H0: pb <= pa
#Ha: pb > pa
library("ggplot2")
abt <- read.csv("all_data/all_data/data_4/ab_testing.csv")
abt$has_clicked <- factor(abt$has_clicked)

ggplot(abt,aes(x = page_design, fill = has_clicked)) + geom_bar(position = "fill")

#PARA 2 POBLACIONES USAR PROPTEST
counts <- table(abt)
#Ha: pnew > pold. EL ORDEN IMPORTA YA QUE PUEDE INVERTIR EL RESULTADO
prop.test(x = c(272,206), n = c(837+272,806+206), alternative = "greater")
#conclusion: los datos apoyan que la nueva pagina es mas efectiva a la hora de convertir usuarios (p_valor = 0.012)
#lograra convertir como minimo un 1,5% mas que la pagna anterior (IC al 95%) 
#el incremento medio es de 4.7% (sample estimates)