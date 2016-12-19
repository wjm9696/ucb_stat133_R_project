#-----------------------------
# clean-data-script.R
# this scripts use raw data collected in download-data-scripts.R. bind all team 
# tables together and join salary roster and stats table together using inner join by player
# export clean table to desired path
# Imported functions: install_package_clean, read_raw_table, modify_column.
#-----------------------------

#install required packages and source function
source("code/functions/function_clean.R")
install_package_clean()

#import library
library(XML, warn.conflicts = FALSE)
library(dplyr, warn.conflicts = FALSE)
library(stringr, warn.conflicts = FALSE)

#create directory to stored clean data
dir.create("data/cleandata/", showWarnings = FALSE)

# base url
basketref <- 'http://www.basketball-reference.com'

# parse 'http://www.basketball-reference.com/leagues/NBA_2016.html'
url <- paste0(basketref, '/leagues/NBA_2016.html')
doc <- htmlParse(url)

# identify nodes with anchor tags for each team and extract the href attribute from the anchor tags
team_rows <- getNodeSet(doc, "//th[@scope='row']/a")
team_hrefs <- xmlSApply(team_rows, xmlAttrs)

# just in case, here's the character vector with the team abbreviations
team_names <- substr(team_hrefs, 8, 10)

#folder path vector
file_folder = c("data/rawdata/roster-data/roster-", 
				"data/rawdata/salary-data/salaries-",
				"data/rawdata/stat-data/totals-")

#scrap data from website
result = read_raw_table(file_folder, team_names)

#read table
table_roster = data.frame(result[1])
table_salary = data.frame(result[2])
table_stat = data.frame(result[3])

#change column name
names(table_roster)[names(table_roster) == 'roster.Player'] <- 'player'
names(table_salary)[names(table_salary) == 'salaries.Player'] <- 'player'
names(table_stat)[names(table_stat) == 'totals.Player'] <- 'player'

#inner join three tables
joined_table = inner_join(table_roster, table_salary, by = c("player" = "player","team"="team"))
joined_table = inner_join(joined_table, table_stat, by = c("player" = "player","team"="team"))

#modify column name
joined_table = modify_column(joined_table, "roster.Pos", "position")
joined_table = modify_column(joined_table, "roster.Ht", "height")
joined_table = modify_column(joined_table, "roster.Wt", "weight")
joined_table = modify_column(joined_table, "roster.Birth.Date", "date_of_birth")
joined_table = modify_column(joined_table, "roster..", "country")
joined_table = modify_column(joined_table, "roster.Exp", "year_of_experience")
joined_table = modify_column(joined_table, "roster.College", "college")
joined_table = modify_column(joined_table, "totals.G", "games_played")
joined_table = modify_column(joined_table, "totals.GS", "games_started")
joined_table = modify_column(joined_table, "totals.MP", "minutes_played")
joined_table = modify_column(joined_table, "totals.FG", "field_goal")
joined_table = modify_column(joined_table, "totals.FGA", "field_goal_attempts")
joined_table = modify_column(joined_table, "totals.FG.", "field_goal_percent")
joined_table = modify_column(joined_table, "totals.3P", "three_point_total")
joined_table = modify_column(joined_table, "totals.3PA", "three_point_attempt")
joined_table = modify_column(joined_table, "totals.3P.", "three_point_percent")
joined_table = modify_column(joined_table, "totals.eFG.", "effective_goal_percent")
joined_table = modify_column(joined_table, "totals.FT", "free_throw")
joined_table = modify_column(joined_table, "totals.FTA", "free_throw_attempts")
joined_table = modify_column(joined_table, "totals.FT.", "free_throw_percent")
joined_table = modify_column(joined_table, "totals.2P", "two_point_total")
joined_table = modify_column(joined_table, "totals.2PA", "two_point_attempt")
joined_table = modify_column(joined_table, "totals.2P.", "two_point_percent")
joined_table = modify_column(joined_table, "totals.AGE", "age")
joined_table = modify_column(joined_table, "totals.ORB", "offensive_rebounds")
joined_table = modify_column(joined_table, "totals.DRB", "defensive_rebounds")
joined_table = modify_column(joined_table, "totals.TRB", "total_rebounds")
joined_table = modify_column(joined_table, "totals.AST", "assists")
joined_table = modify_column(joined_table, "totals.STL", "steals")
joined_table = modify_column(joined_table, "totals.BLK", "blocks")
joined_table = modify_column(joined_table, "totals.TOV", "turnovers")
joined_table = modify_column(joined_table, "totals.PF", "personal_fouls")
joined_table = modify_column(joined_table, "totals.PTS", "points")
joined_table = modify_column(joined_table, "totals.Age", "age")
joined_table = modify_column(joined_table, "totals.Rk", "total_rank")
joined_table = modify_column(joined_table, "roster.No.", "uniform_number")
joined_table = modify_column(joined_table, "salaries.Salary", "salary")
joined_table = modify_column(joined_table, "salaries.Rk", "salary_rank")

#change date of birth to date format 
joined_table$date_of_birth <- as.Date(joined_table$date_of_birth, format='%B %d, %Y');

#change string height to height in feet
vectorSplitted = str_split(joined_table$height,"-") #split with "-"
inch = as.numeric(sapply(vectorSplitted,'[',1))
feet = as.numeric(sapply(vectorSplitted,'[',2))
feet_as_all = inch*12 + feet
joined_table$height = feet_as_all

#fill none value to NA for college
joined_table <-  joined_table %>% mutate(college = replace(college, college=='', NA))

#remove $ sign from dollar sign
joined_table$salary<-as.numeric(gsub('[$,]',"",as.character(joined_table$salary)))

#change R in experience to 0
joined_table <-  joined_table %>% mutate(year_of_experience = replace(year_of_experience, year_of_experience=='R', 0))
joined_table$year_of_experience = as.numeric(joined_table$year_of_experience)

joined_table = joined_table[!duplicated(joined_table[,c('player')]),]

#write out
#please make sure plyr is not installed at this point. There might be a conflict issue.
cleaned_table = select(joined_table, -X.x, -X.y, -X)
file_name = "data/cleandata/roster-salary-stats.csv"
write.csv(cleaned_table, file = file_name)

