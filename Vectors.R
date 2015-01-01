# Vectors
"Vectors are one-dimension arrays that can hold numeric data,
  character data, or logical data."
# a vector is a simple tool to store data

# We create a vector using combine function c()
# Placing the vector elements separated by a comma, between brackets

numeric_vector <- c(1,10,49)
character_vector <- c("a","b","c")
boolean_vector <- c(TRUE, FALSE, TRUE)

# Poker winnings from Monday to Friday
poker_vector <- c(140,-50,20,-120,240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# Naming a vector
# names() function is using for giving name to vectors
# Assigned names.
names(poker_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(roulette_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
# Or we can create another vector that holds our names.
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <-  days_vector 
names(roulette_vector) <- days_vector

# Calculatiion in Vectors is easy
A_vector <- c(1,2,3)
B_vector <- c(4,5,6)

total_vector <- A_vector + B_vector
total_vector # 5,7,9

# Our Gambling continues...
total_daily <- poker_vector + roulette_vector
total_daily

# We can calculate the sum of vector itself with sum()
total_poker <- sum(poker_vector)

# Up to you now. Assign the correct values to: 
total_roulette <- sum(roulette_vector)
total_week <- total_roulette + total_poker
total_week

answer <- total_poker > total_roulette
answer # Shows us that poker is more lucrative

# It goes to specified vector...
poker_wednesday <- poker_vector[3]

poker_midweek <- poker_vector[c(2,3,4)] # Careful you need to specified every address 
# or
roulette_selection_vector <- roulette_vector[2:5] # We can procastinate

# mean() function gets the average of a vector
average_midweek_gain <- mean(poker_vector[c("Monday", "Tuesday", "Wednesday")])

selection_vector <- poker_vector > 0 # It selects only the one which are positive
poker_winning_days <- poker_vector[selection_vector]
poker_winning_days
selection_vector <- roulette_vector > 0
roulette_winning_days <- roulette_vector[selection_vector]
roulette_winning_days