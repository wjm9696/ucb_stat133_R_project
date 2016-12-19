# My Shinyapps.io web is 
# https://jiushuang.shinyapps.io/stat-salaries/
# imported function: install_package_app

##source utility function and install pacakges
source("../../code/functions/function_app.R")
install_package_app()

#import library
library(shiny)
library("ggplot2")
library("dplyr")

EFF_data = read.csv(file = "../../data/cleandata/eff-stats-salary.csv", stringsAsFactors = FALSE)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    # if user select yes for show color by position 
    if ( input$color_show == "yes") {
      # draw the scatterplot with the specified number of bins
      ggplot(EFF_data, aes(x = EFF_data[[input$x_axis]], y = EFF_data[[input$y_axis]], 
                           color = EFF_data$position))  +
        geom_point(size = 2)+
        labs(title = "Relation between stats chosen and efficency index", 
             x = as.character(input$x_axis), y = as.character(input$y_axis)) }
    
    # if user select no for show color by position 
    else{
      ggplot(EFF_data, aes(x = EFF_data[[input$x_axis]], y = EFF_data[[input$y_axis]]))  +
        geom_point(size = 2)+
        labs(title = "Relation between stats chosen and efficency index", 
             x = as.character(input$x_axis), y = as.character(input$y_axis)) }
    
  })
  
})
