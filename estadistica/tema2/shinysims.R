t <- 32
sims <- replicate(100,{
  shiny <- rbinom(1,1,1/8192)
  while (!shiny) {
    t <- t + 32
    shiny <- rbinom(1,1,1/8192)
  }
  t
})
mean(sims)/3600

