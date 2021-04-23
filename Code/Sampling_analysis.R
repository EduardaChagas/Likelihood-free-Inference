########################################################################################################
# Author: Eduarda Chagas
# Date : Apr 21, 2020
# Contact: eduarda.chagas@dcc.ufmg.br
########################################################################################################

# Packages and sources ---------------------------------------------------------------------------------
if(!require(ggplot2)){
  install.packages("ggplot2")
  require(ggplot2)
}
if(!require(ggthemes)){
  install.packages("ggthemes")
  require(ggthemes)
}

HC_total = read.csv("../../HC/HC_1000.csv")[,2:4]
HC_3 = HC_total[which(HC_total$D == 3), 1:2]

HC_synthetic = read.csv("../Data/adjusted_labeled_sample_100000.csv")

HC_beta = HC_synthetic[which(HC_synthetic$Y == 1),]
HC_gaussian = HC_synthetic[which(HC_synthetic$Y == 0),]

png("HC_total.png", width = 600, height = 900)
ggplot(data = HC_3, aes(x = H, y = C)) +
  geom_point(size = 1.5, alpha = .8, color = "black") +
  geom_point(data = HC_beta, aes(x = H, y = C), color = "red", alpha = .8) +
  geom_point(data = HC_gaussian, aes(x = H, y = C), color = "blue", alpha = .8)
dev.off() 

png("HC_true.png", width = 600, height = 900)
ggplot(data = HC_3, aes(x = H, y = C)) +
  geom_point(size = 1.5, alpha = .8, color = "black")
dev.off() 

png("HC_beta.png", width = 600, height = 900)
ggplot(data = HC_beta, aes(x = H, y = C)) +
  geom_point(size = 1.5, alpha = .8, color = "red") 
dev.off() 

png("HC_gaussian.png", width = 600, height = 900)
ggplot(data = HC_gaussian, aes(x = H, y = C)) +
  geom_point(size = 1.5, alpha = .8, color = "blue") 
dev.off() 