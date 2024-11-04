source("tema2/utils.R")

#32
#X -> radio de moneda -> N(10cm,2cm^2)
#a: P(x < 11) - P(x < 7.5)
#A -> p de que la moneda este entre 7.5 y 11
A <- pnorm(11,10,2) - pnorm(7.5,10,2)
#E[a] para n = 500
sims = rbinom(100000,500,A)
mean(sims)

#b
p <- 1-pnorm(10.5,10,2)
1-pnbinom(20,size = 10,p)
sims <- replicate(10000,{
  mean(rnbinom(10,10,p) > 20)
})
mean(sims)

sims <- replicate(10000,{
  gears <-  rnorm(2,10,2)
  big <- max(gears)
  small <- min(gears)
  if((big - small) > 2) 1
  else 0
})
mean(sims) 

#31
tomates <- rpois(10000,20)
defectuosos <- rbinom(10000,tomates,0.1)
mean(defectuosos)

#32
p <- 0.01
a <- pgeom(29,p,lower.tail = FALSE)
b <- (pgeom(49,p,lower.tail = FALSE))/(pgeom(19,p,lower.tail = FALSE)) 

#33
#X -> es erupcion larga -> binom
#larga -> norm(4,sqrt(0.15))
#corta -> norm(2,sqrt(0.2))
#f(x) = 0.6 * norm(4,sqrt(0.15)) + 0.4 * norm(2,sqrt(0.2))
b <- 0.4 * 2 + 0.6 * 4
c <- 0.6 * (1-pnorm(3,4,sqrt(0.15))) + 0.4 * (1-pnorm(3, 2,sqrt(0.2)))

#34
#Var[2X] = 4Var[X] = 4(25) = 100
1-pnorm(130,105,sqrt(200))

#37
p <- 0.15
pnbinom(90,10,0.15)

#38
p <- 0.7
l1 <- 1/10
l2 <- 1/5
#P(X = x) = 0.7/5 * exp(-x/5) + 0.03 * exp(-x/10)
