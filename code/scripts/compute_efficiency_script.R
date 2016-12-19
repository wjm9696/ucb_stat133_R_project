#-------------------------------
# Performance of players Scripts
# This Script computes Efficency of players by Principal Components Analysis (PCA)
# Second Part of the script measures value of player by rato of efficency to salary
# and save the top and last 20 valuable players in text file-- 
# best-worst-value-players.txt inside the data/cleandata directory
# Imported function: install_package_efficiency.
#-------------------------------

#source utility function and install pacakges
source("code/functions/function_efficiency.R")
install_package_efficiency()

#import packages
library(dplyr, warn.conflicts = FALSE)
library(ggplot2, warn.conflicts = FALSE)
library(FactoMineR, warn.conflicts = FALSE)

dat <- read.csv("data/cleandata/roster-salary-stats.csv",
                row.names = 1,
                stringsAsFactors = FALSE)

# =========================================================================
# Exploring variables to be used in Efficiency
# =========================================================================

# subset data for position 'PG' (point guard)
# and add Missed Field Goals MFG, Missed Free Throws MFT, Turnovers TO
position_chr = c("C", "PF", "SF", "SG", "PG")


# =========================================================================
# Efficiency
# =========================================================================

# subset data for position 'PG' (point guard)
# and add Missed Field Goals MFG, Missed Free Throws MFT, Turnovers TO
# (these variables have negative sign)
new_pg = data.frame()
for (i in 1:5) {
  pg <- dat %>%
    filter(position == position_chr[i]) %>%
    mutate(missed_free_throws = free_throw - free_throw_attempts) %>%
    mutate(missed_field_goals = field_goal - field_goal_attempts) %>%
    mutate(TO = -1 * turnovers)
  
  
  # statistics for efficiency
  stats <- c('points', 'total_rebounds', 'assists', 'steals', 'blocks', 'missed_field_goals', 
             'missed_free_throws', 'turnovers')
  
  # keep in mind that all variables are divided by number of games
  X <- as.matrix(pg[ ,stats] / pg$games_played)
  print(round(cor(X), 2), print.gap = 2)
  
  # PCA with prcomp()
  pg_pca <- prcomp(X, center = TRUE, scale. = TRUE)
  pg_weights <- abs(pg_pca$rotation[,1])
  
  # std deviations
  pg_sigmas <- apply(X, 2, sd)
  
  # modified efficiency
  pg_eff <- X %*% (pg_weights / pg_sigmas)
  pg$EFF <- pg_eff
  new_pg = rbind(new_pg, pg)}


#============================

# build table for wanted data
efficiency_table = data.frame(new_pg$player, new_pg$points, new_pg$total_rebounds,new_pg$assists, 
                              new_pg$steals, new_pg$blocks, new_pg$missed_field_goals, 
                              new_pg$missed_free_throws,new_pg$turnovers, new_pg$games_played, 
                              new_pg$EFF, new_pg$salary,new_pg$position)


# set column names for the table
colnames(efficiency_table) = c("player_name", "total_points", "total_rebounds", "assists", 
                               "steals", "blocks", "missed_field_goals", "missed_free_throws", 
                               "turnovers", "games_played", "Efficiency_index", "salary",
                               "position")

# produce csv file 
write.csv(
  efficiency_table, file = "data/cleandata/eff-stats-salary.csv", row.names =
    TRUE)

#================================
# add value as a column in pg table
efficiency_table$value = as.numeric(efficiency_table$Efficiency_index) / as.numeric(efficiency_table$salary)

# rearrange pg by value 
efficiency_table$Efficiency_index= as.vector(efficiency_table$Efficiency_index)
increasing_value = arrange(efficiency_table, desc(value))

# get top 20 and last 20 players according to their value 
top20 = head(increasing_value$player, 20L)
tail20 = tail(increasing_value$player, 20L)

best_worst = data.frame(top20, tail20)


# sink the names in the text 
sink("./data/cleandata/best-worst-value-players.txt")
best_worst
sink()