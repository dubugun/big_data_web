plot.new()
dev.new()

x <- matrix(c(40,52,33,51),2,2)
x
barplot(x,beside = T, names = c(5,3), col = c('pink','gray'),ylim = c(0,60))
