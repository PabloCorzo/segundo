#ESTUDIO POLITICO 

polls <- read.csv("data/dummytest2.csv")
polls2 <- read.csv("data/dummytest2.csv")


polls$side <- factor(polls$side)
polls$category <- factor(polls$category)

contrasts(polls$category) <- contr.sum(4)
model <- glm(side ~ category,polls,family = "binomial")
summary(model)


car::Anova(model,type = 3)
pairs(
  emmeans(model,~category)
)
