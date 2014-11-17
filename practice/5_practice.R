# lists
x <- 1:5
y <- c ("abc", "def")
z <- c(TRUE, FALSE, TRUE, TRUE)

# creating list
lst <- list(x, y, z)

# named list / maps

dic <- list(Kennedy=1960, Johnson=1964, Carter=1976, Clinton=1994, Obama=c(2008, 2012))
dic
dic$Kennedy
dic$Obama[1]
dic[["Kennedy"]]
dic[c("Kennedy", "Obama")]


# applying function to element of list

rlst <- lapply(lst, length) # resultant is a list
rlst
rvec <- sapply(lst, length) # resultant is a vector
rvec


# Matrix and arrays

theData <- c(1.1, 1.2, 2.1, 2.2, 3.1, 3.2)
mat <- matrix(theData, 2, 3) # fills col by col
mat
mat <- matrix(theData, 2, 3, byrow=TRUE) # fills row by row
mat

tmat <- t(mat) #transpose
tmat

data <- c(3.5, 7.8, 8.5, 1.2, 9.8, 14.3, 4.4, 6.9, 5.5)
mat <- matrix(data, 3, 3)
invMat <- solve(mat) # inverse of mat

mat %*% invMat # matrix multiplication

diag(3) # diagonal matrix

vec <- mat[1, ] # first row
vec

vec <- mat[, 3] # third column
vec

Z <- array(1:20, dim=c(4,5)) #Z <- array(datavector, dimension)
Z
ZT <- array(1:20, dim=c(5,4))

Z %*% ZT
ZT %*% Z


results <- apply(mat, 1, mean) # Apply to each element; 1- row by row, 2 - col by col
results
