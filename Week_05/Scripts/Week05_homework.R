### Relational Data & Dates/Times (Lubridate) HOMEWORKS ###
### Created by: Haley Poppinga
### Created on: 2025_09_23
###########################################

#Homework 5a
# Read in both the conductivity and depth data.
# Convert date columns appropriately
# Round the conductivity data to the nearest 10 seconds so that it matches with the depth data
# Join the two dataframes together (in a way where there will be no NAs...) 
# (i.e. join in a way where only exact matches between the two dataframes are kept)
# take averages of date, depth, temperature, and salinity by minute
# Make any plot using the averaged data
# Do the entire thing using mostly pipes (i.e. you should not have a bunch of different dataframes). Keep it clean.
# Don't forget to comment!
# Save the output, data, and scripts appropriately


### Load libraries ########## 
library(tidyverse)
library(here)
library(ggplot2)
library(ghibli) 
library(ggthemes)
library(lubridate)

# install.packages("lubridate") # package to deal with dates and times

### Read in data ###



### Data Analysis ###