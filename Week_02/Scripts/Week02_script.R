### This is my first script. I am learning how to import data
### Created by: Haley Poppinga
### Created on: 2025_09_04
###########################################

### Load libraries ########## 
library(tidyverse)
library(here)

### Read in data ###
WeightData<-read_csv(here("Week_02","Data","weightdata.csv"))

#SAVE SAVE SAVE

### Data Analysis #####
#always look at data first in case there are errors
head(WeightData) # Looks at the top 6 lines of the dataframe
tail(WeightData) # Looks at the bottom 6 lines of the dataframe
View(WeightData) # opens a new window to look at the entire dataframe

#git pull (always do on both projects before making changes on R)
#git add "folder you want to add it to" (stages it, to the cloud)
#git commit -a -m "What you are doing" (presses save button)
#git push (to GitHub)

