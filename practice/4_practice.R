# functions
x <- c(0,1,1,2,3,5,8,13,21,34)
cv <- function(x) {
  sd(x)/mean(x)
}

cv(x)


# load library
library() # lists all libraries
library(ada)


# Access datasets
data() # lists all datasets

data(CO2) # loads dataset
CO2

scores <- data.frame()
scores <- edit(scores) # not working

# Redirecting to file
cat("The answer is", cv(x), "\n", file="lol")
cat(data, file="data.out", append=TRUE)

# Read CSV
`election` <- read.csv("~/program/GeneralElections2014Analysis/0_Consolidated_Report.csv", header=FALSE)

# Write CSV
write.csv(`election`, file="election.csv",  row.names=FALSE)

help(write.csv)


# printing

print(election[2)

# history

history()
