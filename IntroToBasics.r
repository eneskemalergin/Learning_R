# Introduction to R -- Basics

"Show some demo graphs generated with R "
#demo("graphics")

## Arithmetics with R ##
5+5 #Addition
5-5 #Substraction
3*5 #Multiplication
(5+5)/2 #Division
2^5 #Exponentiation
17%%4 # Modulo

## Variables ##
x <- 42
# They assigend as shown above using arrow not = operator 

my_name <- 'Enes Kemal'
my_surname <- 'Ergin'
# Unlike Python we cannot concatenate string or character in terms of R
my_fullName <- my_name + my_surname 
# But we can add two variables value if they are integer
y <- 12

z = x+y # + operator works for arithmetic
z # This is printing the current value of the varible 
my_numeric <- 42

# The quotation marks indicate that the variable is of type character
my_character <- "forty-two"

my_logical <- FALSE

# Class function prints the type of a variable
# Check which type these variables have:
class(my_numeric)
class(my_character)
class(my_logical)