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
par(mfrow=c(2,2))
plot(sslc.fit)

# prediction
sslc.topperdata = subset(sslc.subset, subset=(TOTAL_MARKS >= 615))
predict(sslc.fit, sslc.topperdata, interval="confidence") # see the confidence
predict(sslc.fit, sslc.topperdata, interval="prediction") # predict it

# Interaction / Synergy effect
sslc.synergy <- lm(TOTAL_MARKS~.-REG_NO-NRC_CLASS+L1_MARKS*L2_MARKS*L3_MARKS*S1_MARKS*S2_MARKS*S3_MARKS, data=sslc.subset)
summary(sslc.synergy)
plot(sslc.synergy)
