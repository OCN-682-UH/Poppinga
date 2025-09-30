### Data Wrangling (dplyr and tidyr) HOMEWORKS
### Created by: Haley Poppinga
### Created on: 2025_09_16
###########################################

#Homework 4a
# dplyr
#Write a script that:
#1) calculates the mean and variance of body mass by species, island, and sex without any NAs
#2) filters out (i.e. excludes) male penguins, then calculates the log body mass, 
# then selects only the columns for species, island, sex, and log body mass, 
# then use these data to make any plot. 
# Make sure the plot has clean and clear labels and follows best practices. 
# Save the plot in the correct output folder.
#view(palmerpenguins)


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
  scale_colour_ghibli_d("PonyoMedium") +
  theme_igray() +
  theme(axis.title = element_text(size = 20),
        panel.background = element_rect(fill = "linen"))

ggsave(here("Week_04","Output","logbodymass_HW4a.png")) #saving to correct folder



