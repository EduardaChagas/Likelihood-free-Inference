require(ggplot2)
require(ggthemes)

lambdas <- c(1:9)

pdf("Poisson.pdf", width = 8, height = 6)
ggplot(data = data.frame(x = 0:20)) +
  lapply(lambdas, function(l) geom_point(aes(x = x, y = dpois(x, lambda = l), col = factor(l)))) +
  lapply(lambdas, function(l) stat_function(fun = dnorm, args = list(mean = l, sd = sqrt(l)), aes(x = x, col = factor(l)))) +
  ylab('Density') + labs(color = "Lambda") + ggtitle('Poisson Distribution') +
  theme_classic(base_size = 12, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))
dev.off() 

lambdas <- 110

pdf("Poisson_110.pdf", width = 8, height = 6)
ggplot(data = data.frame(x = 0:200)) +
  lapply(lambdas, function(l) geom_point(aes(x = x, y = dpois(x, lambda = l), col = factor(l)))) +
  lapply(lambdas, function(l) stat_function(fun = dnorm, args = list(mean = l, sd = sqrt(l)), aes(x = x, col = factor(l)))) +
  ylab('Density') + labs(color = "Lambda") + ggtitle('Poisson Distribution') +
  theme_classic(base_size = 12, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))
dev.off() 

l = 110
mu = 110
sigma = 15^2

pdf("Poisson_Problem.pdf", width = 8, height = 6)
ggplot(data = data.frame(x = 0:200)) +
  geom_point(aes(x = x, y = dpois(x, lambda = l), col = 'Poisson')) +
  stat_function(fun = dnorm, args = list(mean = l, sd = sqrt(l)), aes(x = x, col = 'Poisson')) +
  stat_function(fun = dnorm, args = list(mean = mu, sd = sqrt(sigma)), aes(x = x, col = 'Normal')) +
  ylab('Density') + labs(color = "Distributions") + ggtitle('Poisson Distribution') +
  theme_classic(base_size = 12, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))
dev.off() 




