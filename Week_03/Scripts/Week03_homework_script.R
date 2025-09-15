### Plotting Homework
### Created by: Haley Poppinga
### Created on: 2025_09_09
###########################################

### Load libraries ###
library(tidyverse)
library(here)
library(ggplot2)
library(palmerpenguins)
library(beyonce) 
library(ggthemes)
library(RColorBrewer)

### Read in data ###
glimpse(penguins)

### Homework Plot (Data Analysis) ###
ggplot(data=penguins, 
       mapping = aes(x = body_mass_g)) +
  geom_histogram(aes(fill = species), #creates a histogram of body mass frequencies of each species
                 alpha = 0.5,
                 position = "identity") +
  labs(x = "Body Mass (g)", 
       y = "Frequency",
       title = "Penguin Body Mass Distribution",
       fill = "Species") +
  scale_fill_brewer(palette = "PiYG") + #from RColoBrewer package
  theme_igray() + #inverse grey theme
  theme(axis.title = element_text(size = 10), 
        legend.background = element_rect(color = "pink"), #puts a legend color frame 
        panel.border = element_rect(color = "pink", #adds a pink border to the plot
                                    fill = NA)) #keeps the plot inside (would be removed otherwise)

ggsave(here("Week_03","Output","Week03_homework_plot.jpg")) #saving to correct folder

       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       