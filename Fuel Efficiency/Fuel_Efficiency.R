# Automobile Fuel Efficiency Analysis

# If they are not already installed use install.packages("name")
library(plyr)
library(ggplot2)
library(reshape2)

setwd("C:/Users/Pc-41/Desktop/R Tutorial Examples/Fuel Efficiency")

vehicles <- read.csv("vehicles.csv")
head(vehicles)

labels <- read.table("varlabels.txt", sep = "-", header = FALSE)
# Error Occured in line 11
 # When we take a closer look we will see that -- which breaks the rule

labels <- do.call(rbind, strsplit(readLines("varlabels.txt"), " - "))

head(labels)

nrow(vehicles) 
ncol(vehicles)
names(vehicles)

# How many unique years?
length(unique(vehicles[, "year"]))

first_year <- min(vehicles[, "year"])
first_year # 1984
last_year <- max(vehicles[, "year"])
last_year # 2016

length(unique(vehicles$year)) # 33

# What types of fuel are used as the automobiles' primary fuel types
table(vehicles$fuelType1)
# Regular gasoline is the most common, second premium gasoline

# Types of transmissions, we need to get rid of NAs
vehicles$trany[vehicles$trany == ""] <- NA
vehicles$trany2 <- ifelse(substr(vehicles$trany, 1, 4) == "Auto", "Auto", "Manual")
vehicles$trany <- as.factor(vehicles$trany)
table(vehicles$trany2)
# Rougly Twice as many automobile with automatic
