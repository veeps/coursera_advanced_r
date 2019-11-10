# You will need to design a class called “LongitudinalData” that characterizes the structure of this longitudinal dataset. 
# You will also need to design classes to represent the concept of a “subject”, a “visit”, and a “room”.
# 
# In addition you will need to implement the following functions
# 
# make_LD: a function that converts a data frame into a “LongitudinalData” object
# subject: a generic function for extracting subject-specific information
# visit: a generic function for extracting visit-specific information
# room: a generic function for extracting room-specific information

##read in data
library(readr)
library(magrittr)
library(dplyr)
data <- read_csv("data/MIE.csv")



# You will need to design a class called “LongitudinalData” that characterizes the structure of this longitudinal dataset. 
# make_LD: a function that converts a data frame into a “LongitudinalData” object

# make_LD <- function(x) {
#   if (is.numeric(x)) stop("X must be a data frame")
#   structure(list(
#     id = x$id,
#     visit = x$visit,
#     room = x$room,
#     value = x$value,
#     timepoint = x$timepoint,stringsAsFactors = FALSE), class = "LongitudinalData")
# }

make_LD <- function(x) {
  if (!is.data.frame(x)) stop("X must be a data frame")
  structure(x, class = c("LongitudinalData", "data.frame"))
}



data_oop <- make_LD(data)
class(data_oop)

# subject: a generic function for extracting subject-specific information
setGeneric("subject", function(x,n){
  standardGeneric("subject")
})

setMethod("subject",
          c(x = "LongitudinalData"),
          function(x, n){
            if ( n %in% x$id){
            x[x$id == n, ]
            } else {
              print("Subject not in data")
            }
          })


# visit: a generic function for extracting visit-specific information
setGeneric("visit", function(x,n){
  standardGeneric("visit")
})

setMethod("visit",
          c(x = "LongitudinalData"),
          function(x, n){
            if ( n %in% x$visit){
              x[x$visit == n, ]
            } else {
              print("Visit number does not exist")
            }
          })


# room: a generic function for extracting room-specific information
setGeneric("room", function(x,n){
  standardGeneric("room")
})

setMethod("room",
          c(x = "LongitudinalData"),
          function(x, n){
            if ( n %in% x$room){
              x[x$room == n, ]
            } else {
              print("Room does not exist")
            }
          })



