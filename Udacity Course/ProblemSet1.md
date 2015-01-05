# Problem set 1
================
## Problem 1
### Instructions:
- Load the 'diamonds' data set in R Studio. How many observations are in the data set?
- How many variables are in the data set?
- How many ordered factors are in the data set?
- What letter represents the best color for a diamond

```R
# If not available install.packages('ggplot2')
library(ggplot2)
data(diamonds) # data(DATA_SET_NAME) load data sets already in R
?diamonds # redirects to the Help area in RStudio about diamonds
summary(diamonds) # all info about the data set
# We can see the factors oreder or not:
diamonds$color
diamonds$carat
diamonds$cut
diamonds$clarity
diamonds$depth
diamonds$table
diamonds$price
diamonds$x
diamonds$y
diamonds$z
# Too long
ls.str(diamonds) # This command shows us what kind of variables I we have
```

