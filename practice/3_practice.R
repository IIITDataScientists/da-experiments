# Stats
x <- c(0,1,1,2,3,5,8,13,21,34)
y <- c(1,1,2,3,5,8,13,21,34,55)
z <- c(1, 0, 4, -5, 6, -8, 2, -3, 10, 100)
mean(x)
median(x)
sd(x)
variance(x)

a <- c(3.15, 3.30, 3.36, 3.78, 3.94, 3.65)
b <- c(800000, 750000, 650000, 770000, 1400000, 875000)
#covariance, corelation
cov(x, y)
cor(x, y)
cor(x, z)
cor.test(x, y)
cor.test(x, z)
cor.test(a, b)
cov(a, b)

summary(x)
