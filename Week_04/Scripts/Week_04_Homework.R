### Data Wrangling (dplyr and tidyr) HOMEWORKS
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



#Homework 4a
# dplyr
#Write a script that:
#1) calculates the mean and variance of body mass by species, island, and sex without any NAs
#2) filters out (i.e. excludes) male penguins, then calculates the log body mass, 
# then selects only the columns for species, island, sex, and log body mass, 
# then use these data to make any plot. 
# Make sure the plot has clean and clear labels and follows best practices. 
# Save the plot in the correct output folder.
view(palmerpenguins)


#1)
#calculate the mean and variance body mass by species, island, sex
penguins %>%
  drop_na(species, island, sex, body_mass_g) %>% #removes NAs for species, island, and sex
  group_by(species, island, sex, body_mass_g) %>% #body mass by species, island, and sex
  summarise(mean_body_mass = mean(body_mass_g, na.rm = TRUE), #remove NAs from body mass
            variance_body_mass = var(body_mass_g, na.rm = TRUE)) %>% #calculate mean and variance
  #2)
  filter(sex != "male") %>% #filter out males
  mutate(log_mass = log(body_mass_g)) %>% #calculate log body mass
  select(species, island, sex, log_mass) %>% #selects only the columns for species, island, sex, and log body mass
  #Plot
  ggplot(penguins,
         mapping = aes(x = species,
                       y = log_mass,
                       color = island)) + 
  geom_boxplot()+ 
  geom_smooth(method = "lm")+
  labs(x = "Species", 
       y = "Log Body Mass (g)",
       color = "Island",
       title = "Log Body Mass of Female Penguin Species") +
  scale_colour_ghibli_d("MarnieMedium1") +
  theme_igray() +
  theme(axis.title = element_text(size = 20),
        panel.background = element_rect(fill = "linen"))

#ggsave


###############################################

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

#### Load Libraries ######
library(tidyverse)
library(here)
library(ggplot2)
library(ghibli) 
library(ggthemes)

### Load data ######
ChemData<-read_csv(here("Week_04","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)
#groundwater, high and low tide during day and night

#Remove NAs
ChemData_clean<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time column
           into = c("Tide","Time"), # separate it into two columns tide and time
           sep = "_", # separate by 
           remove = FALSE) %>% # keep the original tide_time column
  filter() %>%
  pivot_wider(cols = Temp_in:percent_sgd, # pivot the data wider
              names_from = "Variables",
              values_from = "Values") %>%
  group_by(Variables, Site, Zone, Tide) %>% # group by site, zone, and tide 
  summarise(Param_means = mean(Values, na.rm = TRUE), # get mean 
            Param_vars = var(Values, na.rm = TRUE), # get variance
            Param_sd = sd(Values, na.rm = TRUE)) # get standard deviation

#write_csv(here("Week_04","Output","HWsummary.csv")) # export csv file of your summary statistics using write_csv()

#Plot
ggplot(ChemData_clean, #fix
       mapping = aes(x = species,
                     y = log_mass,
                     color = island)) + 
  geom_boxplot()+ 
  geom_smooth(method = "lm")+
  labs(x = "Species", 
       y = "Log Body Mass (g)",
       color = "Island",
       title = "Log Body Mass of Female Penguin Species") +
  scale_colour_ghibli_d("MarnieMedium2") +
  theme_igray() +
#  theme(axis.title = element_text(size = 20),
 #       panel.background = element_rect(fill = ""))











