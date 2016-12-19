#-------------------------------
# EDA Script 
# This script is a Exploratory Data Analysis(EDA) script, 
# which analizes the different statistics of both quatatative variables 
# and qualiative variables. Also, this script uses ggplot to visualize the 
# statistics of these variables.
# Imported function: install_package_correlation_eda. 
#-------------------------------

#source utility function and install pacakges
source("code/functions/function_correlation.R")
install_package_correlation_eda()

#import packages
library("dplyr", warn.conflicts = FALSE)
library("stringr", warn.conflicts = FALSE)
library("MASS", warn.conflicts = FALSE)
library("ggplot2", warn.conflicts = FALSE)
library("plyr", warn.conflicts = FALSE)

#create a folder called cleandata
dir.create("data/cleandata", showWarnings = FALSE)

# import rawdata
data_table = read.csv(file = "data/cleandata/roster-salary-stats.csv" ,
                      header = TRUE,
                      stringsAsFactors = FALSE)
data_table = data_table[,-1]


# extract year of palyer's birthday and add to the table
data_table$birthday_year = as.numeric(str_extract(data_table[, "date_of_birth"], "[0-9]{4,}"))

# the quantatative columes
quantatative_variable = list(
  "uniform_number",
  "height",
  "weight",
  "year_of_experience",
  "salary_rank",
  "salary",
  "total_rank",
  "age",
  "games_played",
  "games_started",
  "minutes_played" ,
  "field_goal",
  "field_goal_attempts",
  "field_goal_percent" ,
  "three_point_total",
  "three_point_attempt",
  "three_point_percent" ,
  "two_point_total",
  "two_point_attempt",
  "two_point_percent",
  "effective_goal_percent",
  "free_throw",
  "free_throw_attempts",
  "free_throw_percent",
  "offensive_rebounds",
  "defensive_rebounds",
  "total_rebounds",
  "assists",
  "steals",
  "blocks",
  "turnovers",
  "personal_fouls",
  "points",
  "birthday_year"
)


# Mean for all quantatative data 
data_mean = 1:length(quantatative_variable)
for (i in 1:length(quantatative_variable)) {
  data_mean[i] = round(mean(data_table[, quantatative_variable[[i]]], na.rm = TRUE), digits = 2)
}


# Max for all quantatative data 
data_max = 1:length(quantatative_variable)
for (i in 1:length(quantatative_variable)) {
  data_max[i] = round(max(data_table[, quantatative_variable[[i]]], na.rm = TRUE), digits = 2)
}


# Min for all quantatative data 
data_min = 1:length(quantatative_variable)
for (i in 1:length(quantatative_variable)) {
  data_min[i] = round(min(data_table[, quantatative_variable[[i]]], na.rm = TRUE), digits = 2)
}


# ranger for all quantatative data 
data_range = 1:length(quantatative_variable)
for (i in 1:length(quantatative_variable)) {
  data_range[i] = round(max(data_table[, quantatative_variable[[i]]]), digits = 2)
  - round(min(data_table[, quantatative_variable[[i]]],
              na.rm = TRUE), digits = 2)
}

# sd for all quantatative data 
data_sd = 1:length(quantatative_variable)
for (i in 1:length(quantatative_variable)) {
  data_sd[i] = round(sd(data_table[, quantatative_variable[[i]]], na.rm = TRUE), digits = 2)
}

# median for all quantatative variable
data_median = 1:length(quantatative_variable)
for (i in 1:length(quantatative_variable)) {
  data_median[i] = round(median(data_table[, quantatative_variable[[i]]], na.rm = TRUE), digits = 2)
}


# create data frame for quantatative data 
quantatative_variable = c(
  "uniform_number",
  "height",
  "weight",
  "year_of_experience",
  "salary_rank",
  "salary",
  "total_rank",
  "age",
  "games_played",
  "games_started",
  "minutes_played" ,
  "field_goal",
  "field_goal_attempts",
  "field_goal_percent" ,
  "three_point_total",
  "three_point_attempt",
  "three_point_percent" ,
  "two_point_total",
  "two_point_attempt",
  "two_point_percent",
  "effective_goal_percent",
  "free_throw",
  "free_throw_attempts",
  "free_throw_percent",
  "offensive_rebounds",
  "defensive_rebounds",
  "total_rebounds",
  "assists",
  "steals",
  "blocks",
  "turnovers",
  "personal_fouls",
  "points",
  "birthday_year"
)


# make dataframe of statistics of quantatative data
df = data.frame(data_mean, data_max, data_min, data_range, data_sd, data_median)

# set row names and column names of dataframe
rownames(df) = quantatative_variable
colnames(df) = c ("Mean", "Max", "Min", "Range", "Standard Deviation", "Median")

# sink data frame into txt file 
sink("./data/cleandata/eda-output.txt")
df
sink()

#==========================================
# visualize quantatative data

# use loop to visualize quantatative data
for (i in 1:length(quantatative_variable)) {
  # set the path of histogram to be saved as png file
  path1 = file.path("./images",
                    paste(quantatative_variable[i], "histogram", ".png", sep = ""))
  
  # visualize data by histogram and save as png file
  png(file = path1)
  hist(
    as.numeric(unlist(data_table[quantatative_variable[i]])),
    main = paste(quantatative_variable[i], "histogram"),
    xlab = paste("x axis:", quantatative_variable[i])
  )
  dev.off()
  
  # set the path of boxplot to be saved as png file
  path2 = file.path("./images",
                    paste(quantatative_variable[i], "boxplot", ".png", sep = ""))
  
  # visualize data by boxplot and save as png file
  png(file = path2)
  boxplot(
    as.numeric(unlist(data_table[quantatative_variable[i]])),
    main = paste(quantatative_variable[i], "boxplot"),
    ylab = paste("y axis:", quantatative_variable[i])
  )
  dev.off()
  
}


#========================================
# For qualitative data

#frequency table of qualitative variables
position_freq <- count(data_table, "position")
team_freq <- count(data_table, "team")
country_freq <- count(data_table, "country")
college_freq =  count(data_table, "college")

# last row is missing value, remove it
college_freq = college_freq[-122,]

# visualize the qualitative data and save them in folder

# visualize by position
path4 = file.path("./images",
                  paste("position", "barplot", ".png", sep = ""))
png(file = path4)
ggplot(data = position_freq,
       aes(x = position, y = freq)) +
  ggtitle("Player Position Frequency Chart") +
  geom_bar(stat = "identity")
dev.off()

# visualize by team
path5 = file.path("./images",
                  paste("team", "barplot", ".png", sep = ""))
png(file = path5)
ggplot(data = team_freq,
       aes(x = team, y = freq)) +
  ggtitle("Player Team Frequency Chart") +
  geom_bar(stat = "identity")
dev.off()

# visualize by country
path6 = file.path("./images",
                  paste("country", "barplot", ".png", sep = ""))
png(file = path6)
ggplot(data = country_freq,
       aes(x = country, y = freq)) +
  ggtitle("Player country Frequency Chart") +
  geom_bar(stat = "identity")
dev.off()

# visualize by college
path7 = file.path("./images",
                  paste("college", "barplot", ".png", sep = ""))
png(file = path7)
ggplot(data = college_freq,
       aes(x = college, y = freq)) +
  ggtitle("Player college Frequency Chart") +
  geom_bar(stat = "identity")
dev.off()
