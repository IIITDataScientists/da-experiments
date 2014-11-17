# data frames

age <- 18:29
height <- c(76.1, 77, 78.1, 78.2, 78.8, 79.7, 79.9, 81.1, 81.2, 81.8, 82.8, 83.5)            
Village <- data.frame(age=age, height=height)

nrow <- data.frame(age=25, height=60)
Village <- rbind(Village, nrow)
gender <- c("M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M", "F", "M")
Village <- cbind(Village, gender)

Village[[3]] # Values of 3rd col
Village[3] # 3rd col

Village[c(2, 3)] # 2 and 3 col
Village[, 2] # Values of 2nd col
Village[, c(2, 3)]

# Access by col names
Village[["age"]]
Village$age
Village["age"]
Village[c("age", "height")]
Village[, "age"]
Village[, c("age", "gender")]

# change colnames
colnames(Village) <- c("age", "height", "sex", "gender")

# subset
subset(Village, select=c("age", "height"), subset=(age > 24))
subset(Village, select=c("age", "height"), subset=(height > mean(height)))


# Merge or Intersection
age2 <- 28:30
height2 <- c(76.1, 77, 78.1)            
Village2 <- data.frame(age=age2, height=height2)
Villages <- merge(Village, Village2, by="height")
Villages

# Split
library(MASS)
groups <- split(Village$age, Village$gender) # for every value of gender, the age is splitted/grouped
groups

# functions onf data frames

lapply(Village$age, mean) # to a column
sapply(Village$age, mean)

Villages <- subset(Village, select=c("age", "height"), subset=(age > 24))
sapply(Villages, mode) # to all columns

lapply(Village, mode)

# function to group of data
tapply(Village$age, Village$height, mean)

# random permutation
sample(1:10)
