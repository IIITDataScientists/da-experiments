library(arules)
load ("practice/data_set/titanic.raw.rdata")
rules <- apriori(titanic.raw)
rules.sorted <- sort(rules, by = "lift")
inspect(rules.sorted)


rules <- apriori(titanic.raw,
                 parameter = list(minlen= 2, sup = 0.005, conf = 0.8),
                 appearance = list(rhs = c("Survived=No", "Survived=Yes"), default="lhs"),
                 control = list(verbose = T))
rules.sorted <- sort(rules, by = "lift")
inspect (rules.sorted)

# Pruning redundant rules
subset.matrix <- is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag = T)] <- NA
redundant <- colSums(subset.matrix, na.rm = T) >= 1
which(redundant)

rules.pruned <- rules.sorted[!redundant]
inspect(rules.pruned)
