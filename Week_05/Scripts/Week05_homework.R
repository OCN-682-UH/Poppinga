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
CondData<-read_csv(here("Week_05","data","CondData.csv"))
DepthData<-read_csv(here("Week_05","data","DepthData.csv"))
glimpse(CondData) # there are seconds
glimpse(DepthData) # date is correct but a character

### Data Analysis ###
# Clean Conductivity  Data
CondData_clean<-CondData %>%
  drop_na() %>% #filters out everything that is not a complete row
  mutate(datetimes = mdy_hms(date)) %>% # convert date column to year, month, day, hour, minute, second
  mutate(datetimes = round_date(datetimes, "10 seconds")) # Round conductivity data to nearest 10 seconds
  # glimpse(CondData_clean)

# Clean Depth Data
DepthData_clean<-DepthData %>%
  drop_na() %>%
  mutate(datetimes = ymd_hms(date)) %>%
  mutate(datetimes = round_date(datetimes, "10 seconds"))
  
# Join with DepthData 
# (inner join = keep only exact matches between data sets and no NAs)
CondDepthData<-inner_join(DepthData_clean, CondData_clean, by = "datetimes") 

# Averages of date, depth, temperature, and salinity by minute
#CondDepthData_avg<-CondDepthData %>%
#  mutate(minute = round_date(datetimes, "minute")) %>% # round to nearest minute
#  pivot_longer(cols = c(Depth, Temperature, Salinity),
#               names_to = "Variable",
#               values_to = "Value") %>%
#  group_by(minute, Variable) %>% # group by minute
#  summarise(value_avg = mean(Value, na.rm = TRUE), #get average of depth, temp, salinity
#            date_avg = mean(datetimes, na.rm = TRUE)) # get date average 


# Averages of date, depth, temperature, and salinity by minute
# this way is longer but pivot_longer wouldnt let me pivot datetimes to get mean
CondDepthData_avg<-CondDepthData %>%
  mutate(minute = round_date(datetimes, "minute")) %>% # round to nearest minute
  group_by(minute) %>% # group by minute
  summarise(date_avg = mean(datetimes, na.rm = TRUE), # get date average 
            depth_avg = mean(Depth, na.rm = TRUE), #get average of depth, temp, salinity
            temp_avg = mean(Temperature, na.rm = TRUE),
            sal_avg = mean(Salinity, na.rm = TRUE)) %>% 
#   write_csv(here("Week_05","Output","CondDepthData_summary_HW5.csv"))
# View(CondDepthData_avg)


# Plot
CondDepthData_avg %>%
  rename(Depth = depth_avg,
         Temperature = temp_avg,
         Salinity = sal_avg) %>% #rename column titles which will rename it on plot too
  pivot_longer(cols = c(Depth, Temperature, Salinity), #make data longer
               names_to = "Variable",
               values_to = "Value") %>%
  ggplot(aes(x = minute, # plot 3 line graphs in one plot
             y = Value, 
             color = Variable)) +
  geom_line(size = 1) +
  facet_wrap(~ Variable, scales = "free_y", ncol = 1) +
  labs(
    title = "Average Depth, Temperature, and Salinity by Minute",
    subtitle = "Data from January 15, 2021",
    x = "Time",
    y = "Mean Value",
    caption="Research from Barnas et al. 2024 in O‘ahu Hawai‘i") +
  scale_fill_ghibli_d("MarnieMedium1") + # nicer colors
  theme_igray() +
  theme(axis.title = element_text(size = 20),
        legend.position = "none")
# ggsave(here("Week_05","Output","CondDepthData_plot_HW5.png"))

# Empty your environment before you start working
# Restart R
# .rs.restartR()
# remove whole list in enviroment
# rm(list = ls())


