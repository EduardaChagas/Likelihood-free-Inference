source("ReadingMPR.R")

B = 100000
theta = runif(min = 1.3, max = 1.6, n = B)

p = 0.5
Y = rbinom(n = B, 1, p)

h = c = rep(0, B)

D = 3

cotas.sup.x = readingMPR(D, 1)
cotas.sup.y = readingMPR(D, 2)


cotas.inf.x = readingMPR(D, 3)
cotas.inf.y = readingMPR(D, 4)

i = 1
while(i <= B){
  if(Y[i] == 1){
    h[i] = rbeta(shape1 = theta[i]*(1000), shape2 = theta[i], n = 1)
    c[i] = rbeta(shape1 = theta[i], shape2 = theta[i]*(1000), n = 1)
  }
  if(Y[i] == 0){
    h[i] = rnorm(mean = 0.999, sd = 0.00083, n = 1)
    c[i] = rnorm(mean = 0.001, sd = 0.00082, n = 1)
  }
  
  index_sup = which(abs(cotas.sup.x - h[i]) == min(abs(cotas.sup.x - h[i])))
  index_inf = which(abs(cotas.inf.x - h[i]) == min(abs(cotas.inf.x - h[i])))
  
  if(h[i] <= 1 && c[i] >= 0){
    if(c[i] >= cotas.inf.y[index_inf] && c[i] <= cotas.sup.y[index_sup]){
      print(i)
      df = data.frame(Theta = theta[1:i], H = h[1:i], C = c[1:i], Y = Y[1:i])
      write.csv(df, paste0('../Data/labeled_sample.csv'))
      i = i + 1   
    }
  }
}
