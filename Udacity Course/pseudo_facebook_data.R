# Pseudo-Facebook User Data
pf <- read.csv('pseudo_facebook.tsv', sep = '\t')
# we are reading with csv but our tsv and we are 
# seperating it with tab, sep = '\t'
# These files are most likely huge files. 
# This one has 99003 observations(people) and 15 
# variable(criteria)

names(pf)
# Gets the names variable

# ggplot is a graphic package that allow us the use visualization
install.packages('ggplot2')
library(ggplot2)
# It has a feature that automatically generatas plots and legends

# Output of all variables in the file
names(pf)
# We are looking for specific variable that points to users' birthdays : dob_day
qplot(x = dob_day, data = pf ) +
        scale_x_discrete(breaks = 1:31) # It seperates the each bar. in the plot  
# Following three line of code is for different themes
install.packages('ggthemes', dependencies = TRUE)
library(ggthemes) 
theme_set(theme_minimal(24))
# For more theme examples https://github.com/jrnold/ggthemes#examples
 
# Lets divide our plot into 12 to make it for each month of the year
qplot(x = dob_day, data = pf ) +
  scale_x_discrete(breaks = 1:31) +
  facet_wrap(~dob_month,ncol = 3) # divides into 12 histograms

# Now I will look at the friend_count variable and create a histogram
names(pf)
qplot(x = friend_count, data = pf) 
# Ok we got the histogram but we only need some part of it how to limit the axes:

names(pf)
# To limit it to 1000 we use xlim = c(0, 1000)
qplot(x = friend_count, data = pf , xlim = c(0,1000))

#Another way to limit it:
qplot(x = friend_count, data = pf) +
  scale_x_continuous(limits = c(0,1000))

# If we would like to see if women or men have more friends we need to
# divide our histograms into 2 
qplot(x = friend_count, data = pf, binwidth = 10) +
  scale_x_continuous(limits = c(0, 1000),
                     breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)
# When we do that it gives us 3 histograms female male and NA
# NA: Not Applicable
# How to get rid of NA
# We need to subset our data to get rid of the NA
qplot(x = friend_count, data = subset(pf, !is.na(gender)), binwidth = 10) +
  scale_x_continuous(limits = c(0, 1000),
                     breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)
# !is.na(gender) means that take the data without na values in the gender.

# Another way to get rid of the NA is omit() function
qplot(x = friend_count, data = na.omit(pf), binwidth = 10) +
  scale_x_continuous(limits = c(0, 1000),
                     breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)
# In here we take the date from pf with omitting the na values.

# using the table() command will give us a result of a total number of female and male
table(pf$gender)
by(pf$friend_count, pf$gender, summary)



# Let's look at other variables
qplot(x = tenure, data = pf, binwidth = 30, color = I('black'), fill = I('#099DD9'))
# It gives us the data of "How many days they use facebook"
# Also we changed the color of the histogram

# Getting daily 
qplot(x = tenure/365, data = pf, binwidth = 1, color = I('black'), fill = I('#F79420'))


qplot(x = tenure, data = pf, binwidth = 30, color = I('black'), fill = I('#099DD9'))
