library(readr)
iqs_df <- read.csv("all_data/all_data/data_1/iq.csv")
mean(iqs_df$iq)
#la media es 99 cuando lo habitual es 100
#se debe a la varianza de la muestra aleatoria
hist(iqs_df$iq)
