# Automobile Fuel Efficiency Analysis by Enes Kemal Ergin
# Date: 03/05/15

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
# The Average engine displacement has decresed substantially since  2008

byYear <- ddply(gasCars, ~year, summarise, avgMPG = mean(comb08), avgDispl = mean(displ))
head(byYear)

byYear2 <- melt(byYear, id = "year")
levels(byYear2$variable) <- c("Average MPG", "Avg engine displacement")
head(byYear2)

# Appends two graphs into one xy coordinate system
ggplot(byYear2, aes(year, value)) + geom_point() + geom_smooth() +
  facet_wrap(~variable, ncol = 1, scales = "free_y") + xlab("Year") + ylab("")
# Conjectures:
  # Engine Sizes have generally increased until 2008 with sudden increase between 2006 and 2008
  # Since 2009, there has been a decrease in the average car size, which partially explain the increase in fuel efficiency

# The years 2006 2008 are interesting
  # though the average engine size increased quite suddenly, the MPG remained roughly tthe same
  #   as in previous years. This seeming discrepancy might require more investigation.


gasCars4 <- subset(gasCars, cylinders == "4") # Subsets 4 cylinder gas cars
ggplot(gasCars4, aes(factor(year), comb08)) + geom_boxplot() +
  facet_wrap(~trany2, ncol = 1) + theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "MPG")
# It appears that manual transmissions are more efficient than automatic transmissions


# Change in propotion of manual cars available each year
ggplot(gasCars4, aes(factor(year), fill = factor(trany2))) + 
  geom_bar(position = "fill") + labs(x = "Year", y = "Propotion of Cars", fill = "Transmission")+
  theme(axis.text.x = element_text(angle = 45)) + geom_hline(yintercept = 0.5,
                                                             linetype = 2)

# but recent years' automatic cars has gone further than manual, so we should inspect makes and models also.
# Investigate the makes and models of automobiles and how they have changed over time

# freq of makes and models of cars concantrated on 4-cylinders
carsMake <- ddply(gasCars4, ~year, summarise, numberOfMakes = length(unique(make)))
ggplot(carsMake, aes(year, numberOfMakes)) + geom_point() + labs(x = "Year", y = "Number of available makes") +
  ggtitle("Four cylinder cars")


uniqMakes <- dlply(gasCars4, ~year, function(x)
  unique(x$make))

commonMakes <- Reduce(intersect, uniqMakes)
commonMakes

carsCommonMakes4 <- subset(gasCars4, make %in% commonMakes)
avgMPG_commonMakes <- ddply(carsCommonMakes4, ~year + make, summarise,
                            avgMPG = mean(comb08))
ggplot(avgMPG_commonMakes, aes(year,avgMPG)) + geom_line() + 
  facet_wrap(~make, nrow = 3)
