alpha = qnorm(1-0.01)
z = qnorm(0.99)
upper = 99-alpha*(15/10)
lower = 99+alpha*(15/10)

pieces = read.csv("all_data/all_data/data_1/pieces.csv")
hist(pieces$piece_size_cm)
alpha = 0.01/2
n = length(pieces$piece_size_cm)
(var(pieces$piece_size_cm)*(n-1))/qchisq(c(alpha,1-alpha),n-1)

#28 oct
pesos <- read.csv("all_data/all_data/data_2/homeo_weight_loss.csv")
t.test()
