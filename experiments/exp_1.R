library(stringr)
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

library(rpart)
index <- 1:nrow(sslc.subset)
testindex <- sample(index, trunc(length(index)/3))
testrecords <- sslc.subset[testindex,]
traindrecords <- sslc.subset[-testindex,]

dtfit <- rpart(NRC_CLASS~L1_MARKS + L2_MARKS + L3_MARKS + S1_MARKS + S2_MARKS + S3_MARKS, data = traindrecords, method="class")
plot(dtfit, uniform=TRUE, compress=TRUE)
text(dtfit, use.n=TRUE, all=TRUE, cex=.5)

#Predict the test set using the created Decision tree model
dtpredict <-  predict(dtfit, testrecords, type="class")

#Cross-tabulation of prediction against the TRUE classes
dtconfmat <- table(true = testrecords[,9], pred = dtpredict)

#Display the tabulation
dtconfmat


library(ISLR)
library(tree)
index <- 1:nrow(sslc.subset)
testindex <- sample(index, trunc(length(index)/3))
testrecords <- sslc.subset[testindex,]
traindrecords <- sslc.subset[-testindex,]
dtfit <- tree(NRC_CLASS~L1_MARKS + L2_MARKS + L3_MARKS + S1_MARKS + S2_MARKS + S3_MARKS, data = traindrecords, method="class")
plot(dtfit)
text(dtfit,pretty=0)
dtpredict <-  predict(dtfit,testrecords,type="class")
dtconfmat <- table(true = testrecords[,9], pred = dtpredict)
cv.class=cv.tree(dtfit,FUN=prune.misclass)
plot(cv.class$size,cv.class$dev,type="b")
cv.class
