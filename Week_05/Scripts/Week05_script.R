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

#other ways to view
names(TPCData[,c(3:7)])
unique(EnviroData$parameter.measured)

#Pivot the data
EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured,
              values_from = values)
View(EnviroData_wide) #site.letter is not in order

#Sort the data
EnviroData_wide <- EnviroData %>% 
  pivot_wider(names_from = parameter.measured, # pivot the data wider
              values_from = values) %>%
  arrange(site.letter) # arrange the dataframe by site
View(EnviroData_wide)


#left_join(x, y)
#takes everything thats in the x and put it in the y
FullData_left<- left_join(TPCData, EnviroData_wide)
head(FullData_left)

## Joining with by = join_by(site.letter)
# join_by this column is written the exact same way in both data frames
# = join_by is an argument
# can be helpful when you don't have the same names for data columns 



#relocate
FullData_left<- left_join(TPCData, EnviroData_wide) %>%
  relocate(where(is.numeric), .after = where(is.character)) # relocate all the numeric data after the character data
## Joining with by = join_by(site.letter)
head(FullData_left)


# usually you want your data to be wide but sometimes you have to pivot long
View(FullData_left)
names(FullData_left)
# Think Pair Share
#  calculate the mean and variance of all collected (TPC and environmental) data by site. 
# (Hint: you can either use one of the summarise_at() functions or pivot the data longer to do this in less code)
FullData_left_long <- FullData_left %>% #rename it to an object
  drop_na() %>% # remove all NAs
  pivot_longer(c(E:substrate.cover),
               names_to = "Variables",
               values_to = "Values") %>%
  group_by(site.letter) %>% # group by site
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean 
            Param_vars = var(Values, na.rm = TRUE)) # get variance
View(FullData_left_long)
#idk if correct

FullData_left_long <- FullData_left %>% #rename it to an object
  drop_na() %>% # remove all NAs
  pivot_longer(cols = E:substrate.cover,
               names_to = "Variables",
               values_to = "Values") %>%
  group_by(site.letter, Variables) %>% # group by site
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean 
            Param_vars = var(Values, na.rm = TRUE)) # get variance
View(FullData_left_long)

#another way
FullData_left_long <- FullData_left %>%
  group_by(site.letter, name) %>%
  summarise(across(E:substrate.cover,
                   list(mean = mean,
                        var = var)),
            .groups = "drop")


#Creating your own tibble
# Make 1 tibble
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), 
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T1

#Tibble and data frame are b asically the same thing but tibble is a little simpler
# data frame doesnt show the variables
# T1_df <- data.frame(Site.ID = c("A", "B", "C", "D"),
                    #Temperature = c(14.1, 16.7, 15.3, 12.8))

# make another tibble
T2 <-tibble(Site.ID = c("A", "B", "D", "E"), 
            pH = c(7.3, 7.8, 8.1, 7.9))
T2

#left_join vs right_join
#left_join(T1, T2) - joins to T1
#right_join(T1, T2) - joins to T2

left_join(T1, T2) #this one has ABCD
right_join(T1, T2) # this one has ABDE (get E because T2 is the data frame)
## Joining with by = join_by(Site.ID)

# what is the difference?
# the order of the columns
# and the order of the Site.ID

# showing how they can be the same
left_join(T1, T2) == 
  right_join(T2, T1) %>% arrange(Site.ID) %>% relocate(pH, .after = Temperature)


#inner_join vs full_join
inner_join(T1, T2) # Inner join only keeps the data that is complete in both data sets.
full_join(T1, T2) # Full join keeps everything.
## Joining with by = join_by(Site.ID

#what is the difference?
#order of the Site.ID and the order of the columns, but the data will be the same


#semi_join vs anti_join

#semi_join keeps all rows from the first data set where there are matching values in the second data set, 
#keeping just columns from the first data set.
semi_join(T1, T2)
## Joining with by = join_by(Site.ID
# no C and E because T2 has no data for E

#anti_join Saves all rows in the first data set that do not match anything in the second data set. 
#This can help you find possible missing data across datasets.
anti_join(T1, T2)

# How would I find the extra data in y, in this example?
# anti_join(T2, T1)
# figure out where you are missing your data
# they do reverse things

library(cowsay)


################################################################################

### Week 5b Lecture
### Created by: Haley Poppinga ###
### Created on: 2025-09-23 ####



#### Load Libraries ######
library(tidyverse)
library(here)
library(ggplot2)
library(ghibli) 
library(lubridate)


### Load data ######
# lubridate

# now() function
# You can also ask the time in other time zones:
now(tzone = "EST") # what time is it on the east coast
now(tzone = "GMT") # what time in GMT


# If you only want the date and not the time:
today(tzone = "GMT")

#You can also ask if it is morning or night right now and if it is a leap year:
# am(now()) 


leap_year(now()) # is it a leap year?

# Date specifications for lubridate:
# your dates must be a character

# y = year
# m = month (1st m)
# d = day
# h = hour
# m = minute (2nd m)
# s = second

# These will all produce the same results as ISO dates
ymd("2021-02-24")
mdy("02/24/2021")
mdy("February 24 2021")
dmy("24/02/2021")

# Date and Time
ymd_hms("2021-02-24 10:22:20 PM")
# ymd_hm("2021-02-24 10:22:20 PM") gives you error because of seconds
mdy_hms("02/24/2021 22:22:20")
mdy_hm("February 24 2021 10:22 PM")

# Extracting specific date or time elements from datetimes:

# make a character string
datetimes<-c("02/24/2021 22:22:20", 
             "02/25/2021 11:21:10", 
             "02/26/2021 8:01:52") 
# convert to datetimes
datetimes <- mdy_hms(datetimes) # month, day, year, hours, minutes, seconds ISO format
month(datetimes) # which month were each of these rows from
## [1] 2 2 2
month(datetimes, label = TRUE) # names of the month instead of 2
## [1] Feb Feb Feb
## 12 Levels: Jan < Feb < Mar < Apr < May < Jun < Jul < Aug < Sep < ... < Dec
# now a factor, helps you plot where it doesnt put it alphabetical order but the right order of months
month(datetimes, label = TRUE, abbr = FALSE) #Spell it out, not abbreviated
## [1] February February February
day(datetimes) # extract day, get average by day
## [1] 24 25 26
wday(datetimes, label = TRUE) # extract day of week
## [1] Wed Thu Fri
## Levels: Sun < Mon < Tue < Wed < Thu < Fri < Sat

# convert to datetimes
# datetimes <- mdy_hms(datetimes) 
# month(datetimes, label = TRUE, abbr = FALSE) #Spell it out 
# day(datetimes) # extract day 
# wday(datetimes, label = TRUE) # extract day of week
hour(datetimes) # extract the hours, take an average by hours
minute(datetimes) # extract the minutes
second(datetimes) #extract the seconds

# add 4 hours to all the datetimes:
datetimes + hours(4) # this adds 4 hours
## [1] "2021-02-25 02:22:20 UTC" "2021-02-25 15:21:10 UTC"
## [3] "2021-02-26 12:01:52 UTC"

# hour() extracts the hour component from a time and hours() is used to add hours to a datetime
# day() extracts the hour component from a time and days() is used to add hours to a datetime

# add 2 days to all the datetimes:
datetimes + days(2) # this adds 2 days
## [1] "2021-02-26 22:22:20 UTC" "2021-02-27 11:21:10 UTC"
## [3] "2021-02-28 08:01:52 UTC"

# Rounding dates
round_date(datetimes, "minute") # round to nearest minute
## [1] "2021-02-24 22:22:00 UTC" "2021-02-25 11:21:00 UTC"
## [3] "2021-02-26 08:02:00 UTC"
# both sensors started differently, so you can bring them together by rounding to nearest minute

round_date(datetimes, "5 mins") # round to nearest 5 minute
## [1] "2021-02-24 22:20:00 UTC" "2021-02-25 11:20:00 UTC"
## [3] "2021-02-26 08:00:00 UTC"
# maybe doing some smothing function where you want to round to nearest 5 minutes

# Challenge
CondData<-read_csv(here("Week_05","data","CondData.csv"))
glimpse(CondData) # there are seconds

CondData_clean<-CondData %>%
  drop_na() %>% #filters out everything that is not a complete row
  mutate(datetimes = date <- mdy_hms(date)) %>% # convert date column to year, month, day, hour, minute, second
  month(datetimes, label = TRUE, abbr = FALSE) # month column with full month labels
glimpse(CondData_clean)













