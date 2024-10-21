source("tema2/utils.R")
#5
f5 <- function(x,y){
  ifelse(((x==1|x==2|x==3)&(y==1|y==2|y==3)),yes=x*y,no=0)
}
f5 = Vectorize(f5)
c= 1/(1+2+3+2+4+6+3+6+9)
