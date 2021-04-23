source("ReadingMPR.R")

HC_synthetic = read.csv("../Data/labeled_sample_1000000.csv")

D = 3
j = 0
h = c = theta = y = rep(0, B)

cotas.sup.x = readingMPR(D, 1)
cotas.sup.y = readingMPR(D, 2)
cotas.inf.x = readingMPR(D, 3)
cotas.inf.y = readingMPR(D, 4)

for(i in 1:B){
  index_sup = which(abs(cotas.sup.x - HC_synthetic$H[i]) == min(abs(cotas.sup.x - HC_synthetic$H[i])))
  index_inf = which(abs(cotas.inf.x - HC_synthetic$H[i]) == min(abs(cotas.inf.x - HC_synthetic$H[i])))
  
  max_cota_y = max(cotas.inf.y[index_inf], cotas.sup.y[index_sup])
  min_cota_y = min(cotas.inf.y[index_inf], cotas.sup.y[index_sup])
  
  index_C = which(HC_synthetic$C >= min_cota_y && HC_synthetic$C <= max_cota_y && HC_synthetic$Y == HC_synthetic$Y[i])
  
  if(length(index_C) > 0){
    j = j + 1
    theta[j] = HC_synthetic$Theta[i]
    y[j] = HC_synthetic$Y[i]
    h[j] = HC_synthetic$H[i]
    c[j] = HC_synthetic$C[as.integer(runif(n = 1, min = 1, max = length(index_C)))]
  }
}

df = data.frame(Theta = theta[1:j], H = h[1:j], C = c[1:j], Y = y[1:j])

write.csv(df, "../Data/adjusted_labeled_sample_1000000.csv")