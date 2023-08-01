---
share: true
---

Date: 1 August 2023

```R
installed.packages() # check the packages installed

a <- 1 # variable assignment
b <- 1
c <- -1

a
print(a)

ls() # all stored and declared variables

(-b + sqrt(b^2 - 4*a*c) ) / ( 2*a ) # mathematical expression

?log # help documentation with log [full help]
args(log) # arguments of log
log(8, base = 2)

data() # shows available datasets

co2 # co2 dataset loading

class(a) # data type of the object

library(dslabs) # include the package
data(murders) # include the dataset
class(murders) # datatype of whole dataset
str(murders) # overview of the data

> class(murders)
[1] "data.frame"
> str(murders)
'data.frame':	51 obs. of  5 variables:
 $ state     : chr  "Alabama" "Alaska" "Arizona" "Arkansas" ...
 $ abb       : chr  "AL" "AK" "AZ" "AR" ...
 $ region    : Factor w/ 4 levels "Northeast","South",..: 2 4 4 2 4 4 1 2 2 2 ...
 $ population: num  4779736 710231 6392017 2915918 37253956 ...
 $ total     : num  135 19 232 93 1257 

head(murders) # 

murders$population # select the attribute in the dataset
murders$p # selects the attributes starting with 'p' else if write full name
population # ERROR ! Object population not found

names(murders) # shows all the attributes present in the dataset

pop <- murders$population # copying the attribute into a var
length(pop) # length of data
length(murders$abb) 
class(pop)
class(murders$state) 
class(murders$region) # labels 

z <- 3 == 2 # stores the boolean [LOGICAL] value of the expression
z
class(z)

class(murders$region) 
levels(murders$region) # Labels | can be only used for factor/Categorical datatype

summary(murders) # shows the summary of the dataset
plot(murders$region) # 

plot(murders$population, type= "p") # point plot | 
#scatterplot not applicable for the categorical 
plot(murders$population, type= "l") # line plot | 
plot(murders$population, type= "b") # combination of line and point 
plot(murders$population)
plot(murders$region, type= "p")

plot(murders$population, type= "h") # histogram
plot(murders$region, murders$population)

plot(murders$region, xlab = 'names', ylab = 'No of Instances', main = 'region plot', col = 'green')

barplot(murders$population, main = 'population plot',xlab = 'values', ylab = 'No of Instances', col= 'green',horiz = TRUE) # Horizontal Plot

barplot(murders$population, main = 'population plot',xlab = 'No of Instances', ylab = 'values', col= 'green',horiz = FALSE) # Vertical plot

hist(murders$population, breaks = 3) # 
hist(murders$population, main = 'population',xlab = 'values', col='red')

boxplot(murders$population)

?par
par(mfrow=c(3,3), mar=c(2,5,2,1), las=0, bty="n")
plot(murders$region)
plot(murders$population, type= "p")
plot(murders$population, type= "l")
plot(murders$population, type= "b")
plot(murders$region, murders$population)
hist(murders$population, main = 'population',xlab = 'values', col='red')
barplot(murders$population, main = 'population plot',xlab = 'values', ylab = 'No of Instances', col= 'green',horiz = TRUE)
plot(murders$population, type= "h")
boxplot(murders$region)

plot(murders)

region <- murders$region
region
value <- murders$total
region <- reorder(region, value, FUN = sum)
region
levels(region)

record <- list(name = "John Doe",
               student_id = 1234,
               grades = c(95, 82, 91, 97, 93),
               final_grade = "A")
record
class(record)

record$student_id
record[["student_id"]] #we can also use [[]]

record2 <- list("John Doe", 1234)
record2

record2[[1]]

mat <- matrix(1:12, 4, 3)
mat
mat[2, 3]
mat[2, ]
mat[, 3]
mat[, 2:3]
mat[1:2, 2:3]
mat1 <- matrix(1:24, 4, 3)
mat1

as.data.frame(mat)

codes <- c(380, 124, 818)
codes
library(tidyverse)
view(codes)
country <- c("italy", "canada", "egypt")
view(country)
country1 <- c('italy', 'canada', 'egypt')
country1
misc <- c('italy', 'canada', 'egypt', 500)
view(misc)

codes <- c(italy = 380, canada = 124, egypt = 818)
view(codes)
class(codes)
names(codes)

seq(1, 10)
seq(1, 10, 2)
1:10
class(1:10)
class(seq(1, 10, 0.5))

codes[2]
codes[c(1,3)]
codes[1:2]
codes[c("egypt","italy")]

x <- c(1, "canada", 3)
x
class(x)

x <- 1:5
y <- as.character(x)
y
class (y)
as.numeric(y)

x <- c("1", "b", "3")
class(x)
as.numeric(x)
h <- c("1", "3")
class(h)
as.numeric(h)

library(dslabs)
data(murders)
view(murders)
sort(murders$total)

?airquality
data(airquality)
view(airquality)
summary(airquality)
par(mfrow=c(1,1))
plot(airquality)

boxplot(airquality[,0:3], main='Multiple Box plots')

install.packages("lattice")
library(lattice)  

attach(mtcars)
view(mtcars)
head(mtcars)
gear
cyl
mtcars_data <- mtcars

gear_factor<-factor(gear,levels=c(3,4,5),
                    labels=c("3gears","4gears","5gears")) 

cyl_factor <-factor(cyl,levels=c(4,6,8),
                    labels=c("4cyl","6cyl","8cyl"))

cyl
densityplot(carb, main="Density Plot",  xlab="density value")

splom(mtcars[c(1,3,4,5,6)], main="MTCARS Data")

install.packages("ggplot2") 
library(ggplot2)

attach(mtcars)

mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),  
                      labels=c("3gears", "4gears", "5gears"))  
mtcars$am <- factor(mtcars$am,levels=c(0,1),  
                    labels=c("Automatic","Manual"))  
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),  
                     labels=c("4cyl","6cyl","8cyl"))

p <- ggplot(data = mtcars, aes(x = wt, mpg))
p + geom_point()
p + geom_point(aes(color = qsec))
p + geom_point(aes(alpha = qsec))
p + geom_point(aes(size = qsec))
p + geom_point(aes(color = cyl))
p + geom_point(aes(color = factor(cyl)))
p + geom_point(aes(shape = factor(cyl)))
p + geom_point(aes(shape = factor(cyl), color = factor(cyl)))
p + geom_point(aes(shape = factor(qsec), color = factor(cyl)))
p + geom_point(aes(shape = factor(carb), color = factor(cyl)))
p + geom_point(aes(shape = factor(carb), color = factor(cyl)), size =2.25)
p + geom_point(aes(shape = factor(carb), color = factor(cyl)), size =2.25) + theme_bw()
p + geom_point(aes(shape = factor(carb), color = factor(cyl)), size =2.25) + theme_bw() + theme(axis.title = element_text(size=rel(1.5)))

```

QnA:
1. What is the difference between str() and class()
      ->  class describes the structure of the dataset, str() describes the entire 
3. Create a dataframe with 8 rows and 4 cols
4.  For categorical data point plot is not feasible
5. 