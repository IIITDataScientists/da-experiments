# Util Functions

# prune
prune <- function(rules.gen) {
  subset.matrix <- is.subset(rules.gen, rules.gen)
  subset.matrix[lower.tri(subset.matrix, diag = T)] <- NA
  redundant <- colSums(subset.matrix, na.rm = T) >= 1
  which(redundant)
  rules.pruned <- rules.gen[!redundant]
  return(rules.pruned)
}

# remove all the non numeric characters
library(stringr)
nonNumericCharactersRemover <- function(x) {
  x <- str_replace_all(x, pattern="[^0-9]", replacement="")  
  return(as.numeric(x))
}

# function to round off the marks to nearest 10s
roundOffMarks <- function(x) {  
  return(as.numeric(round(x,digits=-1)))
}