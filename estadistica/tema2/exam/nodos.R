source("utils.R")
print("Ejercicio 1.3")
print("Apartado a")
print("X -> mensajes enviados que llegan -> binom(n,p = 0.3)")
print("Y -> transmisiones exitosas -> nbinom(3,p = binom(n,p = 0.3))")
print("E[X] = n*p. Para 10 mensajes enviados se espera que lleguen 3")
print("Entonces, se espera que no lleguen 7 de cada 10 enviados")
print("E[Y] = rq/p:")
(3*0.7)/0.3
print("Se espera necesitar enviar 7 mensajes")

print("Apartado b")
print("A = n de trafico procesado por A")
print("T = tiempo tardado en procesar el trafico")

pa <- 0.3
pb <- 0.7

N <- 10000
server <- rbinom(N,1,pa)
as <- sum(server)
bs <- length(server)-as
ta <- rexp(as,1/5)
tb <- runif(bs,1,7)
mean(ta < 3)
mean(tb < 3)
#P(A|T < 3)
print("P(A = 1|T < 3) = P(A = 1, T < 3)/P(T <3)")
print("es un problema de árboles, primero se decide el servidor y luego se calcula su tiempo")
print("Para P(A = 1| T < 3) calculo la media de simular muchos tráfico aleatorio y que el de a sea < 3")
num = (0.3 * pexp(3,1/5))
denom = (0.3 * pexp(3,1/5)) + (0.7*punif(3,1,7))
paste0("la probabilidad de que haya sido A es: ",num/denom)
