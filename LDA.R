library(MASS)
library(ggplot2)
library(tidyverse)

#attach iris dataset to make it easy to work with
?iris
attach(iris)
view (iris)

#view structure of dataset
str(iris)

#For this example we'll build a linear discriminant analysis model to 
#classify which species a given flower belongs to.
#We'll use the following predictor variables in the model:
#Sepal.length, Sepal.Width, Petal.Length, Petal.Width

#And we'll use them to predict the response variable Species, which 
#takes on the following three potential classes:
#setosa, versicolor, virginica

#One of the key assumptions of linear discriminant analysis is that 
#each of the predictor variables have the same variance. An easy way to 
#assure that this assumption is met is to scale each variable such that it 
#has a mean of 0 and a standard deviation of 1.
#scale each predictor variable (i.e. first 4 columns)
iris_data <- iris
view(iris_data)
iris_data[1:4] <- scale(iris_data[1:4])

#find mean of each predictor variable
?apply
apply(iris_data[1:4], 2, mean)

#find standard deviation of each predictor variable
apply(iris_data[1:4], 2, sd) 

#make this example reproducible
set.seed(1)

#Use 70% of dataset as training set and remaining 30% as testing set
sample <- sample(c(TRUE, FALSE), nrow(iris_data), replace=TRUE, prob=c(0.7,0.3))
train <- iris_data[sample, ]
test <- iris_data[!sample, ] 

#fit LDA model
model <- lda(Species~., data=train)

#view model output
model

#Interpretation
#Prior probabilities of group: These represent the proportions of each 
#Species in the training set. For example, 35.8% of all observations in 
#the training set were of species virginica.
#Group means: These display the mean values for each predictor variable 
#for each species.
#Coefficients of linear discriminants: These display the linear combination 
#of predictor variables that are used to form the decision rule of the 
#LDA model. For example:
#LD1: .792*Sepal.Length + .571*Sepal.Width - 4.076*Petal.Length - 2.06*Petal.Width
#LD2: .529*Sepal.Length + .713*Sepal.Width - 2.731*Petal.Length + 2.63*Petal.Width
#Proportion of trace: These display the percentage separation achieved by 
#each linear discriminant function.

#use LDA model to make predictions on test data
predicted <- predict(model, test)
names(predicted)
#This returns a list with three variables:
#class: The predicted class
#posterior: The posterior probability that an observation belongs to each class
#x: The linear discriminants

#view predicted class for first six observations in test set
head(predicted$class)

#view posterior probabilities for first six observations in test set
head(predicted$posterior)

#view linear discriminants for first six observations in test set
head(predicted$x)

#find accuracy of model
mean(predicted$class==test$Species)

#define data to plot
lda_plot <- cbind(train, predict(model)$x)

#create plot
ggplot(lda_plot, aes(LD1, LD2)) +
  geom_point(aes(color = Species))
