library(MASS)
library(ISLR)
library(car)

# simple linear regression
names(Boston)
?Boston
lm.fit = lm(medv~lstat, data=Boston) 

lm.fit
summary(lm.fit)
names(lm.fit)
coef(lm.fit) # coefficients
confint(lm.fit) # confidence interval

predict(lm.fit, data.frame(lstat=(c(5, 10, 15))), interval="confidence") # see the confidence
predict(lm.fit, data.frame(lstat=(c(5, 10, 15))), interval="prediction") # predict it

plot(lstat, medv) # plot lstat vs medv
abline(lm.fit) # draw a line (not just least squares regression lines)

# some plot options
abline(lm.fit, lwd=3, col="red")
plot(lstat, medv, pch=20)
plot(lstat, medv, pch="+")

plot(1:20, 1:20, pch=1:20)

par(mfrow=c(2,2))
plot(lm.fit)

plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))

plot(hatvalues (lm.fit))
which.max(hatvalues (lm.fit))


# multiple linear regression

lm.fit=lm(medv~lstat+age,data=Boston)
summary(lm.fit)
lm.fit=lm(medv~.,data=Boston) # shorthand for all predictors
summary(lm.fit)

?summary.lm
summary(lm.fit)$r.sq # R square
summary(lm.fit)$sigma # sigma


vif(lm.fit) # variance inflation factors

# now age has highest p value, so chuck it, like below
lm.fit1 = lm(medv~.-age, data=Boston)
# or update the old one mate
lm.fit1 = update(lm.fit, ~.-age)

summary(lm.fit1)

# Interaction / Synergy effect
lm.fit2 = lm(medv~lstat*age*tax, data=Boston)
summary(lm.fit2)
plot(lm.fit2)
