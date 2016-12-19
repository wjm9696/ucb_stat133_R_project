# My Shinyapps.io web is 
# https://jiushuang.shinyapps.io/team-salaries/
# imported function: install_package_app

# source utility function and install pacakges
source("../../code/functions/function_app.R")
install_package_app()

#import library
library(shiny)
library("ggplot2")
library("dplyr")


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Statistics of Team Salaries"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # select box to choose a statistic type
      
      selectInput(inputId = "stats_type", label = "Choose a statistics type", 
                  choices = c("Mininum", "First_Quatile", "Median", "Mean", "Third_Quatile", 
                              "Maximum", "Total_Pay_Roll", "Interquatile", "Standard_Deviation"), 
                  selected ="Mean", multiple = FALSE ),
      selectInput(inputId = "trend", label = "Choose trend", choices = c("Increasing", "Decreasing"),
                  selected = "increasing", multiple = FALSE),
      selectInput(inputId = "fill_color", label = "Choose a color", 
                  choices = c("lightsalmon", "steelblue", "palegreen","burlywood", "grey"), 
                  selected = "steelblue", multiple = FALSE )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
