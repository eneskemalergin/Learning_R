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

# Labeling the Plots 
# Labels make our plots more understandable...
qplot(x = tenure/365, data = pf, xlab = "Number of years using Facebook", ylab = "Number of users in sample", color = I("black"), fill = I("#F79324")) +
  scale_x_continuous(breaks = seq(1,7,1), lim = c(0,7))

# Create a histogram of user ages
qplot(x = age, data = pf, binwidth = 1, 
      color = I('black'), fill = I('#5760a8')) +
  scale_x_discrete(breaks = seq(0,113,5))
# All about age...
summary(pf$age)

# Transforming data Solutions
install.packages("gridExtra")
library(grid)
library(gridExtra)

p1 <- qplot(x = friend_count, data = pf)
p2 <- qplot(x = log10(friend_count +1), data = pf) # Log is better than others
p3 <- qplot(x = sqrt(friend_count), data = pf)

grid.arrange(p1, p2 ,p3 ,ncol = 1)
# Another way to create 3 histograms
q1 <- ggplot(aes(x = friend_count), data = pf) + geom_histogram()
q2 <- q1 + scale_x_log10()
q3 <- q1 + scale_x_sqrt()

grid.arrange(q1, q2, q3, ncol = 1)
# Following 5 line of code is adding a scaling layer
logScale <- qplot(x = log10(friend_count), data = pf)
countScale <- ggplot(aes(x = friend_count), data = pf)+
  geom_histogram() +
  scale_x_log10()
grid.arrange(logScale, countScale, ncol = 2)

# Why we are scaling it?
# Sometimes we could get a left or right tailed histogram, and we could 
# not get true information, we should scale it with mathematical 
# tools. We used here log10 it gives us almost normally distributed histogram

qplot(x = friend_count, data = pf, binwidth = 0.25) + 
  scale_x_log10()
# Remainding what variables that we have 
names(pf)

# Seeing the likes of in tems of gender in Facebook
qplot(x = www_likes, data = subset(pf, !is.na(gender)),
      geom = "freqpoly", color = gender)+
  scale_x_continuous() +
  scale_x_log10() 

# Gives us total likes of men, and women
by(pf$www_likes, pf$gender, sum)
# Gives all statistical info about www_likes in terms of gender
by(pf$www_likes, pf$gender, summary)

# Creates a box plot with gender and friend_count varibles
qplot(x = gender, y = friend_count,
      data = subset(pf, !is.na(gender)),
      geom = "boxplot")
# The little box is our good data
# Other dots are outliers, 
# We will get rid of the outliers to focus on good data
# First way
qplot(x = gender, y = friend_count,
      data = subset(pf, !is.na(gender)),
      geom = "boxplot", ylim = c(0,1000)) 
# Second way
qplot(x = gender, y = friend_count,
      data = subset(pf, !is.na(gender)),
      geom = "boxplot") +
  scale_y_continuous(limits = c(0, 1000))
# Third way
qplot(x = gender, y = friend_count,
      data = subset(pf, !is.na(gender)),
      geom = "boxplot") +
  coord_cartesian(ylim = c(0,1000))

# We should take a closer look to see more detailed

qplot(x = gender, y = friend_count,
      data = subset(pf, !is.na(gender)),
      geom = "boxplot") +
  coord_cartesian(ylim = c(0,250))

by(pf$friend_count, pf$gender, summary)

# Who made more friend request?
qplot(x = gender, y = friendships_initiated,
      data = subset(pf, !is.na(gender)), geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 150))
by(pf$friendships_initiated, pf$gender, summary)

# This statement checks the status for mobile_likes variable
summary (pf$mobile_likes)
# We have seen that there is a lot of 0s in the data for this variable
# If we put this summary we get different result
summary(pf$mobile_likes > 0) # It refers to how many false how many True
# It allows us to see how many 0s in there
# As a result we have 35056 people's result 0

mobile_check_in <- NA
pf$mobile_check_in <- ifelse(pf$mobile_likes > 0, 1, 0)
pf$mobile_check_in <- factor(pf$mobile_check_in)

summary(pf$mobile_check_in)
# Gets the percentage of using mobile
sum(pf$mobile_check_in == 1)/length(pf$mobile_check_in) 
