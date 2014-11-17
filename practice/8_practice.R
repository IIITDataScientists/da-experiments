# PCA, Correlation and Regression
pcaegdata <- read.csv("practice/data_set/pcaegdata.csv", header=FALSE)
# My own example
# pcaegdata <- read.csv("practice/data_set/mydata.csv", header=FALSE)

# copy
pcadtnr <- pcaegdata

# Normalize data
# Substract mean for each column & divide col by sd
pcadtnr[, 1] <- pcaegdata[, 1] - mean(pcaegdata[, 1])
pcadtnr[, 1] <- pcaegdata[, 1] / sd(pcaegdata[, 1])

pcadtnr[, 2] <- pcaegdata[, 2] - mean(pcaegdata[, 2])
pcadtnr[, 2] <- pcaegdata[, 2] / sd(pcaegdata[, 2])

# Build covariance matrix
covmat <- cov(pcadtnr)

#Find the eigen vectors and eigen values
eig <- eigen(covmat)
eig1 <- eig$vectors[, 1]

# projection in new dimension
# note: cannot multiply data.frame with vector, use as.matrix or data.matrix
# as.matrix won't convert to num, data.matrix does
class(pcadtnr)
class(eig1)
Z <- as.matrix(pcadtnr) %*% eig1 # or data.matrix(pcadtnr)

# Recovering the data
X_rec <- Z %*% t(eig1)  # t is transpose

# plotting raw and reduced data
par (mfrow=c(1,4))
plot(pcaegdata, main="Actual Data")
plot(pcadtnr, main="Actual Data - reduced")
plot(Z, main="2D plot of raw data")
plot(X_rec, main="1D plot of reduced data")

# using prcomp
par (mfrow=c(1,2))
# help(prcomp)
prcomp(pcaegdata)
plot(prcomp(pcaegdata))
summary(prcomp(pcaegdata, scale = TRUE))
biplot(prcomp(pcaegdata, scale = TRUE))


# correlation
cor(pcaegdata)


# regression
winered <- read.csv("practice/data_set/winequality-red.csv", sep=";")
# data(winered)
# help(lm)
summary(winered)
winefit <- lm(quality~fixed.acidity+volatile.acidity+ citric.acid+residual.sugar+chlorides+free.sulfur.dioxide + total.sulfur.dioxide +density+pH+sulphates+alcohol,data=winered)
summary(winefit)
