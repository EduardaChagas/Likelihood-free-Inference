require(ggplot2)

x = -10:10
a = dnorm(x, mean = 5, sd = 1) 
b = dnorm(x, mean = -5, sd = 1) 
d = (.5 * a) + (.5 * b)
df = data.frame(x, d) 

pdf("Mixture_Problem.pdf", width = 8, height = 6)
ggplot(data = df) + 
  geom_point(aes(x = x, y = d, col = 'Gaussian mixture'))  +
  geom_line(aes(x = x, y = d, col = 'Gaussian mixture'))  +
  stat_function(fun = dnorm, args = list(mean = 0, sd = sqrt(5)), aes(x = x, col = 'Normal')) +
  ylab('Density') + xlab('') + labs(color = "Distributions") + ggtitle('Gaussian Mixture') +
  theme_classic(base_size = 12, base_family = "serif") + theme(plot.title = element_text(hjust=0.5))
dev.off() 