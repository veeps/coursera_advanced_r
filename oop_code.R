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
class(data)
unique(data$id)


# You will need to design a class called “LongitudinalData” that characterizes the structure of this longitudinal dataset. 
# make_LD: a function that converts a data frame into a “LongitudinalData” object

make_LD <- function(x) {
  if (is.numeric(x)) stop("X must be a data frame")
  structure(list(
    id = x$id,
    visit = x$visit,
    room = x$room,
    value = x$value,
    timepoint = x$timepoint), class = "LongitudinalData")
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
           x[x$id == n,]
          })

data_14 <- data_oop[data_oop$id == 14 ]
typeof(factor)
out <- subject(data_oop, 14) %>% summary
print(out)

id_14_data_oop <- data_oop[data_oop$id == 14,]

# visit: a generic function for extracting visit-specific information
setGeneric("subject", function(x){
  standardGeneric("subject")
})

setMethod("subject",
          c(x = "LongitudinalData"),
          function(x, n){
            filter(x$id, )
          })



id_54 <- data %>%
  filter(id == 54) %>%
  summary



test_list <- list(x = (1:10), y=(1:10), c =("money"))
test_list$x

test_list_df[test_list_df$x==1, ]

test_list_df <- as.data.frame(test_list)



