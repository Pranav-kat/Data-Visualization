---
share: true
---

library(tidyverse) --> working with colors
library(ggplot2) --> to plot
attach(mtcars) --> wont work if mtcars dataset is corrupted

\#p <- ggplot(data  = mtcars, aes(x= wt, mpg)) // aes --> aesthetic
\#p + geom_point() --> to check if p is assigned correctly

sp <-  p +geom_point(aes(color = gear))
sp 

sp + scale_color_manual(values = c('red','green','blue')) # change color manually & it wont work for continuous data


// getting gradient legend -> continuous data
inorder to get categorized representation: convert "gear" into factor
**Do not use original dataset to convert, doing that may corrupt the main dataset**
use: mtcpy <- mtcars --> copy dataset into another dataset

// qualitative palletes (no shades) -> categorical data
// divergent pallets -> Continuous data\[diverging points in the dataset
// generally this diverging point is the mean of the dataset, then use divergent pallet]
// not ideal for data in ascending order




