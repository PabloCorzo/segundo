iqs <- read.csv("finalprep/all_data/data_1/iq.csv")
alpha = (0.05)
z = qnorm(1-alpha)
upper = 99-z*(15/10)
lower = 99+z*(15/10)
99-qnorm(0.95)*1.5

pieces <- read.csv("finalprep/all_data/data_1/pieces.csv")
n = length(pieces$X)
upper = (n-1)*var(pieces$piece_size_cm)/qchisq(0.995,n-1)
lower = (n-1)*var(pieces$piece_size_cm)/qchisq(0.005,n-1)


ny <- read.csv("finalprep/all_data/data_1/new_york.csv")
t.test(ny$sleep_hours, conf.level = 0.96)$conf.int
