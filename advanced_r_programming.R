library(swirl)
library(dplyr)
library(readr)
library(microbenchmark)
library(dlnm)
microbenchmark(a <- rnorm(1000), 
               b <- mean(rnorm(1000)))

swirl()
Vivian

install_course("Advanced R Programming")


datafr <- chicagoNMMAPS
threshold <- 27

profvis({
  highest_temp <- c()
  record_temp <- c()
  for(i in 1:nrow(datafr)){
    highest_temp <- max(highest_temp, datafr$temp[i])
    record_temp[i] <- datafr$temp[i] >= threshold & 
      datafr$temp[i] >= highest_temp
  }
  datafr <- cbind(datafr, record_temp)
})