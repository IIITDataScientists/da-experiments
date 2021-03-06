sslc <- read.csv("data/Group4Data.csv")
# select the 8 columns that we are interested in
sslc.subset <- subset(sslc, 
                      select=c("L1_MARKS", "L2_MARKS", "L3_MARKS",
                               "S1_MARKS", "S2_MARKS", "S3_MARKS", "TOTAL_MARKS",
                               "NRC_CLASS", "SCHOOL_TYPE", "URBAN_RURAL", "NRC_CASTE_CODE", "NRC_GENDER_CODE",
                               "NRC_MEDIUM", "NRC_PHYSICAL_CONDITION", "CANDIDATE_TYPE", 
                               "L1_RESULT", "L2_RESULT", "L3_RESULT",
                               "S1_RESULT", "S2_RESULT", "S3_RESULT"))

source("experiments/utils.R")

sslc.subset <- data.frame(lapply(sslc.subset[1:7], nonNumericCharactersRemover),
                          sslc.subset[8:21])

# eliminate the unwanted rows
sslc.subset <- subset(sslc.subset, subset=(L1_MARKS <= 125 & L2_MARKS <= 100 & L3_MARKS <= 100 & 
                                             S1_MARKS <= 100 & S2_MARKS <= 100 & S3_MARKS <= 100 & TOTAL_MARKS <= 625))

source("experiments/factoriser.R")
summary(sslc.subset)
table(sslc.subset$NRC_CLASS) -> class
prop.table(class) * 100

table(sslc.subset$SCHOOL_TYPE) -> st
prop.table(st) * 100

table(sslc.subset$URBAN_RURAL) -> ur
prop.table(ur) * 100

table(sslc.subset$NRC_CASTE_CODE) -> ncc
prop.table(ncc) * 100

table(sslc.subset$NRC_GENDER_CODE) -> ngc
prop.table(ngc) * 100

table(sslc.subset$NRC_MEDIUM) -> nm
prop.table(nm) * 100

table(sslc.subset$NRC_PHYSICAL_CONDITION) -> npc
prop.table(npc) * 100

table(sslc.subset$CANDIDATE_TYPE) -> ct
prop.table(ct) * 100

table(sslc.subset$L1_RESULT) -> l1c
prop.table(l1c) * 100

table(sslc.subset$L2_RESULT) -> l2c
prop.table(l2c) * 100

table(sslc.subset$L3_RESULT) -> l3c
prop.table(l3c) * 100

table(sslc.subset$S1_RESULT) -> s1c
prop.table(s1c) * 100

table(sslc.subset$S2_RESULT) -> s2c
prop.table(s2c) * 100

table(sslc.subset$S3_RESULT) -> s3c
prop.table(s3c) * 100
