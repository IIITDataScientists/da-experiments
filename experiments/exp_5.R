library(arules)
# read the csv
sslc <- read.csv("data/Group4Data.csv")

# select the 8 columns that we are interested in
sslc.subset <- subset(sslc, 
                      select=c("NRC_CLASS", "SCHOOL_TYPE", "URBAN_RURAL", "NRC_CASTE_CODE", "NRC_GENDER_CODE",
                               "NRC_MEDIUM", "NRC_PHYSICAL_CONDITION", "CANDIDATE_TYPE", 
                               "L1_RESULT", "L2_RESULT", "L3_RESULT",
                               "S1_RESULT", "S2_RESULT", "S3_RESULT"))


source("experiments/utils.R")
source("experiments/factoriser.R")

sslc.urban <- subset(sslc.subset, subset = (URBAN_RURAL=="Urban"))
sslc.urban <- sslc.urban[-3]
sslc.rural <- subset(sslc.subset, subset = (URBAN_RURAL=="Rural"))
sslc.rural <- sslc.rural[-3]

# Inspecting for Urban candidates in main dataset
rules <- apriori(sslc.subset,                 
                 appearance = list(rhs = c("URBAN_RURAL=Urban"),                                   
                                   default="lhs"))
rules.sorted <- sort(rules, by = "lift")
inspect(rules.sorted)
inspect(prune(rules.sorted))


# Inspecting for Rural candidates in main dataset
rules <- apriori(sslc.subset,    
                 parameter = list(conf = 0.85),
                 appearance = list(rhs = c("URBAN_RURAL=Rural"),                                    
                                   default="lhs"))
rules.sorted <- sort(rules, by = "lift")
inspect(rules.sorted)
inspect(prune(rules.sorted))
