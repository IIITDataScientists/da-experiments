# Creating Vectors
a <- c(1, 2, 3, 5, 7, 9, 11, 13, 17)
b <- c(2, 4, 6, 8, 10)
c <- c("ASB", "IS", "BEST") # Any type!
d <- c(a, b) # Combining vectors
e <- c(d, c) # of different types!

# Creating Sequence
a <- 1:9 # 1 to 9
b <- seq(from = 1, to = 20, by = 2.5) #Frikkin cool eh?
# Repeaters
c <- rep (1, times = 11) 

# Comparing Vectors
a <- 1:5
b <- 6:10
c <- 1:5
d <- c(TRUE, TRUE, FALSE, FALSE, TRUE)
a == b # All false, duh!
a == c # All true
c == d # Woah, 1 == TRUE
a < 3

# Selecting Vector
a[1] # index starts from 1
a[3:5] # multiple elements selection
a[1: length(a)] # all elements selection

# Conditional selection
a[a < 3] # Pretty wicked eh?
a[a %% 2 == 0] # Notice that it's %% and not just %

# Vector Arithmetic
a + b
a ^ b
a / b
