
#-------------------------------
# Script for the Salary statistics per team
#-------------------------------

# read the clean data 
roster_data = read.csv(file = "data/cleandata/roster-salary-stats.csv" , header = TRUE, stringsAsFactors = FALSE)

# remove the extra column
roster_data = roster_data[, -1]

# split the entire dataframe into a big list by the team
team_split = split(roster_data, roster_data$team)

# reorder team in alphabetical order
different_team = sort(unique(roster_data$team))

# assign the name 
new_names = as.character(different_team)
for (i in 1:length(team_split)) {
  assign(new_names[i], team_split[[i]])
}

# create a matrix -- a container
summary_salary = matrix(0, nrow = length(different_team), ncol = 10)

# fill in the matrix with data -- each team per row 
summary_df = for (i in 1:length(team_split)) {

  summary_salary[i, 2] = min(team_split[[i]]$salary)
  summary_salary[i, 3] = as.numeric(quantile(team_split[[i]]$salary, 0.25))
  summary_salary[i, 4] = median(team_split[[i]]$salary)
  summary_salary[i, 5] = mean(team_split[[i]]$salary)
  summary_salary[i, 6] = as.numeric(quantile(team_split[[i]]$salary, 0.75))
  summary_salary[i, 7] = max(team_split[[i]]$salary)
  summary_salary[i, 8] = sum(team_split[[i]]$salary)
  summary_salary[i, 9] = as.integer(IQR(team_split[[i]]$salary))
  summary_salary[i, 10] = as.integer(sd(team_split[[i]]$salary))

}

# put team names in the first column
summary_salary[,1] = different_team 


# make summary_salary a data frame 
summary_salary = data.frame(summary_salary)


#add column names -- team names
colnames(summary_salary) = c(
  "Team" ,"Mininum","First_Quatile","Median","Mean", "Third_Quatile","Maximum",
  "Total_Pay_Roll", "Interquatile","Standard_Deviation"
)


# write in a csv file
write.csv(
  summary_salary, file = "data/cleandata/team-salaries.csv", row.names =
    TRUE)


