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
