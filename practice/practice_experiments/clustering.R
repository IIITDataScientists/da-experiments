library(stringr)
library(plyr)
library(MASS)
library(ISLR)
library(car)
library(e1071)

# read the csv
sslc <- read.csv("data/Group4Data.csv")

# select the 8 columns that we are interested in
sslc.subset <- subset(sslc, 
                      select=c("REG_NO", "L1_MARKS", "L2_MARKS", "L3_MARKS",
                               "S1_MARKS", "S2_MARKS", "S3_MARKS", "TOTAL_MARKS", "NRC_CLASS"))

# remove all the non numeric characters
nonNumericCharactersRemover <- function(x) {
  x <- str_replace_all(x, pattern="[^0-9]", replacement="")  
  return(as.numeric(x))
}
sslc.subset <- data.frame(sslc.subset[1], 
                          lapply(sslc.subset[2:8], nonNumericCharactersRemover),
                          sslc.subset[9])

# eliminate the unwanted rows
sslc.subset <- subset(sslc.subset, subset=(L1_MARKS <= 125 & L2_MARKS <= 100 & L3_MARKS <= 100 & 
                                             S1_MARKS <= 100 & S2_MARKS <= 100 & S3_MARKS <= 100 & TOTAL_MARKS <= 625))

sslc.normalised <- sslc.subset[, c(-1, -8, -9)]

center_reduction <- function(x) {
  return ((x-mean(x)) / sqrt(var(x)))
}

sslc.wr <- apply(sslc.subset[, c(-1, -8, -9)], 2, center_reduction)
sslc.subset <- data.frame(sslc.subset[1], 
                          sslc.normalised,
                          sslc.subset[8:9])

# kmeans 

nb.classes <- 2
sslc.kmeans <- kmeans(sslc.wr, centers = nb.classes, iter.max = 40)
print(sslc.kmeans)
plot(sslc.normalised[, 1], col = sslc.kmeans$cluster)
plot(sslc.normalised[, 1:6], col = sslc.kmeans$cluster)

points(sslc.kmeans$cluster, col = 1:6, pch = 8)

# hcluster algorithm - doesn't work on sslc data - too large

library(amap)
sslc.hc <- hcluster(sslc.wr)

# dbscan - doesn't work on sslc data - too large
library(fpc)
newsslc <- sslc.subset[-9]
ds <- dbscan(newsslc, eps = 0.95, MinPts = 15)


# Seeds and wine data
# kmeans
seeds <- read.table("practice/data_set/seeds_dataset.txt")
summary(seeds)
seeds.cr <- apply(seeds[, 1:7], 2, center_reduction)
nb.classes <- 2
seeds.kmeans <- kmeans(seeds.cr, centers = nb.classes, iter.max = 40)

print(seeds.kmeans)
plot(seeds[, 1:7], col = seeds.kmeans$cluster)
plot(seeds[, 1], col = seeds.kmeans$cluster)

points(seeds.kmeans$centers, col = 1:2, pch = 8)

# hclustering
library(amap)
wine <- read.csv("practice/data_set/wine.data", header = TRUE)
wine.cr <- apply(wine[, 2:14], 2, center_reduction)

hc <- hcluster(wine.cr)
print(hc)
plot(hc)

# density based clustering
seeds <- read.table("practice/data_set/seeds_dataset.txt")
summary(seeds)

library(fpc)
newseeds <- seeds[-8] # removing the class column
ds <- dbscan(newseeds, eps = 0.95, MinPts = 15)

plot(ds, newseeds)
plot(ds, newseeds[c(1, 2)])
