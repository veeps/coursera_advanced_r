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
# After writing your four versions of the Factorial function, use the microbenchmark package to time
# the operation of these functions and provide a summary of their performance. 
sink("factorial_output.txt")
library(microbenchmark)
cat("Summary of performance for each factorial function", '\n', '\n')
check_factorial <- microbenchmark(Factorial_loop,
                              Factorial_reduce,
                              Factorial_func,
                              Factorial_mem) %>% 
  summary %>%
  print

# In addition to timing your functions for specific inputs make sure to show a range of inputs
# in order to demonstrate the timing of each function for larger inputs.
library(purrr)
library(dplyr)
library(tidyr)
library(magrittr)
Loop_data <- map(1:100, function(x){microbenchmark(Factorial_loop(x), times = 100)$time})
names(Loop_data) <- paste0(letters[1:100], 1:100)
Loop_data <- as.data.frame(Loop_data)

Loop_data %<>%
  gather(num, time) %>%
  group_by(num) %>%
  summarise(med_time = median(time))

#data for reduce
Reduce_data <- map(1:100, function(x){microbenchmark(Factorial_reduce(x), times = 100)$time})
names(Reduce_data) <- paste0(letters[1:100], 1:100)
Reduce_data <- as.data.frame(Reduce_data)

Reduce_data %<>%
  gather(num, time) %>%
  group_by(num) %>%
  summarise(med_time = median(time))


#data for recursion
Func_data <- map(1:100, function(x){microbenchmark(Factorial_func(x), times = 100)$time})
names(Func_data) <- paste0(letters[1:100], 1:100)
Func_data <- as.data.frame(Func_data)

Func_data %<>%
  gather(num, time) %>%
  group_by(num) %>%
  summarise(med_time = median(time))



#data for memoization
Mem_data <- map(1:100, function(x){microbenchmark(Factorial_mem(x), times = 100)$time})
names(Mem_data) <- paste0(letters[1:100], 1:100)
Mem_data <- as.data.frame(Mem_data)

Mem_data %<>%
  gather(num, time) %>%
  group_by(num) %>%
  summarise(med_time = median(time))



cat("Plot speed for the various functions, taking the factorial of 1:100")
plot(1:100, Loop_data$med_time, xlab = "Factorial Number", ylab = "Median Time (Nanoseconds)",
     pch = 18, bty = "n", xaxt = "n", yaxt = "n")
axis(1, at = 1:100)
axis(2, at = seq(0, 350000, by = 50000))
points(1:100 + .1, Reduce_data$med_time, col = "red", pch = 18)
points(1:100 + .1, Func_data$med_time, col = "grey", pch = 18)
points(1:100 + .1, Mem_data$med_time, col = "blue", pch = 18)
legend(1, 300000, c("Loop", "Reduce", "Recursion" , "Memoization"), pch = 18, 
       col = c("black","red", "grey",  "blue"), bty = "n", cex = 1, y.intersp = 1.5)



sink()