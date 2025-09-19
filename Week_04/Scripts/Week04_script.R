### Data Wrangling (dplyr and tidyr)
### Created by: Haley Poppinga
### Created on: 2025_09_16
###########################################

### Load libraries ########## 
library(tidyverse)
library(here)
library(ggplot2)
library(palmerpenguins)
library(ghibli) 
library(ggthemes)

### Read in data ###
# The data is part of the package and is called penguins
glimpse(penguins) 

### Data Analysis ###

#Filter 
### Extract rows that meet some critera
# filter(.data = DATA, ...)

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
#filter(.data = penguins,
 #      sex = "females")

filter(.data = penguins, 
       sex == "females")

## Forgetting quotes  
#filter(.data == penguins, 
  #     sex == females) #for things that are characters

filter(.data = penguins, 
       sex == "females")

### Collapsing multiple tests into one 
#penguins between 3000 and 5000 g
#Wrong
#filter(.data = penguins,
#       3000 < body_mass_g <5000) #
#Right
filter(.data = penguins, 
       body_mass_g <5000, #need to recall both 
       body_mass_g >3000) #can only have one logical statement per question
       
 ### Using multiple tests instead of %in%
# penguins in dream and biscoe
# Wrong
#filter(.data = penguins,
 #      island == "Dream", #<<
  #     island == "Biscoe") #<<
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






################################################################################

### Week 4b Lecture
### Today we are going to practice tidy with biogeochemistry data from Hawaii ####
### Created by: Haley Poppinga #############
### Updated on: 2025-09-16 ####################



#### Load Libraries ######
library(tidyverse)
library(here)



### Load data ######
ChemData<-read_csv(here("Week_04","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)
#groundwater, high and low tide during day and night

#Remove NAs
ChemData_clean<-ChemData %>%
  filter(complete.cases(.)) #filters out everything that is not a complete row (no NAs in data)
View(ChemData_clean)

#Separate
ChemData_clean<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time column
           into = c("Tide","Time"), # separate it into two columns tide and time
           sep = "_", # separate by _ (an underscore)
           remove = FALSE) %>% # keep the original tide_time column
  unite(col = "Site_Zone", #the name of the NEW column, quotes b/c telling it to make a column called that
        c(Site,Zone), # the columns to unite, already named and now finding
        sep = ".", # lets it put a . in the middle
        remove = FALSE) # keep the original
head(ChemData_clean)

#Pivot_longer() 
ChemData_long <-ChemData_clean %>% #just created clean data into long data
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols (just biogeochem data)
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") # names of the new column with all the values
View(ChemData_long)
# cols = columns you want to pull from
  

# What to do with long data set
# Calculate mean and variance for all variables at each site
ChemData_long %>%
  group_by(Variables, Site) %>% # group by everything we want, (variables and site which are the column names)
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean of all parameters, exclude NAs
            Param_vars = var(Values, na.rm = TRUE)) # get variance
## summarise() has grouped output by 'Variables'. You can override using the .groups argument.
# made easier to calculate mean/variance for all parameters in just 2 lines of code
  
#Practice: Calculate mean, variance, and standard deviation for all variables by site, zone, and tide
# Starter code:
ChemData_long %>%
  group_by(Variables, Site) %>% # group by everything we want 
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean 
            Param_vars = var(Values, na.rm = TRUE)) # get variance

# Re-done code:
ChemData_long %>%
  group_by(Variables, Site, Zone, Tide) %>% # group by site, zone, and tide 
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean 
            Param_vars = var(Values, na.rm = TRUE), # get variance
            Param_sd = sd(Values, na.rm = TRUE)) # get standard deviation


#facet_wrap() with long data
# boxplots for every paramter by site
#makes boxplot for every single variable
# but all of the plots look the same because the scales don't work for every variable
ChemData_long %>%
  ggplot(aes(x = Site, y = Values))+ # raw values on y with site on x
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free") #add in scales = "" to do facet as a function of variable
#add in scales for each variable (min and max)
#free scales the x and the y 
# if only want to free x-axis --> free_x (keeps y same and changes x)


#Long format -> wide format
# use pivot_wider() and switch names_to --> names_from
ChemData_wide<-ChemData_long %>%
  pivot_wider(names_from = Variables, # column with the names for the new columns, Variables already exists in dataframe
              values_from = Values) # column with the values
View(ChemData_wide)


#Clean data analysis
# pipe all the way through from raw data with missing variables and ending with clean summary statistic data and export csv file
ChemData_clean<-ChemData %>%
  drop_na() %>% # remove all NAs
  separate(col = Tide_time, # separate Tide_time into two columns
           into = c("Tide","Time"),
           sep = "_",
           remove = FALSE) %>% 
  pivot_longer(cols = Temp_in:percent_sgd, # pivot the data longer
               names_to = "Variables",
               values_to = "Values") %>%
  group_by(Variables, Site, Time) %>% # group by Variable, Site, Time and calculate means
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
  pivot_wider(names_from = Variables, # convert back to wide
              values_from = mean_vals) %>%
  write_csv(here("Week_04","Output","SGDsummary.csv")) # export csv file of your summary statistics using write_csv()

  
# Same code but with all of the comments
ChemData_clean<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), # separate it into two columns Tide and time
           sep = "_", # separate by _
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD cols  
               names_to = "Variables", # the names of the new cols with all the column names 
               values_to = "Values") %>% # names of the new column with all the values 
  group_by(Variables, Site, Time) %>% # wamt averages for day and night for each of sites for all variables, 
  #take pivot longer set and pipe to group by function and pipe to summarise --> columns for each of these variables with their mean 
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
  pivot_wider(names_from = Variables, # pivot so all variables are on the top
              values_from = mean_vals) %>% # notice it is now mean_vals as the col name
  #write_csv(here("Week_04","output","summary.csv"))  # export as a csv to the right folder





























