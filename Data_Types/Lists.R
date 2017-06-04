## Lists

# Why we need them?
"A list in R is similar to your to-do list at work or school
: the different items on that list most likely differ in length ,
characteristic, type of activiey that has to do be done,..."

"A list in R allows you to gather a variety of objects under one 
name (that is, the name of the list) in an ordered way. These 
objects can be matrices, vectors, data frames, even other lists,
etc. It is not even required that these objects are related to
each other. Just like your to-do list :-). "

my_vector <- 1:10
my_matrix <- matrix(1:9, ncol = 3)

my_df <- mtcars[1:10,]

# list() function creates a list
# To construct a list:
# my_list <- list(component1, component2...)
# The arguments to the list function are the list components.
my_list <-list(my_vector, my_matrix, my_df)

# We can give names to them: we should give names BTW
# list(name1=your.component1, name2=component2,?)
my_list <- list(VECTOR=my_vector,MATRIX=my_matrix,DATAFRAME=my_df)

# Let's make another  example
shining_list <- list(moviename="The Shining", actors=actors, reviews=reviews)

last_actor    <- shining_list$actors[length(shining_list$actors)]
second_review <- shining_list$reviews[2,]

actors      <- c("Jack Nicholson","Shelley Duvall","Danny Lloyd","Scatman Crothers","Barry Nelson")
sources     <- c("IMDb1","IMDb2","IMDB3")
comments    <- c("Best Horror Film I Have Ever Seen","A truly brilliant and scary film from Stanley Kubrick","A masterpiece of psychological horror")
scores      <- c(4.5,4,5)
reviews     <- data.frame(scores,sources,comments)

# Create named list 
shining_list <- list(moviename="The Shining", actors=actors, reviews=reviews)

# We forgot something: add the year to shining_list!
shining_list <- c(shining_list,year=1980)

# Have a look at shining_list.
str(shining_list)

