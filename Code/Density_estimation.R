require(MASS)
require(plotly)
require(vcd)
require(fitdistrplus)
require(logspline)

HC_total = read.csv("../../HC/HC_1000.csv")[,2:4]
#HC_total = read.csv("../../HC/HC_50k.csv")[,2:4]

HC_3 = HC_total[which(HC_total$D == 3), 1:2]
x = HC_3$H
y = HC_3$C

den3d = kde2d(x, y)
plot_ly(x = den3d$x, 
        y = den3d$y, 
        z = den3d$z) %>% add_surface()

plot(density(x), main = "Density estimate of data")
plot(density(y), main = "Density estimate of data")
plot(density(dcauchy(x, location = 0, scale = 1, log = FALSE)))
plot(density(rcauchy(20, location = 1, scale = 1)), type = 'l')

z.norm = (x- min(x))/(max(x)-min(x))
descdist(z.norm, discrete = FALSE)

z.norm = (y- min(y))/(max(y)-min(y))
descdist(z.norm, discrete = FALSE)

HC_4 = HC_total[which(HC_total$D == 4), 1:2]
x = HC_4$H
y = HC_4$C

den3d = kde2d(x, y)
plot_ly(x = den3d$x, 
        y = den3d$y, 
        z = den3d$z) %>% add_surface()

plot(density(x), main = "Density estimate of data")
plot(density(y), main = "Density estimate of data")

HC_5 = HC_total[which(HC_total$D == 5), 1:2]
x = HC_5$H
y = HC_5$C

den3d = kde2d(x, y)
plot_ly(x = den3d$x, 
        y = den3d$y, 
        z = den3d$z) %>% add_surface()

hist(x, breaks = 100)
hist(y, breaks = 100)

HC_6 = HC_total[which(HC_total$D == 6), 1:2]
x = HC_6$H
y = HC_6$C

den3d = kde2d(x, y)
plot_ly(x = den3d$x, 
        y = den3d$y, 
        z = den3d$z) %>% add_surface()

hist(x, breaks = 100)
hist(y, breaks = 100)
