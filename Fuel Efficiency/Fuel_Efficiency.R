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

# looking at the number of automobile models by year, with and without
  # a super charger
with(vehicles, table(sCharger, year))
# I can see that super charger getting more and more popular.

class(vehicles$sCharger)
unique(vehicles$sCharger)

class(vehicles$tCharger)
unique(vehicles$tCharger)

# Takes the average MPG of highway, city and total by years
mpgByYr <- ddply(vehicles, ~year, summarise, avgMPG = mean(comb08),
                 avgHghy = mean(highway08), avgCity = mean(city08))

ggplot(mpgByYr, aes(year, avgMPG)) + 
  geom_point() + geom_smooth() + 
  xlab("Year") + ylab("Average MPG") + ggtitle("All Cars")

# Recently people would like to buy more economic cars.
# At least we can see that producers were making more economic cars
# But it can be a little misleading we should look at the fuel type as well
# Hybrid, non gasoline vehicles.

table(vehicles$fuelType1)
# 80 electricity cars. 
# Lets look only at gasoline cars.

# Only focusing on gasoline cars by extracting hybrid electric cars.
gasCars <- subset(vehicles, fuelType1 %in% c("Regular Gasoline", "Premium Gasoline",
                                             "Midgrade Gasoline") &
                    fuelType2 == "" & atvType != "Hybrid")

mpgByYr_Gas <- ddply(gasCars, ~year, summarise, avgMPG = mean(comb08))

ggplot(mpgByYr_Gas, aes(year, avgMPG)) + geom_point() +
  geom_smooth() +xlab("Year") + ylab("Average MPG") + ggtitle("Gasoline Cars")

# We need to persuade people that smaller cars tent to be more fuel-efficient
typeof(gasCars$displ)
# plotting mpg of cars with cylinder numbers
ggplot(gasCars, aes(displ, comb08)) + geom_point() +geom_smooth()

avgCarSize <- ddply(gasCars, ~year, summarise, avgDispl = mean(displ))
ggplot(avgCarSize, aes(year, avgDispl)) + geom_point() + geom_smooth() +
  xlab("Year") + ylab("Average engine displacement (1)")
