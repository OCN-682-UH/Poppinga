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
library(dplyr)
library(tidyr)
library(ghibli) 
library(ggthemes)
library(akima)

### Load data ######
ChemData<-read_csv(here("Week_04","data", "chemicaldata_maunalua.csv"))
View(ChemData)
glimpse(ChemData)
#groundwater, high and low tide during day and night

# Clean Data and Remove NAs
ChemData_clean<-ChemData %>%
  drop_na() %>% #filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time column
           into = c("Tide","Time"), # separate it into two columns tide and time
           sep = "_", # separate by 
           remove = FALSE) %>% # keep the original tide_time column
  filter(Salinity > 27) # subset choice (salinity greater than 27)

# Pivot Longer
ChemData_long <- ChemData_clean %>% # pivot the data longer
  pivot_longer(cols = c(pH, percent_sgd), 
               names_to = "Variable",    #pH or percent_sgd column
               values_to = "Value")  # measurement and all metadata

# Summarise
ChemData_HW_summary <- ChemData_long %>%
  group_by(Zone, Variable) %>% # group by zone and variables
  summarise(Param_mean = mean(Value, na.rm = TRUE), # get mean 
            Param_var = var(Value, na.rm = TRUE), # get variance
            Param_sd = sd(Value, na.rm = TRUE)) # get standard deviation
write_csv(ChemData_HW_summary, here("Week_04","Output","Chem_Data_homework_summary.csv")) # export csv file of your summary statistics using write_csv()


# Want to make a cool contour plot and without this initial part, R was plotting it as a scatterplot 
# Interpolate pH onto a grid
interp_data <- with(ChemData_clean, akima::interp(x = Lat, y = Long, z = pH, duplicate = "mean"))
# Convert to data frame for ggplot
grid_df <- expand.grid(
  Lat = interp_data$x,
  Long = interp_data$y)
grid_df$pH <- as.vector(interp_data$z)

# Plot
ggplot(grid_df, 
       aes(x = Lat, 
           y = Long, 
           z = pH)) +
  geom_contour_filled(aes(fill = after_stat(level)), # contour levels from pH
                      breaks = seq(8.0, 8.1, by = 0.01)) +  # increase contour resolution
  labs(x = "Latitude", 
       y = "Longitude",
       fill = "pH",
       title = "Interpolated pH Contours in Maunalua Bay") +
  scale_fill_ghibli_d("MarnieMedium1") + # nicer colors
  theme_igray() +
  theme(axis.title = element_text(size = 20))

ggsave(here("Week_04","Output","chemdata_HW4b.png"),width=9, height=5)) #saving to correct folder





# Ignore This Below!

#old code before I had to interpolate data
#ggplot(ChemData_clean, 
#       aes(x = Lat, 
#           y = Long, 
#          z = pH)) +
#  geom_contour_filled(aes(fill = ..level..)) +  # contour levels from pH
#  geom_point(aes(color = Zone), size = 3) +
#  labs(x = "Latitude", 
#       y = "Longitude",
#       fill = "pH",
#       title = "pH Contours in Maunalua Bay Zones") +
#  scale_fill_viridis_d(option = "plasma") +     # nicer colors
#  theme_igray() +
#  theme(axis.title = element_text(size = 20))


#ignore this incorrect code
#group_by(Variables, Zone, pH, percent_sgd) %>% # group by zone, pH, and SDG%
  
  
#ggplot(ChemData_clean, #fix
#       mapping = aes(x = Lat,
#                     y = Long,
#                     z = pH,
#                     fill = Zone)) + 
#  geom_contour_filled()+ 
#  stat_contour_filled(aes(fill = pH))+
#  labs(x = "Percent SGD", 
#       y = "pH",
#       color = "Waypoint",
#       fill = "Zone",
#       title = "Percent SGD and pH in Maunalua Bay Zones") +
#  scale_colour_ghibli_d("MarnieMedium2") +
#  theme_igray() +
#  theme(axis.title = element_text(size = 20))




