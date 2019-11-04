# n * (n-1) * (n - 2) * … * 1




# Factorial_loop: a version that computes the factorial of an integer using looping (such as a for loop)
factorial_loop <- function(n){
  if (n ==0){
    1
  }else{
    y <- 1
    for(i in 1:n){
      y <-y*i
    }
   y
  }
}


# Factorial_reduce: a version that computes the factorial using the reduce() function in the purrr package. Alternatively, you can use the Reduce() function in the base package.
library(purrr)

factorial_reduce <- function(n){
  if(n==0){
    1
  }else{
    reduce(c(1:n), function(x, y){
    x*y
    })
  }
}

factorial_reduce(0)


# Factorial_func: a version that uses recursion to compute the factorial.
# Factorial_mem: a version that uses memoization to compute the factorial.



