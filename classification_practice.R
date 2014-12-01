library(ISLR)
names(Smarket)

dim(Smarket)
summary(Smarket)

cor(Smarket[, -9])
attach(Smarket)
plot(Volume)

# Logistic Regression
glm.fit= glm(formula = Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, family = binomial, data = Smarket)
summary(glm.fit)

coef(glm.fit)
summary(glm.fit)$coef

summary(glm.fit)$coef[, 4]

glm.probs = predict(glm.fit, type = "response")
glm.probs[1:10]
contrasts(Direction)

glm.pred = rep("Down", 1250)
glm.pred[glm.probs > 0.5] = "Up"

table(glm.pred, Direction)
mean(glm.pred == Direction)

train = (Year < 2005)
Smarket.2005 = Smarket[!train, ]

Direction.2005 = Direction[!train]

glm.fit= glm(formula = Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, 
             family = binomial, data = Smarket, subset = train)
glm.probs = predict(glm.fit, Smarket.2005, type="response")

glm.pred = rep("Down", 252)
glm.pred[glm.probs > 0.5] = "Up"

table(glm.pred, Direction.2005)
mean(glm.pred == Direction.2005)
mean(glm.pred != Direction.2005)

glm.fit= glm(formula = Direction ~ Lag1 + Lag2, 
             family = binomial, data = Smarket, subset = train)
glm.probs = predict(glm.fit, Smarket.2005, type="response")

glm.pred = rep("Down", 252)
glm.pred[glm.probs > 0.5] = "Up"

table(glm.pred, Direction.2005)
mean(glm.pred == Direction.2005)
mean(glm.pred != Direction.2005)


predict(glm.fit, newdata = data.frame(Lag1 = c(1.2, 1.5), Lag2 = c(1.1, -0.8)), type = "response")

# Linear Discriminant Analysis

library(MASS)
lda.fit = lda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
lda.fit
plot(lda.fit)
lda.pred = predict(lda.fit, Smarket.2005)
names(lda.pred)

lda.class = lda.pred$class
table(lda.class, Direction.2005)
mean(lda.class==Direction.2005)

sum(lda.pred$posterior[,1] >= 0.5)
sum(lda.pred$posterior[,1] < 0.5)

lda.pred$posterior[1:20, 1]
lda.class[1:20]

sum(lda.pred$posterior[,1] >= 0.9)

# Quadratic Discriminant Analysis

qda.fit = qda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
qda.fit

qda.pred = predict(qda.fit, Smarket.2005)
names(qda.pred)

qda.class = qda.pred$class
table(qda.class, Direction.2005)
mean(qda.class==Direction.2005)

sum(qda.pred$posterior[,1] >= 0.5)
sum(qda.pred$posterior[,1] < 0.5)

qda.pred$posterior[1:20, 1]
qda.class[1:20]

sum(qda.pred$posterior[,1] >= 0.9)


# K nearest neighbours

library(class)
train.X = cbind(Lag1, Lag2) [train, ]
test.X = cbind(Lag1, Lag2) [!train, ]
train.Direction = Direction[train]

set.seed(1)

knn.pred = knn(train.X, test.X, train.Direction, k = 1)
table(knn.pred, Direction.2005)

knn.pred = knn(train.X, test.X, train.Direction, k = 3)
table(knn.pred, Direction.2005)


# Caravan dataset

dim(Caravan)
attach(Caravan)
summary(Purchase)

standardized.X = scale(Caravan[, -86]) # Make SD = 1 and mean = 0

var(Caravan[, 1])
var(Caravan[, 2])
var(standardized.X[, 1])
var(standardized.X[, 2])


test = 1:1000
train.X = standardized.X[-test, ]
test.X = standardized.X[test, ]
train.Y = Purchase[-test]
test.Y = Purchase[test]
set.seed(1)

knn.pred = knn(train.X, test.X, train.Y, k = 1)
mean(test.Y != knn.pred)
mean(test.Y != "No")

table(knn.pred, test.Y)

knn.pred = knn(train.X, test.X, train.Y, k = 3)
table(knn.pred, test.Y)

knn.pred = knn(train.X, test.X, train.Y, k = 5)
table(knn.pred, test.Y)

glm.fit = glm(Purchase ~ ., data = Caravan, family = binomial, subset = - test)
glm.probs = predict(glm.fit, Caravan[test, ], type= "response")
glm.pred = rep("No", 1000)
glm.pred[glm.probs > 0.5] = "Yes"
table(glm.pred, test.Y)

glm.pred = rep("No", 1000)
glm.pred[glm.probs > 0.25] = "Yes"
table(glm.pred, test.Y)

