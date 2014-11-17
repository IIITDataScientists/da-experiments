# graphics

plot(cars)
plot(cars, main="Speed vs Stopping Distance(1920)", xlab="Speed (MPH)", ylab="Stopping Distance(ft)")
legend(5, 80, c("Setosa", "Versicolor", "Virginica"), pch=1:3)


with(iris, plot(Petal.Length, Petal.Width))
with(iris, plot(Petal.Length, Petal.Width, pch=as.integer(Species)))# shows the points in groups according to their species.

# bar plots

heights <- tapply(airquality$Temp, airquality$Month, mean)
barplot(heights)
heights

age <- c(25, 24, 24, 25, 24, 23, 25, 25, 24, 23, 24, 25)
height <- c(75, 76, 77, 75, 76, 77, 75, 76, 77, 75, 76, 77)            
Village <- data.frame(age=age, height=height)
bargraph <- tapply(Village$height, Village$age, mean)
bargraph
barplot(bargraph)


barplot(heights, main="Mean Temp. by Month", names.arg=c("May", "Jun", "Jul", "Aug", "Sep"),ylab="Temp (deg. F)")

# line graph
plot(cars, type="l")
plot(cars, type="l", lty="dashed")

# multiple datasets

x1 <- 5:10
x2 <- 15:20
y1 <- seq(from = 1, to = 14, by = 2.5)
y2 <- seq(from = 21, to = 34, by = 2.5)

xlim <- range(c(x1, x2))
ylim <- range(c(y1, y2))
plot(x1, y1, type="l", xlim=xlim, ylim=ylim)
lines(x2, y2, lty="dashed")
