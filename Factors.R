## Factors

" The term factor refers to a statistical data type used to store categorical variables
  categorical variable can belong to a limited number of categories.
  continuous variable can correspond to an infinite number of values."

" It is important for R to know whether its dealing with continuois or categorical 
  variable.
  Great example for categorical variable is the varibale 'gender', there are only
  two diff values possible for gender variable."

" To create factors in R we use factor() function."
gender_vector <- c("Male", "Female", "Female", "Male", "Male")
# We have created gender vector that contains 5 results from 5 individuals.

# Now we have two factor levels at work "Male" and "Female"
factor_gender_vector <- factor(gender_vector)
factor_gender_vector

# Factor Levels
" Sometimes we want to change the names of these levels. Using levels() function for that.
    levels(factor_vector) <- c('name1','name2',...)"

survey_vector <- c("M","F","F","M","M")
factor_survey_vector <- factor(survey_vector)

levels(factor_survey_vector) <- c("Female","Male")

factor_survey_vector

# Summarizing a Factor

survey_vector <- c("M","F","F","M","M")
factor_survey_vector <- factor( survey_vector )
levels(factor_survey_vector) <- c("Female","Male")
factor_survey_vector

summary(survey_vector)
summary(factor_survey_vector)

# Ordered Factors
# Creating a speed vector
speed_vector <- c("Fast", "Slow", "Slow", "Fast", "Ultra-fast")
"speed_vector should be converted to an ordinal factor since its
  categories have a natural ordening. By default, the function factor()
  transforms speed_vector into an unordered factor"

"To create an ordered factor, you have to add two additional arguments:

  factor(some_vector,ordered=TRUE,levels=c('Level 1','Level 2'...))
"

"By setting the argument ordered=TRUE in the function factor(), 
  you indicate that the factor is ordered. With the argument levels you give the values of the
  factor in the correct order, e.g. levels = c('Low','Medium','High')."
speed_vector <- c("Fast","Slow","Slow","Fast","Ultra-fast") 
factor_speed_vector <- factor(speed_vector, ordered=TRUE, levels=c("Slow","Fast","Ultra-fast")) 
factor_speed_vector
summary(factor_speed_vector) 
# Another way to make factor ordered we use ordered() function
factor_speed_vector <- ordered(speed_vector, levels = c("Slow","Fast","Ultra-fast"))
# Comparing Ordered Factors
compare_them <- factor_speed_vector[2] > factor_speed_vector[5] 
    
# Is data analyst 2 faster than data analyst 5?
compare_them