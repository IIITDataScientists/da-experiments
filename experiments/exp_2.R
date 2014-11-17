# read the csv
sslc <- read.csv("data/Group4Data.csv")

# select the 8 columns that we are interested in
sslcSubset <- subset(sslc, 
                     select=c("REG_NO", "L1_MARKS", "L2_MARKS", "L3_MARKS",
                              "S1_MARKS", "S2_MARKS", "S3_MARKS", "TOTAL_MARKS"))

# remove all the non numeric characters
library(stringr)
library(plyr)
sslcSubset <- data.frame(lapply(sslcSubset, function(x) {
  x <- str_replace_all(x, pattern="[^0-9]", replacement="")  
  return(as.numeric(x))
}))

# eliminate the unwanted rows
sslcSubset <- subset(sslcSubset, subset=(L1_MARKS <= 125 & L2_MARKS <= 100 & L3_MARKS <= 100 & 
                                          S1_MARKS <= 100 & S2_MARKS <= 100 & S3_MARKS <= 100))


