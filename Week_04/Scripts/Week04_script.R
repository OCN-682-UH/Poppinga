### Data Wrangling (dplyr and tidyr)
### Created by: Haley Poppinga
### Created on: 2025_09_16
###########################################

### Load libraries ########## 
library(tidyverse)
library(here)
library(ggplot2)

### Read in data ###
# The data is part of the package and is called penguins
glimpse(penguins) 

### Data Analysis ###

#Filter 
### Extract rows that meet some critera
filter(.data = DATA, ...)

# filter only the female penguins
### As always, exact spelling and capitalization matters

#before filtering
head(penguins)

#after filtering
filter(.data = penguins, sex == "female" )

#filter
filter(.data = penguins, 
       sex == "female" ) 

# Filter penguins measured in the year 2008?
filter(.data = penguins, 
       year == 2008)

# Filter penguins that have a body mass greater than 5000
filter(.data = penguins, 
       body_mass_g > 5000)

# Filter with multiple conditions
# Select females that are also greater than 5000 g
filter(.data = penguins, sex == "female", body_mass_g >5000)

#Use filter and boolean logical to show:
#Penguins that were collected in *either* 2008 *or* 2009
filter(.data = penguins, year == 2008 | year == 2009)
#or this way is the same
filter(.data = penguins, year %in% c(2008, 2009))

#Penguins that *are not* from the island Dream
filter(.data = penguins, island != "Dream")

#Penguins in the species Adelie and Gentoo
filter(.data = penguins, species %in% c("Adelie","Gentoo"))
#always need quotes for calling a character

# Common mistakes
## Using = instead of ==
filter(.data = penguins,
       sex = "females")

filter(.data = penguins, 
       sex == "females")

## Forgetting quotes  
filter(.data == penguins, 
       sex == females) #for things that are characters

filter(.data = penguins, 
       sex == "females")

### Collapsing multiple tests into one 
#penguins between 3000 and 5000 g
#Wrong
filter(.data = penguins,
       3000 < body_mass_g <5000) #
#Right
filter(.data = penguins, 
       body_mass_g <5000, #need to recall both 
       body_mass_g >3000) #can only have one logical statement per question
       
 ### Using multiple tests instead of %in%
# penguins in dream and biscoe
# Wrong
filter(.data = penguins,
       island == "Dream", #<<
       island == "Biscoe") #<<
# Right
filter(.data = penguins,
       island %in% c("Dream","Biscoe")) #pull from within

########
#Mutate and ifelse
#Use mutate to create a new column to add flipper length and body mass together
data2<-mutate(penguins, 
              length_body_mass = flipper_length_mm + body_mass_g) 
view(data2)

#Use mutate and ifelse to create a new column where body mass greater than 4000 is labeled as big and everything else is small 
data2<- mutate(.data = penguins,
               big_small = ifelse(body_mass_g>4000, "big","small")) #"big" is what we decide we want to call it
view(data2)

#the Pipe %>%#
#Filter only female penguins and add a new column that calculates the log body mass  
#When you use %>% the dataframe carries over so you don't need to write it out anymore
penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) #calculate log biomass

# Select
#Use select() to select certain columns to remain in the dataframe
penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(species, island, sex, log_mass)

#You can also use select() to rename columns.  
#Here, we are renaming species to have a capital S
penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(Species = species, island, sex, log_mass)

# Summarise 
#Computer a table of summarized data  
#Calculate the mean flipper length (and exclude any NAs) in whole dataset
penguins %>% # 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE)) #remove NAs please

#Calculate mean and mean flipper length
penguins %>% # 
  summarise(mean_flipper = mean(flipper_length_mm, na.rm=TRUE), #set the na.rm=TRUE anytime you summarize
            min_flipper = min(flipper_length_mm, na.rm=TRUE))   #all functions in same summarize function

# group_by
#You can summarize values by certain groups.  
#group_by() by itself doesn't do anything, but it is powerful when put before summarize.
#Let's calculate the mean and max bill length by island
penguins %>%
  group_by(island) %>% #<<
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm=TRUE))

# group by multiple things
#Group by both island **and** sex
penguins %>%
  group_by(island, sex) %>% #<<
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            max_bill_length = max(bill_length_mm, na.rm=TRUE))
#sumarise() has grouped output by 'island'. you can override using the 
# .groups argument

# remove NAs

#drop_na() 
  #drops rows with NAs from a specific column

#drop all the rows that are missing data on sex
penguins %>%
  drop_na(sex) #<<


# remove NAs
  
#drop_na() 
  #drops rows with NAs from a specific column
  #only use if you want to drop every single missing data from sex

#drop all the rows that are missing data on sex
# calculate mean bill length by sex
penguins %>%
  drop_na(sex) %>%
  group_by(island, sex) %>% #cleans up NAs
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE))

# Pipe into a ggplot
#You can connect your *data wrangling* to a ggplot with the pipe (you won't need to call the dataframe in ggplot if you pipe to it).

#Drop NAs from sex, and then plot boxplots of flipper length by sex
penguins %>%
  drop_na(sex) %>%
  ggplot(aes(x = sex, y = flipper_length_mm)) + #go back to + when in ggplot
  geom_boxplot()
#if you assign something to this it'll be a plot not a data set

# Before homeworks... "Totally Awesome R package of the day"
library(devtoosls) # load the development tools library
library(dadjoke)
dadjoke()                                                                



#Homework 4a
# dplyr
#Write a script that:
  #1) calculates the mean and variance of body mass by species, island, and sex without any NAs
  #2) filters out (i.e. excludes) male penguins, then calculates the log body mass, 
      # then selects only the columns for species, island, sex, and log body mass, 
      # then use these data to make any plot. 
      # Make sure the plot has clean and clear labels and follows best practices. 
      # Save the plot in the correct output folder.

#1)
#calculate the mean and variance body mass by species, island, sex
penguins %>%
  drop_na(species, island, sex) %>%
  group_by(species, island, sex) %>%
  summarise(mean_body_mass = mean(body_mass_g, na.rm = TRUE),
            variance_body_mass = var(body_mass_g, na.rm = TRUE)) %>%
#2)
  filter(sex != "male") %>%



#2)
#filters out (i.e. excludes) male penguins

#then calculates the log body mass














#Homework 4b
# tidyr
# Using the chemistry data:
  # Create a new clean script
  # Remove all the NAs
  # Separate the Tide_time column into appropriate columns for analysis
  # Filter out a subset of data (your choice)
  # use either pivot_longer or pivot_wider at least once
  # Calculate some summary statistics (can be anything) and export the csv file into the output folder
  # Make any kind of plot (it cannot be a boxplot) and export it into the output folder
  # Make sure you comment your code and your data, outputs, and script are in the appropriate folders





























