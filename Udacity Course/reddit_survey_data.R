reddit <- read.csv("reddit.csv")
# It creates a table of employment 
table(reddit$employment.status)
# show the file
summary(reddit)

# It will show us the different factors of the file
str(reddit) 

# We can examine the different levels of each factors by using:
levels(reddit$age.range) # It shows the 7 level of age range
 
library(ggplot2)# Calls the library that I installed before

qplot(data = reddit, x = age.range)
# it will give us the bar chart.
# Problem is the variables are not ordered, it is hard to compare

qplot(data = reddit, x = income.range)

# How to order the factor variables?

reddit$age.range <- ordered(reddit$age.range, levels = c("Under 18", "18-24", "25-34", "35-44","45-54" ,"55-64" ,"65 or Above"))
# This is the ordered Plot 
qplot(data = reddit, x = age.range)
# Alternate Solution
reddit$age.range <- factor(reddit$age.range, levels = c("Under 18", "18-24", "25-34", "35-44","45-54" ,"55-64" ,"65 or Above"), ordered = T)

# Let's make it  income.range
levels(reddit$income.range)
reddit$income.range <- ordered(reddit$income.range, levels = c("Under $20,000", "$20,000 - $29,999", "$30,000 - $39,999", "$40,000 - $49,999", "$50,000 - $69,999", "$70,000 - $99,999", "$100,000 - $149,999", "$150,000 or more"))

qplot(data = reddit, x = income.range)
