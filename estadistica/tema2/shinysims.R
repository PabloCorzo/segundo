t <- 20
sims <- replicate(10000,{
  shiny <- rbinom(1,1,1/4096)
  while (!shiny) {
    t <- t + 20
    shiny <- rbinom(1,1,1/4096)
  }
  t
})
mean(sims)/3600

