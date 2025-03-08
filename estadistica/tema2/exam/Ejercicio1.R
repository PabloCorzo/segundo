print("Ejercicio 1.1")
#n <- 100
#100 parejas <- 200 personas
#prob no pareja en primera persona es 1, luego 198/199, luego 197/199
#198/199 hasta 186/187
nums <- 186: 198
denoms <- 187:199
individual_probs <- nums/denoms
total_prob <- prod(individual_probs) 
paste0("La probabilidad total de que en 14 personas aleatorias no haya parejas es de: ",total_prob)
