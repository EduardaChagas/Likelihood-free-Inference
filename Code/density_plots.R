if(!require(ggplot2)){
  install.packages("ggplot2")
  require(ggplot2)
} 
if(!require(ggthemes)){
  install.packages("ggthemes")
  require(ggthemes)
}
if(!require(EnvStats)){
  install.packages("EnvStats")
  require(EnvStats)
}

HC_total = read.csv("../../HC/HC_1000.csv")[,2:4]
#HC_total = read.csv("../../HC/HC_50k.csv")[,2:4]

HC_3 = HC_total[which(HC_total$D == 3), 1:2]
x = HC_3$H
y = HC_3$C
df_C = data.frame(x = HC_3$C)
df_H = data.frame(x = HC_3$H)

pdf("Complexity_density.pdf", width = 8, height = 6)
ggplot(data = data.frame(x = 0:1)) +
  geom_density(data = df_C, aes(x = x)) +
  ylab('Density') + labs(color = "Distributions") + ggtitle('Statistical Complexity Density') +
  theme_classic(base_size = 12, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))
dev.off() 

pdf("Entropy_density.pdf", width = 8, height = 6)
ggplot(data = data.frame(x = 0:1)) +
  geom_density(data = df_H, aes(x = x)) +
  ylab('Density') + labs(color = "Distributions") + ggtitle('Shannon Entropy Density') +
  theme_classic(base_size = 12, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))
dev.off() 

beta_shannon = ebeta(x, method = "mle")
beta_complexity = ebeta(y, method = "mle")

gamma_shannon = egamma(x, method = "mle")
gamma_complexity = egamma(y, method = "mle")

lnorm_shannon = elogis(x)
lnorm_complexity = elogis(y)

norm_shannon = enorm(x)
norm_complexity = enorm(y)

pdf("Entropy_distribution.pdf", width = 8, height = 6)
ggplot(data = data.frame(x = seq(0.99, 1, by = 0.001))) +
  stat_function(fun = dbeta, args = list(shape1 = beta_shannon$parameters[2] * 1000, shape2 = beta_shannon$parameters[2]), aes(x = x, color = 'Beta')) +
  #stat_function(fun = dbeta, args = list(shape1 = beta_shannon$parameters[1], shape2 = beta_shannon$parameters[2]), aes(x = x, color = 'Beta')) +
  #stat_function(fun = dgamma, args = list(shape = gamma_shannon$parameters[1], scale = gamma_shannon$parameters[2]), aes(x = x, color = 'Gamma')) +
  stat_function(fun = dlogis, args = list(location = lnorm_shannon$parameters[1], scale = lnorm_shannon$parameters[2]), aes(x = x, color = 'Logistic')) +
  stat_function(fun = dnorm, args = list(mean = norm_shannon$parameters[1], sd = norm_shannon$parameters[2]), aes(x = x, color = 'Normal')) +
  geom_density(data = df_H, aes(x = x, color = 'Empirical Distribution')) +
  ylab('Density') + labs(color = "Distributions") + ggtitle('Shannon Entropy Estimation') +
  theme_classic(base_size = 12, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))
dev.off() 

pdf("Complexity_distribution.pdf", width = 8, height = 6)
ggplot(data = data.frame(x = seq(from = 0, to = 0.01, by = 0.001))) +
  stat_function(fun = dbeta, args = list(shape1 = beta_shannon$parameters[2], shape2 = beta_shannon$parameters[2] * 1000), aes(x = x, color = 'Beta')) +
  #stat_function(fun = dbeta, args = list(shape1 = beta_complexity$parameters[1], shape2 = beta_complexity$parameters[2]), aes(x = x, color = 'Beta')) +
  #stat_function(fun = dgamma, args = list(shape = gamma_complexity$parameters[1], scale = gamma_complexity$parameters[2]), aes(x = x, color = 'Gamma')) +
  stat_function(fun = dlogis, args = list(location = lnorm_complexity$parameters[1], scale = lnorm_complexity$parameters[2]), aes(x = x, color = 'Logistic')) +
  stat_function(fun = dnorm, args = list(mean = norm_complexity$parameters[1], sd = norm_complexity$parameters[2]), aes(x = x, color = 'Normal')) +
  geom_density(data = df_C, aes(x = x, color = 'Empirical Distribution')) +
  ylab('Density') + labs(color = "Distributions") + ggtitle('Statistical Complexity Estimation') +
  theme_classic(base_size = 12, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))
dev.off() 
