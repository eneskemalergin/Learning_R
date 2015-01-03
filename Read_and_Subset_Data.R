## Files ##

# Shows which directory are you in
getwd()

# Changes the current directory
# String points to the folder path
setwd("C:/Users/PC-41/Desktop/R Tutorial Examples") # Depends on your directory path

# It reads th file and store all file in the statesInfo
statesInfo <- read.csv('stateData.csv') 

# Now we have reached the file and we can use the data inside the file

# If we want to filter states in only region 1
# Using subset() function
stateSubsets <- subset(statesInfo, state.region == 1)

# Another way to take the subset
# dataSet[ROWS, COLUMNS]

stateSubsetBracket <- statesInfo[statesInfo$states.region == 1, ] 
# after comma is the place for columns 
# Blanking the columns part will get the all columns
# statesInfo$ is reaching the subset and allows the rows and columns

