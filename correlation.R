install.packages("ggpubr")
library(ggplot2)
library(tidyverse)
library("ggpubr")

my_data <- mtcars
head(my_data, 6)

#to compute the correlation between mpg and wt variables.
ggscatter(my_data, x = "mpg", y = "wt", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Miles/(US) gallon", ylab = "Weight (1000 lbs)")
#form the plot, the relationship is linear. In the situation where the 
#scatter plots show curved patterns, we are dealing with nonlinear 
#association between the two variables.

#Q-Q plot draws the correlation between a given sample and the normal distribution.
# mpg
ggqqplot(my_data$mpg, ylab = "MPG")
# wt
ggqqplot(my_data$wt, ylab = "WT")
#From the normality plots, we conclude that both populations may come 
#from normal distributions.

#if the data are not normally distributed, it's recommended to use the 
#non-parametric correlation, including Spearman and Kendall rank-based 
#correlation tests.
#Pearson Correlation test between mpg and wt variables:
res <- cor.test(my_data$wt, my_data$mpg,method = "pearson")
res
#The p-value of the test is 1.294e^{-10}, which is less than the 
#significance level alpha = 0.05. We can conclude that wt and mpg are 
#significantly correlated with a correlation coefficient of -0.87 and 
#p-value of 1.29410^{-10} .

# Extract the p.value
res$p.value
# Extract the correlation coefficient
res$estimate

#Rank correlation is a method of finding the degree of association 
#between two variables. The calculation for the rank correlation 
#coefficient the same as that for the Pearson correlation coefficient, 
#but is calculated using the ranks of the observations and not their 
#numerical values.

#Kendall rank correlation test
res2 <- cor.test(my_data$wt, my_data$mpg,  method="kendall")
res2
#The correlation coefficient between x and y are -0.7278 and the p-value is 6.70610^{-9}.

#Spearman rank correlation coefficient
res3 <-cor.test(my_data$wt, my_data$mpg,  method = "spearman")
res3
#The correlation coefficient between x and y are -0.8864 and the p-value is 1.48810^{-11}.


#CORRELATION MATRIX
M<-cor(mtcars)
head(round(M,2)) #correlations coefficients between the possible pairs of variables

#Correlogram : Visualizing the correlation matrix

install.packages("corrplot")
library(corrplot)
corrplot(M, method="circle")
corrplot(M, method="pie")
corrplot(M, method="color")
corrplot(M, method="number")

#Types of correlogram layout
# "full" (default) : display full correlation matrix
#"upper": display upper triangular of the correlation matrix
#"lower": display lower triangular of the correlation matrix
corrplot(M, type="upper")
corrplot(M, type="lower")

#The correlation matrix can be reordered according to the correlation 
#coefficient. This is important to identify the hidden structure and 
#pattern in the matrix. "hclust" for hierarchical clustering order is 
#used in the following examples.
corrplot(M, type="upper", order="hclust")

# Using different color spectrum
col<- colorRampPalette(c("red", "white", "blue"))(20)
corrplot(M, type="upper", order="hclust", col=col)

## Change background color to lightblue
corrplot(M, type="upper", order="hclust", col=c("black", "white"),
         bg="lightblue")

library(RColorBrewer)
corrplot(M, type="upper", order="hclust", 
         col=brewer.pal(n=8, name="RdBu"))
corrplot(M, type="upper", order="hclust",
         col=brewer.pal(n=8, name="RdYlBu"))
corrplot(M, type="upper", order="hclust",
         col=brewer.pal(n=8, name="PuOr"))

#Changing the color and the rotation of text labels
#tl.col (for text label color) and tl.srt (for text label string rotation) 
#are used to change text colors and rotations.
corrplot(M, type="upper", order="hclust", tl.col="black", tl.srt=45)

#Correlation matrix with significance levels (p-value)
#The function rcorr() [in Hmisc package] can be used to compute the 
#significance levels for pearson and spearman correlations. It returns 
#both the correlation coefficients and the p-value of the correlation 
#for all possible pairs of columns in the data table.
install.packages("Hmisc")
library("Hmisc")
res2 <- rcorr(as.matrix(my_data))
res2
#The output of the function rcorr() is a list containing the following 
#elements : - r : the correlation matrix - n : the matrix of the number 
#of observations used in analyzing each pair of variables - P : the 
#p-values corresponding to the significance levels of correlations.

# Extract the correlation coefficients
res2$r
# Extract p-values
res2$P

# Insignificant correlation are crossed
corrplot(res2$r, type="upper", order="hclust", 
         p.mat = res2$P, sig.level = 0.01)

# Insignificant correlations are leaved blank
corrplot(res2$r, type="upper", order="hclust", 
         p.mat = res2$P, sig.level = 0.01, insig = "blank")

#display a chart of a correlation matrix
install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
my_data <- mtcars[, c(1,3,4,5,6,7)]
chart.Correlation(my_data, histogram=TRUE, pch=19)
#Each significance level is associated to a symbol : 
#p-values(0, 0.001, 0.01, 0.05, 0.1, 1) <=> symbols("***", "**", 
#"*", ".", " ")