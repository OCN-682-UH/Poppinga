### Relational Data & Dates/Times (Lubridate)
### Created by: Haley Poppinga
### Created on: 2025_09_23
###########################################

### Week 5b Lecture ###
### Today we are going to practice joins with data from Becker and Silbiger (2020) ####
### Created by: Haley Poppinga #############
### Created on: 2025-09-23 ####################


### Load libraries ###
library(tidyverse)
library(here)
library(ggplot2)
library(ghibli) 

### Read in data ###
### Load data ######
# Environmental data from each site
EnviroData<-read_csv(here("Week_05","data", "site.characteristics.data.csv"))

#Thermal performance data
TPCData<-read_csv(here("Week_05","data","Topt_data.csv"))
glimpse(EnviroData)
glimpse(TPCData)
# also use View()

#Pivot the data
EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured,
              values_from = values)
View(EnviroData_wide)

#Sort the data
EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured, # pivot the data wider
              values_from = values) %>%
  arrange(site.letter) # arrange the dataframe by site
View(EnviroData_wide)


#left_join(x, y)
FullData_left<- left_join(TPCData, EnviroData_wide)
## Joining with by = join_by(site.letter)
head(FullData_left)


#relocate
FullData_left<- left_join(TPCData, EnviroData_wide) %>%
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character data
## Joining with by = join_by(site.letter)
head(FullData_left)

#  calculate the mean and variance of all collected (TPC and environmental) data by site. 
# (Hint: you can either use one of the summarise_at() functions or pivot the data longer to do this in less code)

#Creating your own tibble
# Make 1 tibble
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T1

# make another tibble
T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2

#left_join vs right_join
#left_join(T1, T2) - joins to T1
#right_join(T1, T2) - joins to T2

left_join(T1, T2)
right_join(T1, T2)
## Joining with by = join_by(Site.ID)


#inner_join vs full_join
# Inner join only keeps the data that is complete in both data sets.
# Full join keeps everything.
inner_join(T1, T2)
full_join(T1, T2)
## Joining with by = join_by(Site.ID


#semi_join vs anti_join
# How would I find the extra data in y, in this example?


#semi_join keeps all rows from the first data set where there are matching values in the second data set, 
#keeping just columns from the first data set.
semi_join(T1, T2)
## Joining with by = join_by(Site.ID

#anti_join Saves all rows in the first data set that do not match anything in the second data set. 
#This can help you find possible missing data across datasets.
anti_join(T1, T2)


################################################################################

### Week 5b Lecture
### Created by: Haley Poppinga ###
### Created on: 2025-09-23 ####



#### Load Libraries ######
library(tidyverse)
library(here)
library(ggplot2)
library(ghibli) 


### Load data ######






































