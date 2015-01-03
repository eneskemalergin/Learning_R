setwd("C:/Users/PC-41/Desktop/R Tutorial Examples")
getwd()
essay_data <- read.csv("AID_743085_data.csv")

names(essay_data)
# I will use PUBCHEM_ACTIVITY_SCORE variable
# install.packages('ggplot2')
library(ggplot2)
# First Result:
qplot(x = PUBCHEM_ACTIVITY_SCORE, data = essay_data)

# Gives more detailed but complicated looking Histogram
qplot(x = PUBCHEM_ACTIVITY_SCORE, data = essay_data)+
  scale_x_discrete(breaks = 0:100) 

# 0 to 100 with distance 10
qplot(x = PUBCHEM_ACTIVITY_SCORE, data = essay_data)+
  scale_x_discrete(breaks = seq(0,100, 10)) 

# We don't Want to have inactive results to shown:
# I need to extract 0s 
qplot(x = PUBCHEM_ACTIVITY_SCORE, data = essay_data)+
  scale_x_discrete(breaks = 0:100)+
  scale_x_continuous(limits = c(1,100))

# From the graph I have 3 areas that activity scores are cumulated
# I want to extract them and have 3 different histogram

qplot(x = PUBCHEM_ACTIVITY_SCORE, data = essay_data)+
  scale_x_discrete(breaks = seq(0,100, 10)) +
  scale_x_continuous(limits = c(1,25))

qplot(x = PUBCHEM_ACTIVITY_SCORE, data = essay_data)+
  scale_x_discrete(breaks = seq(0,100, 10)) +
  scale_x_continuous(limits = c(26,60))

qplot(x = PUBCHEM_ACTIVITY_SCORE, data = essay_data)+
  scale_x_discrete(breaks = seq(0,100, 10)) +
  scale_x_continuous(limits = c(75,100))