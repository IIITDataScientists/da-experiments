library(stringr)
library(plyr)
library(MASS)
library(ISLR)
library(car)
library(e1071)

# read the csv
sslc <- read.csv("data/Group4Data.csv")

# select the 8 columns that we are interested in
sslc.subset <- subset(sslc, 
                      select=c("REG_NO", "L1_MARKS", "L2_MARKS", "L3_MARKS",
                               "S1_MARKS", "S2_MARKS", "S3_MARKS", "TOTAL_MARKS", "NRC_CLASS"))

# remove all the non numeric characters
nonNumericCharactersRemover <- function(x) {
  x <- str_replace_all(x, pattern="[^0-9]", replacement="")  
  return(as.numeric(x))
}
sslc.subset <- data.frame(sslc.subset[1], 
                          lapply(sslc.subset[2:8], nonNumericCharactersRemover),
                          sslc.subset[9])

# eliminate the unwanted rows
sslc.subset <- subset(sslc.subset, subset=(L1_MARKS <= 125 & L2_MARKS <= 100 & L3_MARKS <= 100 & 
                                             S1_MARKS <= 100 & S2_MARKS <= 100 & S3_MARKS <= 100 & TOTAL_MARKS <= 625))


index <- 1:nrow(sslc.subset)
testIndex <- sample(index, trunc(length(index) / 3))
testRecords <- sslc.subset[testIndex, ]
trainedRecords <- sslc.subset[-testIndex, ]

# svm
svmmodel <- svm(NRC_CLASS ~ . -REG_NO -TOTAL_MARKS, data = trainedRecords)
svmpredict <- predict(svmmodel, testRecords[, -9])
svmconfmat <- table(true = testRecords[, 9], pred = svmpredict)
svmconfmat

# knn
library(class)
standardized.X = scale(sslc.subset[, c(-1, -8, -9)])
test = testIndex
train.X = standardized.X[-test, ]
test.X = standardized.X[test, ]
train.Y = sslc.subset$NRC_CLASS[-test]
test.Y = sslc.subset$NRC_CLASS[test]
set.seed(1)

knn.pred = knn(train.X, test.X, train.Y, k = 1)
mean(test.Y != knn.pred)
table(knn.pred, test.Y)

