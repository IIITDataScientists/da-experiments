# load libraries
library(stringr)
library(plyr)
library(MASS)
library(ISLR)
library(car)

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

# corelation matrix
marksCor <- cor(sslc.subset[2:8])
marksCor

# regression
sslc.fit <- lm(TOTAL_MARKS~.-REG_NO-NRC_CLASS, data=sslc.subset)
summary(sslc.fit)
summary(sslc.fit)$r.sq
# par(mfrow=c(2,2))
# plot(sslc.fit)

# variance inflation factors
vif(sslc.fit)

# prediction
sslc.topperdata = subset(sslc.subset, subset=(TOTAL_MARKS >= 615))
predict(sslc.fit, sslc.topperdata, interval="confidence") # see the confidence
predict(sslc.fit, sslc.topperdata, interval="prediction") # predict it

# Interaction / Synergy effect
sslc.synergy <- lm(TOTAL_MARKS~.-REG_NO-NRC_CLASS+L1_MARKS*L2_MARKS*L3_MARKS*S1_MARKS*S2_MARKS*S3_MARKS, data=sslc.subset)
summary(sslc.synergy)$r.sq
summary(sslc.synergy)
# plot(sslc.synergy)

# L1_MARKS:L2_MARKS:S2_MARKS:S3_MARKS seems to be a better choice
# so we will use them to predict the class

# function to round off the marks to nearest 10s
roundOffMarks <- function(x) {  
  return(as.numeric(round(x,digits=-1)))
}

# create a classification set
sslc.classificationset <- data.frame(sslc.subset[1], 
                          lapply(sslc.subset[2:7], roundOffMarks),
                          sslc.subset[9])

# load library
library(e1071)

# split data to test & trained records

index <- 1:nrow(sslc.classificationset)
testindex <- sample(index, trunc(length(index)/3))
testrecords <- sslc.classificationset[testindex,]
traindrecords <- sslc.classificationset[-testindex,]

# use all
NBayes.all <- naiveBayes(traindrecords[, 2:7],traindrecords[, 8])
NBpred.all <- predict(NBayes.all , testrecords[, -8])

NBtab.all <- table(true = testrecords[, 8], pred = NBpred.all)

# Use ones suggested by regression
NBayes.reg <- naiveBayes(traindrecords[, c(2, 3, 6, 7)],traindrecords[, 8])
NBpred.reg <- predict(NBayes.reg , testrecords[, -8])

NBtab.reg <- table(true = testrecords[, 8], pred = NBpred.reg)

# use worst
NBayes.worst <- naiveBayes(traindrecords[, 5:6],traindrecords[, 8])
NBpred.worst <- predict(NBayes.worst , testrecords[, -8])

NBtab.worst <- table(true = testrecords[, 8], pred = NBpred.worst)

# all is better than reg is better than worst

NBtab.all
NBtab.worst
NBtab.reg



