## Datasets

# Datasets are sets of data that contains at least 2 different
# types of variable and bunch of values for each variable
# This is already in R (Built-in) 
mtcars

# The function head() enables you to show the first observatio
# -ns of a data frame
# It gave us firt 6 observations with all variables 
head(mtcars)
# Don't be suprised! tail gives you the last observations.
tail(mtcars)

# str() function gets a rapid overview of your data
str(mtcars)
# This function is the first thing that you do when you get a 
# new dataset
# It gives you the all variable names and their factor levels

## Creating a data frame

# First we need to create vectors that we want to include in the frame
planets     <- c("Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune");
type        <- c("Terrestrial planet","Terrestrial planet","Terrestrial planet","Terrestrial planet","Gas giant","Gas giant","Gas giant","Gas giant")
diameter    <- c(0.382,0.949,1,0.532,11.209,9.449,4.007,3.883); 
rotation    <- c(58.64,-243.02,1,1.03,0.41,0.43,-0.72,0.67);
rings       <- c(FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE);

# Then we will use data.frame function
# and put all the vectors inside
planets_df <- data.frame(planets, type, diameter, rotation, rings)
str(planets_df)

# Similar to matrices and vectors, you can select, reach elements
# using [].

# my_data_frame[1,2] >> selects from the first row and second element

closest_planets_df <- planets_df[1:3,]
closest_planets_df
furthest_planets_df <- planets_df[6:8,]
furthest_planets_df

# Selecting using the name of the variable
furthest_planets_diameter <- planets_df[3:8,"diameter"]

# If you want to select all element of the variable rings
planets_df[,5]
# OR
planets_df[,"rings"]

# There is a shortcut: $ to tell R that it only has to look up
# all the elemens of the variable behind the sign
# data_frame_name$variable_name
rings_vector <- planets_df$rings


# It is missing some parts...!