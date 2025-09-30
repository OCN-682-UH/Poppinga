### Introduction to Plotting and Plotting 2
### Created by: Haley Poppinga
### Created on: 2025_09_09
###########################################

### Load libraries ########## 
library(tidyverse)
library(here)
library(ggplot2)
library(palmerpenguins)
library(beyonce)
library(ggthemes)

### Read in data ###
#The data is part of the package and is called penguins
glimpse(penguins)


# Data: Palmer Penguins plot

ggplot(data=penguins, #should be comma in between every function
       mapping = aes(x = bill_depth_mm, #map bill depth to the x-axis 
                     y = bill_length_mm,#map bill length to the y-axis
                     color = species)) + #change in aesthetic
      geom_point() +          #Represent each observation with a point and map species to the colour of each point
      labs(title = "Bill Depth and Length", #change labels and titles  #everything related to a title you can change in lab function
           subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
           x = "Bill Depth (mm)", y = "Bill Length (mm)", 
           color = "Species",  #label the legend
           caption = "Source: Palmer Station LTER / palmerpenguins package") + #add caption for source of data
  scale_color_viridis_d() #discrete color scale palette better for colorblind
#check: if you press enter, lines should line up with each other if done correctly

#Aesthetic Options
# color, shape, size, alpha (transparency)

#Shape, Size, Alpha
ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     color = species,
                     shape = island, #mapped to a different variable than color (can also map to same variable as color)
                     size = body_mass, #adding size to points
                     alpha = flipper_len)) + #good for adding p-values to make it pop #adding a shape legend
  geom_point() +
  labs(title = "Bill Depth and Length", 
       subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
       x = "Bill Depth (mm)", y = "Bill Length (mm)", 
       color = "Species",
       shape = "Island", #capitalizing the title of legend
       size = "Body Mass (g)",
       alpha = "Flipper Length (mm)",
       caption = "Source: Palmer Station LTER / palmerpenguins package") +
  scale_color_viridis_d()


#Mapping vs Setting
#Mapping: Determine the size, shape, alpha, etc. of points **based on the values of a variable** in the data goes into
#Setting: Determine the size, shape, alpha, etc. of points **not** based on the values of a variable in the data goes into .orange[geom_*()]. 
#This was geom_point() in the previous example, but we will learn more geoms soon.   
                     
#Mapping
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     size = body_mass_g, 
                     alpha = flipper_length_mm)) +
  geom_point()

#Setting
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) +
  geom_point(size = 2, alpha = 0.5)


#Faceting
ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(species~sex) #grid will always be perfectly grided, cant control how many rows and columns
# make multiple plots groups by species on the y (rows) and and sex on the x (columns) 

ggplot(penguins, 
       aes(x = bill_depth_mm,
           y = bill_length_mm))+
  geom_point()+
  facet_grid(sex~species)
# make multiple plots groups by sex on the y (rows) and and species on the x (columns) 

ggplot(penguins, aes(x = bill_dep, y = bill_len)) + 
  geom_point() +
  facet_wrap(~ species) #describe exactly how many rows and columns you want, wraps it down

ggplot(penguins, aes(x = bill_dep, y = bill_len)) + 
  geom_point() +
  facet_wrap(~ species, ncol=2) # make it two columns 

# Facet and color
#multiple ways to visualize data
    ggplot(data=penguins, 
           mapping = aes(x = bill_dep,
                         y = bill_len,
                         color = species)) +
      geom_point()+
      scale_color_viridis_d()+
      facet_grid(species~sex)

#Facet and color, no legend
    ggplot(data=penguins, 
           mapping = aes(x = bill_dep,
                         y = bill_len,
                         color = species, #<<
           )) +
      geom_point()+
      scale_color_viridis_d()+
      facet_grid(species~sex)+
      guides(color = FALSE) #delete specifically
    

###########################################
#Plotting 2 (2nd Lecture)
    
#Make a simple plot
#Data analysis section
ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm,   #bill depth
                     y = bill_length_mm,
                     group = species, #plot relationship by species (group by whatever variable we give it)
                     color = species) #add colors by species
       ) + 
      geom_point() +
      geom_smooth(method = "lm") + #adds new data set/method, "lm" adds linear model, can also add standard error (se = FALSE)
      labs(x = "Bill Depth (mm)",
           y = "Bill Length (mm)") +
      scale_color_viridis_d() #change color scale
    
#Scales
ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm,
                         y = bill_length_mm,
                         group = species,
                         color = species)) + 
      geom_point() +
      geom_smooth(method = "lm") + 
      labs(x = "Bill Depth (mm)",
           y = "Bill Length (mm)") + 
      scale_color_viridis_d() + 
      scale_x_continuous(limits = c(0,20)) +# set x limits from 0 to 20 
      scale_y_continuous(limits = c(0,50)) #change y axis 0 to 50
    
    # Note anytime you make a vector you need to put "c" which means "concatenate

#Change x breaks and labels
ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm,
                         y = bill_length_mm,
                         group = species,
                         color = species)) + 
      geom_point()+ 
      geom_smooth(method = "lm")+ 
      labs(x = "Bill depth (mm)", 
           y = "Bill length (mm)"
      ) +
      scale_color_viridis_d()+
      scale_x_continuous(breaks = c(14, 17, 21), #change x breaks
                         labels = c("low", "medium", "high")) #catatenating a vector at 14, 17, and 21
    
ggplot(data=penguins,
       mapping = aes(x = bill_depth_mm,
                         y = bill_length_mm,
                         group = species,
                         color = species)) + 
      geom_point()+ 
      geom_smooth(method = "lm")+ 
      labs(x = "Bill depth (mm)", 
           y = "Bill length (mm)"
      ) +
      #scale_color_viridis_d() #<<
      scale_color_manual(values = c("orange", "purple", "green")) #manually chnage color values 


#Change scales: Use one of the Beyonce color palettes.  
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(2)) #uses beyonce color pallette instead of values = color green and blue e.g.

#Change coordinates: Flip the axes
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) + #change palette
  coord_flip() # flip x and y axes

#Control the aspect ratio
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(20)) +
  coord_fixed(ratio = 1.5) # fix axes
# coord fixed gives it an exact 1:1 ratio. Squeezed so that one point on the x is the same as one point on the y
# add ratio = 1.5 in parentheses to change aspect ratio and change scale of that ratio


#Change coordinates: Transform the x and y-axis (log10)
ggplot(diamonds, aes(carat, price)) +
  geom_point() 

ggplot(diamonds, aes(carat, price)) +
  geom_point() +
  coord_trans(x = "log10", y = "log10") #changes coordinate system but keeps the data exactly the same

#Change coordinates: make them polar
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  coord_polar("x") # make the polar

#Change theme: Make it theme_classic()
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  theme_classic()  #no grid lines of grey background


# Change theme: Make it theme_bw()
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  theme_bw()  #got rid of grey background and adds in axes lines 
#can also add in theme_grey()

### Themes: You can customize your theme further. 
# Change the font size for the axis labels. (within theme function). 
#Ådd theme function > layer in thing you want to change > element you want to change > what within the element you want to change. 
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill Depth (mm)", 
       y = "Bill Length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  theme_wsj() + #Wall Street Journal Theme
  theme(axis.title = element_text(size = 20, #also want to chane the color of the titles
                                  color = "red"), #increase axis title text size
       panel.background = element_rect(fill = "linen")) #change the panel background
#fill fills in an area of a polygon and color just changes the outline

#Play around with #theme()
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill depth (mm)", 
       y = "Bill length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(10)) +
  theme_bw() +
  theme(axis.title = element_text(size = 20,
                                  color = "purple"),
        legend.background = element_rect(fill = "purple")) #another function

# Save your plot
#Can see within ggfame.eps all the different ways to save
ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm,
                     group = species,
                     color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill Depth (mm)", 
       y = "Bill Length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(2)) +
  theme_bw() +
  theme(axis.title = element_text(size = 20),
        panel.background = element_rect(fill = "linen")) 

ggsave(here("Week_03","Output","penguin.png"), # specify width and height in inches
       width = 7, height = 5)  #can save as .jpg, .pdf too

#Save your plot as an object. 
#Shows up in environment and recall it later in our script.  

#Give it a plot1 and an assign to
plot1<-ggplot(data=penguins, #
              mapping = aes(x = bill_depth_mm,
                            y = bill_length_mm,
                            group = species,
                            color = species)) + 
  geom_point()+ 
  geom_smooth(method = "lm")+ 
  labs(x = "Bill Depth (mm)", 
       y = "Bill Length (mm)"
  ) +
  scale_color_manual(values = beyonce_palette(2)) +
  theme_bw() +
  theme(axis.title = element_text(size = 20),
        panel.background = element_rect(fill = "linen")) 

#Recall it anywhere in script and it will show you plot 1:
plot1 # you need to type it out to view it now. 



################################################################################

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










