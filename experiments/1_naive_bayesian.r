library(e1071)
index <- 1:nrow(Group4Data)
testindex <- sample(index, trunc(length(index)/3))
testrecords <- Group4Data[testindex,]
traindrecords <- Group4Data[-testindex,]

NBayes <- naiveBayes(traindrecords[,c(1, 4)],traindrecords[,29])
NBpred <- predict(NBayes , testrecords[,-29])

NBtab <- table(true = testrecords[,29], pred = NBpred)
NBtab
