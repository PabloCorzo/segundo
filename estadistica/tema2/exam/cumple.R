source("utils.R")+
print("Ejercicio 1.2")
print("Apartado a")
compute_prob <- function(n_caramelos, n_sims){
  sims <- replicate(n_sims,{
    foo <- rmultinom(n_sims,n_caramelos,c(0.25,0.25,0.25,0.25))
    min(foo) < 2
  })
  mean(sims)
} 

compute_prob <- function(n_caramelos, n_sims){
  sims <- replicate(n_sims,{
    caramelos = sample(1:4,n_caramelos,replace = T)
    tabla <- table(caramelos)
    all(tabla >= 2 & length(tabla) == 4)
  })
  mean(sims)
}

print("Apartado b")
caramelos <- 0
prob <- 0
while(prob < 0.95){
  caramelos <- caramelos + 1
  prob <- compute_prob(caramelos,1000)
}
caramelos 
paste0("tras 1000 simulaciones se concluye que se necesitarian ",caramelos," caramelos para que la probabilidad sea mayor que 95%")
