
library(shiny)
library(tidyverse)

ui<-fluidPage(
  # input functions
  sliderInput(inputId = "num", # ID name for the input
              label = "Choose a Number", # label above the input
              value = 25, min = 1, max = 100), # values for the slider
  # common between ui functions will create something for slider use
  textInput(inputId = "title", # new Id is title
            label = "Write a Title",
            value = "Histogram of Random Normal Values"), # starting title

  # output functions
  plotOutput("hist"), # creates space for a plot called hist
  verbatimTextOutput("stats") # creates space for stats (go to server and create code now)
)

server<-function(input, output){
  
  data<-reactive({
    tibble(x = rnorm(input$num)) # edited data tibble with reactive
  })
  
  output$hist<-renderPlot({
    
     # {} allows us to put all our R code in one nice chunk
#   data<-tibble(x= rnorm(input$num)) # 100 random normal points generated based on slider input
     # now we remove the data tibble and use reactive() outside of renderPlot

#   ggplot(data, aes(x = x)) + # make a histogram
    ggplot(data(), aes(x = x)) + # new ggplot with reactive data for histogram
      geom_histogram() + 
      labs(title = input$title) # add a new title based on what user chooses
  })
  
     # new render function not associated with the histogram
  output$stats<- renderPrint({
#   summary(rnorm(input$num)) # calculate summary stats based on the numbers
     # right now they are coming from two different data sets (stats and plot)
    summary(data())
  })
}


shinyApp(ui = ui, server = server)





# Input Notes:
# what input is named followed by Input
# creates html for you so you do not have to create HTML
# every single input has an inputId and whatever you want to call it
# value that you are starting at when you open website
# inputId's dont need to be named "" capitalized, labels should


# Notes:
# everything in server can be written just like R 
# everything in ui fluid page needs to have commas between functions

# create a data frame that reacts to user
# turns your data set into a function that reacts throughout itself i think?
# speeds up your app (speeds backend process up)

# do this in the console after you already ran you shiny app
# library(rsconnect)
# deployApp() ## re-run this or republish after every update you make to your code












