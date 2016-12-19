#-------------------------------
# This is the script describes correlation between the different skills and salary
# also different positions and salaries. 
# Plot the least square regression line and correlation coefficient
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
library("readr", warn.conflicts = FALSE)
library("reshape2", warn.conflicts = FALSE)

#=================================
# setup
#==================================
# read in clean roster data
data_table = read.csv(file = "data/cleandata/roster-salary-stats.csv" , header = TRUE, stringsAsFactors = FALSE)
data_table = data_table[, -1]

# read in Efficency data
EFF_table = read.csv(file = "data/cleandata/eff-stats-salary.csv")

# add position column to Efficency table 
EFF_table$position = data_table$position


#----------------------------------------------------------
# Plot and correlation between different skills and salaries

#===========================================================
# total_points-- Least Square line and correlation
#===========================================================

# total_points-- Least Square line and correlation

# Relationship between total points and salary 
plot_corr(x_axis = EFF_table$total_points, y_axis = EFF_table$salary,
          title_content = "Relationship between total_points and salary",
          x_lab="total_points", y_lab = "salary" )

# correlation coefficent 
total_points_cor = round(cor(EFF_table$total_points,EFF_table$salary), 
                         digits = 2)
paste("correlation coefficient is", total_points_cor)


#=======================================
# total_rebounds-- Least Square line and correlation
#========================================
# Relationship between total points and salary 
plot_corr(x_axis = EFF_table$total_rebounds, y_axis = EFF_table$salary,
          title_content = "Relationship between total_rebounds and salary",
          x_lab="total_rebounds", y_lab = "salary" )
# correlation coefficent 
total_rebounds_cor = round(cor(EFF_table$total_rebounds,EFF_table$salary), 
                           digits = 2)
paste("correlation coefficient is", total_rebounds_cor)





#=======================================
# assists-- Least Square line and correlation
#========================================
# Relationship between total points and salary 
plot_corr(x_axis = EFF_table$assists, y_axis = EFF_table$salary,
          title_content = "Relationship between assists and salary",
          x_lab="assists", y_lab = "salary" )
# correlation coefficent 
total_assists_cor = round(cor(EFF_table$assists,EFF_table$salary), 
                          digits = 2)
paste("correlation coefficient is", total_assists_cor)


#=======================================
# steals-- Least Square line and correlation
#========================================
# Relationship between total points and salary 
plot_corr(x_axis = EFF_table$steals, y_axis = EFF_table$salary,
          title_content = "Relationship between steals and salary",
          x_lab="steals", y_lab = "salary" )
# correlation coefficent 
total_steals_cor = round(cor(EFF_table$steals,EFF_table$salary), 
                         digits = 2)
paste("correlation coefficient is", total_steals_cor)


#=======================================
# blocks-- Least Square line and correlation
#========================================
# Relationship between total points and salary 
plot_corr(x_axis = EFF_table$blocks, y_axis = EFF_table$salary,
          title_content = "Relationship between blocks and salary",
          x_lab="blocks", y_lab = "salary" )
# correlation coefficent 
total_blcoks_cor = round(cor(EFF_table$steals,EFF_table$salary), 
                         digits = 2)
paste("correlation coefficient is", total_blcoks_cor)


#=======================================
# missed_field_goals-- Least Square line and correlation
#========================================
# Relationship between total points and salary 


plot_corr(x_axis =  EFF_table$missed_field_goals, y_axis = EFF_table$salary,
          title_content = "Relationship between missed_field_goal percent and salary",
          x_lab="missed field goals", y_lab = "salary" )
# correlation coefficent 
missed_field_goal_cor = round(cor(EFF_table$missed_field_goals,EFF_table$salary), 
                       digits = 2)
paste("correlation coefficient is", missed_field_goal_cor)


#=======================================
# missed_free_throw_percent-- Least Square line and correlation
#========================================
# Relationship between total points and salary 



plot_corr(x_axis =  EFF_table$missed_free_throws, y_axis = EFF_table$salary,
          title_content = "Relationship between missed_free_throw and salary",
          x_lab="missed_field_goal percent", y_lab = "salary" )
# correlation coefficent 
free_throw_percent_cor = round(cor(EFF_table$missed_free_throws,EFF_table$salary), 
                               digits = 2)
paste("correlation coefficient is", free_throw_percent_cor)


#=======================================
# turnovers-- Least Square line and correlation
#========================================
# Relationship between total points and salary 
plot_corr(x_axis = EFF_table$turnovers, y_axis = EFF_table$salary,
          title_content = "Relationship between turnovers and salary",
          x_lab="blocks", y_lab = "salary" )
# correlation coefficent 
turnovers_cor = round(cor( EFF_table$turnovers,EFF_table$salary), 
                      digits = 2)
paste("correlation coefficient is", turnovers_cor)




#=======================================
# games played-- Least Square line and correlation
#========================================
# Relationship between total points and salary 
plot_corr(x_axis = EFF_table$games_played, y_axis = EFF_table$salary,
          title_content = "Relationship between games_played and salary",
          x_lab="blocks", y_lab = "salary" )
# correlation coefficent 
games_played_cor = round(cor( EFF_table$games_played,EFF_table$salary), 
                         digits = 2)
paste("correlation coefficient is", games_played_cor)


#-------------------------------------------
# Plot and correlation between different positions and salaries


#=======================================
# All position-- Least Square line and correlation
#========================================
# set x and y 
all_x = EFF_table$Efficiency_index
all_y = EFF_table$salary

# find least suqare regression 
approximation = lm(salary~Efficiency_index, data = EFF_table)

# plot the data and least suqare regression line 
plot(salary~Efficiency_index,EFF_table)
abline(approximation$coefficients[1],approximation$coefficients[2],col="blue")
title(main = "All Position Plot")

# Find the correlation coefficient 
all_cor = round(cor(x= all_x, y = all_y), digits = 2)

paste("correlation coefficient is", all_cor)



#=======================================
# Position Point Guard(PG)-- Least Square line and correlation
#========================================
# Filter with position PG
PG_EFF = filter(EFF_table,position == "PG" )

# set x and y 
PG_x = PG_EFF$Efficiency_index
PG_y = PG_EFF$salary

# find least suqare regression 
approximation = lm(salary~Efficiency_index, data = PG_EFF)

# plot the data and least suqare regression line 
plot(salary~Efficiency_index,PG_EFF)
abline(approximation$coefficients[1],approximation$coefficients[2],col="blue")
title(main = "Point Guard(PG) Position Plot")

# Find the correlation coefficient 
PG_cor = round(cor(x= PG_x, y = PG_y), digits = 2)
paste("correlation coefficient is", PG_cor)


#=======================================
# Pisotion Center(C)-- Least Square line and correlation
#========================================
# Filter with position PG
C_EFF = filter(EFF_table,position == "C" )

# set x and y 
C_x = C_EFF$Efficiency_index
C_y = C_EFF$salary

# find least suqare regression 
approximation = lm(salary~Efficiency_index, data = C_EFF)

# plot the data and least suqare regression line 
plot(salary~Efficiency_index,C_EFF)
abline(approximation$coefficients[1],approximation$coefficients[2],col="blue")
title(main = "Center(C) Position Plot")

# Find the correlation coefficient 
C_cor = round(cor(x= C_x, y = C_y), digits = 2)
paste("correlation coefficient is", C_cor)


#=======================================
# Pisotion Small Forward(SF)-- Least Square line and correlation
#========================================
# Filter with position PG
SF_EFF = filter(EFF_table,position == "SF" )

# set x and y 
SF_x = SF_EFF$Efficiency_index
SF_y = SF_EFF$salary

# find least suqare regression 
approximation = lm(salary~Efficiency_index, data = SF_EFF)

# plot the data and least suqare regression line 
plot(salary~Efficiency_index,SF_EFF)
abline(approximation$coefficients[1],approximation$coefficients[2],col="blue")
title(main = "Small Forward(SF) Position Plot")

# Find the correlation coefficient 
SF_cor = round(cor(x= SF_x, y = SF_y), digits = 2)
paste("correlation coefficient is", SF_cor)

#=======================================
# Pisotion Power Forward(PF)-- Least Square line and correlation
#========================================
# Filter with position PG
PF_EFF = filter(EFF_table,position == "SF" )

# set x and y 
PF_x = PF_EFF$Efficiency_index
PF_y = PF_EFF$salary

# find least suqare regression 
approximation = lm(salary~Efficiency_index, data = PF_EFF)

# plot the data and least suqare regression line 
plot(salary~Efficiency_index,PF_EFF)
abline(approximation$coefficients[1],approximation$coefficients[2],col="blue")
title(main = "Power Forward(PF) Position Plot")

# Find the correlation coefficient 
PF_cor = round(cor(x= PF_x, y = PF_y), digits = 2)
paste("correlation coefficient is", PF_cor)


#=======================================
# Shooting Guards(SG)-- Least Square line and correlation
#========================================
# Filter with position PG
SG_EFF = filter(EFF_table,position == "SG" )

# set x and y 
SG_x = SG_EFF$Efficiency_index
SG_y = SG_EFF$salary

# find least suqare regression 
approximation = lm(salary~Efficiency_index, data = SG_EFF)

# plot the data and least suqare regression line 
plot(salary~Efficiency_index,SG_EFF)
abline(approximation$coefficients[1],approximation$coefficients[2],col="blue")
title(main = "Power SG Position Plot")

# Find the correlation coefficient 
SG_cor = round(cor(x= SG_x, y = SG_y), digits = 2)
paste("correlation coefficient is", SG_cor)



