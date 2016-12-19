# My Shinyapps.io web is 
# https://jiushuang.shinyapps.io/stat-salaries/
# imported function: install_package_app

#source utility function and install pacakges
source("../../code/functions/function_app.R")
install_package_app()

#import library
library(shiny)
library("ggplot2")
library("dplyr")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Relationship between EFF and Salary"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "x_axis", label  = "Choose a statistics type for X axis", 
                  choices = c("total_points", "total_rebounds", "assists", "steals", "blocks", 
                              "missed_field_goals", "missed_free_throws", "turnovers",
                              "games_played","Efficiency_index", "salary"), 
                  selected ="Efficiency_index", multiple = FALSE ),
      
      # select box to choose a statistic type for Y axis 
      selectInput(inputId = "y_axis", label = "Choose a statistics type for Y axis", 
                  choices = c("total_points", "total_rebounds", "assists", "steals", "blocks", 
                              "missed_field_goals", "missed_free_throws", "turnovers",
                              "games_played","Efficiency_index", "salary"), 
                  selected ="salary", multiple = FALSE ),
      
      # select whether show color by position 
      radioButtons(inputId = "color_show", label = "Whether show color by position", 
                   choices = c("yes", "no"), selected = "yes" )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
