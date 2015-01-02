## Matrices
# What is matrix?
" Collection of elements of the same daya type
  arranged into a fixed number of rows and columns.
  Two-Dimensional"
"We can construct a matrix using matrix function"
matrix(1:9, byrow=T, nrow=3)
# The first argument is the collections of elements
# in the example above we have numbers from 1 to 9
# 1:9 constructs the vector c(1,2,3,4,5,6,7,8,9)

# The argument byrow indicates that the matrix is filled
# by the rows
# If we want the vector to be filled by the columns, 
# we put byrow = FALSE or F

# nrow indicates that the matrix should have three rows.

new_hope <- c(460.998007, 314.4)
empire_strikes <- c(290.475067, 247.900000)
return_jedi <- c(309.306177,165.8)
# Constructs a matrix from using the source above
star_wars_matrix <- matrix(c(new_hope,empire_strikes,return_jedi), byrow=T, nrow = 3)
star_wars_matrix

# Naming a Matrix
" Similar to vectors, we can add names for the rows and columns
   rownames(matrix) <- row_names_vectors
   colnames(matrix) <- col_names_vectors"
colnames(star_wars_matrix) <- c("US", "non-US")
rownames(star_wars_matrix) <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
star_wars_matrix

# Calculating the sum of matrix
" In the R, the function rowSums() conveniently calculates the totals
  for each row of a matrix. This function creates a new vector:
    sum_of_rows_vector = rowSums(matrix)"
worldwide_vector <- rowSums(star_wars_matrix)
worldwide_vector

# Adding Column 
" We can add a column or multiple columns to a matrix
  with the cbind function, which merges matrices and/or
  vectors together by column :
    new_combined matrix = cbind(matrix1,matrix2,vector1,...)"
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)
all_wars_matrix
# Adding Row
" rbind does the same combining for rows."

# Selection of Matrix Elements
" Similar to vectors, we can use the square brackets[] to select one or multiple
  elements from a matrix."
" my_matrix[1,2] << selects form the first row the second element
  my_matrix[1:3,2:4] selects rows 1,2,3 and columns 2,3,4.
  my_matrix[,1] selects all elements of the first column.
  my_matrix[1,] selects all elements of the first row."

non_us_all  <-  mean(star_wars_matrix[,2]) 

non_us_some <- mean(star_wars_matrix[1:2,2])
# Arithmetic with Matrix
" Similar to vector, we can use arithmetic operators on matrices
  work in an element-wise way on matrices in R. 
  2*my_matrix multiplies each element of my_matrix by two. 
  "
visitors <- star_wars_matrix / 5
visitors

" my_matrix1 * my_matrix2 creates a matrix where each element is the 
  product of the corresponding elements in my_matrix1 and my_matrix2"
box_office_all <- c(461, 314.4,290.5, 247.9,309.3,165.8)
movie_names <- c("A New Hope","The Empire Strikes Back","Return of the Jedi")
col_titles <- c("US","non-US")
star_wars_matrix <- matrix(box_office_all, nrow=3, byrow=TRUE, dimnames=list(movie_names,col_titles)) 
ticket_prices_matrix <- matrix(c(5,5,6,6,7,7), nrow=3, byrow=TRUE, dimnames=list(movie_names,col_titles)) 

visitors <- star_wars_matrix / ticket_prices_matrix
average_us_visitor <- mean(visitors[,1])
average_non_us_visitor <- mean(visitors[,2])