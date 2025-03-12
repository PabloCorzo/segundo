# 1
# 100 parejas 
# 14 personas seleccionadas

choose(100,14) * 2^14 / choose(200,14)

compute_prob <- function(caramelos,sims){
  tries <- replicate(sims,{
    x <- sample(1:4,caramelos,replace = T)
    x <- table(x)
    all(x > 1) && length(x) == 4
  })
  mean(tries)
}
compute_prob <- Vectorize(compute_prob)

probs <- compute_prob(1:25,1000)
probs


# 3
#X -> N de mensajes enviados hasta conseguir 3 exitosos -> negbinom(3,0.3)
#E[X] = rq/p = 3 * 0.7/0.3
(3*0.7)/0.3

N <- 5000
x <- rbinom(N,1,0.7)
y <- ifelse(
  x == 0,
  rexp(N,1/5),
  runif(N,1,7)
)
denom <- mean(y < 3)
num <- mean((x == 0) & (y < 3))
num/denom
