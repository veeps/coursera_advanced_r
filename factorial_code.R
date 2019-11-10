# Factorial_loop: a version that computes the factorial of an integer using looping (such as a for loop)
Factorial_loop <- function(n){
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

Factorial_reduce <- function(n){
  if(n==0){
    1
  }else{
    reduce(c(1:n), function(x, y){
    x*y
    })
  }
}


# Factorial_func: a version that uses recursion to compute the factorial.
Factorial_func <- function(x){
  if(x==0){
    1
  } else{
    x*Factorial_func(x-1)
  }
}


# Factorial_mem: a version that uses memoization to compute the factorial.
Factorial_tbl <- c(1, rep(NA))

Factorial_mem <- function(n){
  stopifnot(n > 0)
  
  if(!is.na(Factorial_tbl[n])){
    Factorial_tbl[n]
  } else{
    Factorial_tbl[n-1] <<- Factorial_mem(n-1)
    n*Factorial_tbl[n-1]
  }
}


# Compare these different functions
library(microbenchmark)
check_factorial <- microbenchmark(Factorial_loop(100),
                              Factorial_reduce(100),
                              Factorial_func(100),
                              Factorial_mem(100))
record_temp_perf_2 <- microbenchmark(find_records_1(chicagoNMMAPS, 27), 
                                     find_records_2(chicagoNMMAPS, 27))
record_temp_perf_2