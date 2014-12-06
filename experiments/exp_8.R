# read the csv
sslc <- read.csv("data/Group4Data.csv")

# select the 21 columns that we are interested in
sslc.subset <- subset(sslc, 
                      select=c("L1_MARKS", "L2_MARKS", "L3_MARKS",
                               "S1_MARKS", "S2_MARKS", "S3_MARKS", "TOTAL_MARKS",
                               "NRC_CLASS", "SCHOOL_TYPE", "URBAN_RURAL", "NRC_CASTE_CODE", "NRC_GENDER_CODE",
                               "NRC_MEDIUM", "NRC_PHYSICAL_CONDITION", "CANDIDATE_TYPE", 
                               "L1_RESULT", "L2_RESULT", "L3_RESULT",
                               "S1_RESULT", "S2_RESULT", "S3_RESULT"))

source("experiments/utils.R")
source("experiments/factoriser.R")
sslc.subset <- data.frame(lapply(sslc.subset[1:7], nonNumericCharactersRemover),
                          sslc.subset[8:21])

# eliminate the unwanted rows
sslc.subset <- subset(sslc.subset, subset=(L1_MARKS <= 125 & L2_MARKS <= 100 & L3_MARKS <= 100 & 
                                             S1_MARKS <= 100 & S2_MARKS <= 100 & S3_MARKS <= 100 & TOTAL_MARKS <= 625))

# listwise deletion of missing
sslc.subset <- na.omit(sslc.subset)
sslc.subset$L1_MARKS <- (sslc.subset$L1_MARKS * 100) / 125

sslc.msubset <- subset(sslc.subset, subset = (NRC_GENDER_CODE=="Boy"))
sslc.fsubset <- subset(sslc.subset, subset = (NRC_GENDER_CODE=="Girl"))

###########################################################
# standardized variables
sslc.wr <- sslc.subset[1:6]

# Determine number of clusters
wss <- (nrow(sslc.wr)-1) * sum(apply(sslc.wr, 2, var))
for (i in 2:10) wss[i] <- sum(kmeans(sslc.wr, 
                                     centers = i)$withinss)
plot(1:10, wss, type = "b", xlab = "Number of Clusters",
     ylab = "Within groups sum of squares")

# K-Means Cluster Analysis on whole data
fit <- kmeans(sslc.wr, 5) # 5 cluster solution
# get cluster means 
aggregate(sslc.wr, by = list(fit$cluster), FUN = mean)
# append cluster assignment
sslc.subset <- data.frame(sslc.subset, fit$cluster)

###########################################################
# standardized variables
sslc.mwr <- sslc.msubset[1:6]

# Determine number of clusters
wss <- (nrow(sslc.mwr)-1) * sum(apply(sslc.mwr, 2, var))
for (i in 2:10) wss[i] <- sum(kmeans(sslc.mwr, 
                                     centers = i)$withinss)
plot(1:10, wss, type = "b", xlab = "Number of Clusters",
     ylab = "Within groups sum of squares")

# K-Means Cluster Analysis on male data
mfit <- kmeans(sslc.mwr, 5) # 5 cluster solution
# get cluster means 
aggregate(sslc.mwr, by = list(mfit$cluster), FUN = mean)
# append cluster assignment
sslc.msubset <- data.frame(sslc.msubset, mfit$cluster)

###########################################################
# standardized variables
sslc.fwr <- sslc.fsubset[1:6]

# Determine number of clusters
wss <- (nrow(sslc.fwr)-1) * sum(apply(sslc.fwr, 2, var))
for (i in 2:10) wss[i] <- sum(kmeans(sslc.fwr, 
                                     centers = i)$withinss)
plot(1:10, wss, type = "b", xlab = "Number of Clusters",
     ylab = "Within groups sum of squares")

# K-Means Cluster Analysis on female data
ffit <- kmeans(sslc.fwr, 5) # 5 cluster solution
# get cluster means 
aggregate(sslc.fwr, by = list(ffit$cluster), FUN = mean)
# append cluster assignment
sslc.fsubset <- data.frame(sslc.fsubset, ffit$cluster)

###########################################################

# Analyse Class in each cluster
table(fit$cluster , sslc.subset$NRC_CLASS)
table(mfit$cluster , sslc.msubset$NRC_CLASS)
table(ffit$cluster , sslc.fsubset$NRC_CLASS)

# Analyse Urban/Rural in each cluster
table(fit$cluster , sslc.subset$URBAN_RURAL)
table(mfit$cluster , sslc.msubset$URBAN_RURAL)
table(ffit$cluster , sslc.fsubset$URBAN_RURAL)

# Analyse Gender in each cluster
table(fit$cluster , sslc.subset$NRC_GENDER_CODE)
table(mfit$cluster , sslc.msubset$NRC_GENDER_CODE)
table(ffit$cluster , sslc.fsubset$NRC_GENDER_CODE)

# Analyse Medium in each cluster
table(fit$cluster , sslc.subset$NRC_MEDIUM)
table(mfit$cluster , sslc.msubset$NRC_MEDIUM)
table(ffit$cluster , sslc.fsubset$NRC_MEDIUM)

# Analyse School type in each cluster
table(fit$cluster , sslc.subset$SCHOOL_TYPE)
table(mfit$cluster , sslc.msubset$SCHOOL_TYPE)
table(ffit$cluster , sslc.fsubset$SCHOOL_TYPE)

