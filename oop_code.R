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
library(sloop)
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

make_LD2 <- function(x) {
  if (!is.data.frame(x)) stop("X must be a data frame")
  structure(x, class = c("LongitudinalData", "data.frame"))
}




s3_get_method(data.frame)
UseMethod(data.frame)
data_oop <- make_LD2(data)
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

# data_14 <- data_oop[data_oop$id == 14, ] %>% summary
out <- subject(data_oop, 10) %>% summary
print(out)
attributes(data_)

id_14_data_oop <- data_oop[data_oop$id == 14,]

# visit: a generic function for extracting visit-specific information
# setGeneric("subject", function(x){
#   standardGeneric("subject")
# })
# 
# setMethod("subject",
#           c(x = "LongitudinalData"),
#           function(x, n){
#             filter(x$id, )
#           })




id_54 <- data %>%
  filter(id == 54) %>%
  summary



test_list <- list(x = (1:10), y=(1:10), c =("money"))
test_list$x

test_list_df[test_list_df$x==1, ]

test_list_df <- as.data.frame(test_list)



