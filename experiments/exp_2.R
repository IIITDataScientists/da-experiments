sslc <- read.csv("data/Group4Data.csv")
sslcSubset <- subset(sslc, 
                     select=c("REG_NO", "L1_MARKS", "L2_MARKS", "L3_MARKS",
                                    "S1_MARKS", "S2_MARKS", "S3_MARKS", "TOTAL_MARKS"),
                     )
