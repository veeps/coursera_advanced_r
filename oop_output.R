
##read in data
library(readr)
library(magrittr)
source("oop_code.R")

sink("oop_output.txt")
## Load any other packages that you may need to execute your code

data <- read_csv("data/MIE.csv")
x <- make_LD(data)
print(class(x))
print(x)

## Subject 10 doesn't exist
out <- subject(x, 10)
print(out)

out <- subject(x, 14)  
print(out)

out <- subject(x, 54) %>% summary
print(out)

out <- subject(x, 14) %>% summary
print(out)

out <- subject(x, 44) %>% visit(0) %>% room("bedroom")
print(out)

## Show a summary of the pollutant values
out <- subject(x, 44) %>% visit(0) %>% room("bedroom") %>% summary
print(out)


out <- subject(x, 44) %>% visit(1) %>% room("living room") %>% summary
print(out)

sink()
