#Task 3
a <- 1
b <- 2
c <- a + b
set.seed(0) # This ensures that 'random' results will be the same for everyone
d <- rnorm(20)
e <- rnorm(20)
f <- d + e

#Double atomic vectors 

#You can assign names, dimensions, and classes to make code more reproducible 

#Attributes allow you to associate arbitrary additional metadata to any object. You can get and set individual attributes with attr(x, "y") and attr(x, "y") <- value; or get and set all attributes at once with attributes().

myvector<-c(1:5)
myvector
typeof (myvector)
myvector<-c(a=1, b=2, c=3, d=4, e=5)
myvector
dim(myvector)
myvector2 <- matrix(myvector, ncol=5, nrow=2)
myvector2
dim(myvector2)

# What happens to a factor when you modify its levels?
f1 <- factor(letters)
levels(f1) <- rev(levels(f1))

#This code reverses the levels from a-z to z-a but not the numbers 

#What does this code do?

f2 <- rev(factor(letters))
f3 <- factor(letters, levels = rev(letters))

#This code reverses the factor letters but not the letters

#What does `dim` return when applied to a vector, **and why**?

#Dim modifies vector 
#Dim (vector) returns null because 1D
#Returns the dimensions of the matrix?

#What attributes does a data frame possess?
#		Names, class, row.names 

#What does `as.matrix()` do when applied to a data frame with columns of different types?
#Turns dataframe into matrix or array: mtcars into a matrix 
#Coerces things to most general ex: characters.


#Can you have a data frame with 0 rows? What about 0 columns?
#		Yes you can have a dataframe with 0 rows or 0 columns: data.frame()

p<- read.csv("2016_10_11_plate_reader.csv", skip = 33)
str(p)

library(tidyverse)
library(readr)

read_csv("2016_10_11_plate_reader.csv", skip=33)
#the resulting object is a tibble 94 x 3
#Classes ‘tbl_df’, ‘tbl’ and 'data.frame':	94 obs. of  3 variables:

#subsetting

nrow(mtcars)
#[1] 32
#There are 32 rows of data (different types of cars)
length(mtcars)
#[1] 11
#There are 11 columns 
ncol(mtcars)
#[1] 11
#There are 11 columns
  
mtcars[, 2] #returns a vector
mtcars[2] #returns a data frame
Mtcars[["cyl"]] #returns a vector 
Mtcars["cyl"] #returns a dataframe

mtcars[mtcars$wt <3| mtcars$wt >4, ]

cbind(mtcars$mpg, mtcars$wt) #does not do attributes, just numbers 
Mtcars[, c(1,6)]
mtcars[, c("mpg","wt")] #same as above

which(mtcars$mpg == 19.2) #gives an index 
mtcars[which(mtcars$mpg == median(mtcars$mpg)),] #returns the actual names 
