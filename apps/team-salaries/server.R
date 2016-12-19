# My Shinyapps.io web is 
# https://jiushuang.shinyapps.io/team-salaries/
# imported function: install_package_app

#source utility function and install pacakges
source("../../code/functions/function_app.R")
install_package_app()

#import library
library(shiny)
library("ggplot2")
library("dplyr")


team_data = read.csv(file = "../../data/cleandata/team-salaries.csv", stringsAsFactors = FALSE)

head(team_data)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    if (input$trend == "Increasing") {
      ggplot(data = team_data,
             aes(reorder (x = team_data$X, team_data[[input$stats_type]]),
                 y = team_data[[input$stats_type]])) +
        geom_bar(stat = "identity", fill = input$fill_color) +
        labs(title = "Statistics of team salary",
             x = "team",
             y = as.character(input$stats_type)) +
        coord_flip()
    }
    else if (input$trend == "Decreasing") {
      ggplot(data = team_data,
             aes(reorder (x = team_data$X,-team_data[[input$stats_type]]),
                 y = team_data[[input$stats_type]])) +
        geom_bar(stat = "identity", fill = input$fill_color) +
        labs(title = "Statistics of team salary",
             x = "team",
             y = as.character(input$stats_type)) +
        coord_flip()
    }
    
  })
  
})
