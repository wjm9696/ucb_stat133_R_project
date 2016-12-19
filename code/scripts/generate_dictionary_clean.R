#-----------------------------
# generate_dictionary_clean.R
# This scripts help to generate dictionary table for team-salaries.csv and
# roster-salary-stats.csv and store them back to the "data/cleandata/cleandata_dictionary"
# folder.
#-----------------------------

#create directory if not exist.
dir.create("data/cleandata/cleandata_dictionary", showWarnings = FALSE)

#create salary dictionary data frame.
salary_dic <- data.frame(
  name = character(),
  plot_name = character(),
  description = character()
  ,
  stringsAsFactors = FALSE
)

#add rows to data frame
col_name <- names(salary_dic)
salary_dic <-
  rbind(salary_dic,
        c("team name", "team", "the team the row belongs to"),
        stringsAsFactors = FALSE)
names(salary_dic) <- col_name
salary_dic <-
  rbind(salary_dic,
        c("Mininum salary", "Mininum", "Mininum salary in the team"))
salary_dic <-
  rbind(salary_dic,
        c(
          "First Quatile salary",
          "First_Quatile",
          "First_Quatile in the team"
        ))
salary_dic <-
  rbind(salary_dic,
        c("Median salary", "Mean", "Median", "Mean in the team"))
salary_dic <-
  rbind(salary_dic,
        c(
          "Third Quatile salary",
          "Third_Quatile",
          "Third_Quatile in the team"
        ))
salary_dic <-
  rbind(salary_dic,
        c("Maximum salary", "Maximum_salary", "Maximum in the team"))
salary_dic <-
  rbind(salary_dic,
        c(
          "Total Pay Roll salary",
          "Total_Pay_Roll",
          "Total_Pay_Roll in the team"
        ))
salary_dic <-
  rbind(salary_dic,
        c(
          "Interquatile salary",
          "Interquatile",
          "Interquatile in the team"
        ))
salary_dic <-
  rbind(
    salary_dic,
    c(
      "Standard Deviation salary",
      "Standard_Deviation",
      "Standard_Deviation in the team"
    )
  )
# Store salary clean data frame back to disk as csv file.
file_name = "data/cleandata/cleandata_dictionary/salary_clean_dic.csv"
write.csv(salary_dic, file = file_name)

#create salary dictionary data frame.
clean_dic <- data.frame(
  name = character(),
  plot_name = character(),
  description = character()
  ,
  stringsAsFactors = FALSE
)

#add rows to data frame
col_name <- names(clean_dic)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's uniform_number",
    "uniform_number",
    "the number on the back of the uniform the player waers"
  ),stringsAsFactors = FALSE
)
names(clean_dic) <- col_name

clean_dic <- rbind(clean_dic,
                   c("player", "player", "the first and last name of the player"))
clean_dic <- rbind(
  clean_dic,
  c(
    "player's position",
    "position",
    "the position the player plays for in abbreviation form"
  )
)
clean_dic <- rbind(clean_dic,
                   c(
                     "player's height",
                     "height",
                     "the height of player, in inch and feet unit"
                   ))

clean_dic <- rbind(clean_dic,
                   c("player's weight", "weight", "the weight of the player in lbs unit"))
clean_dic <- rbind(
  clean_dic,
  c(
    "player's date_of_birth",
    "date_of_birth",
    "the date of birth of the player"
  )
)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's country",
    "country",
    "the nationality of the plaer in abbreviation"
  )
)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's year_of_experience",
    "year_of_experience",
    "the number of years in NBA"
  )
)
clean_dic <- rbind(clean_dic,
                   c(
                     "player's college",
                     "college",
                     "the college the player graduates from"
                   ))
clean_dic <- rbind(clean_dic,
                   c("player's team", "team", "the team player belongs to"))
clean_dic <- rbind(clean_dic,
                   c(
                     "player's salary_rank",
                     "salary_rank",
                     "the ranking of salary in his team"
                   ))
clean_dic <- rbind(clean_dic,
                   c("player's salary", "salary", "the total salary for the whole "))
clean_dic <- rbind(clean_dic,
                   c(
                     "player's total_rank",
                     "total_rank",
                     "the ranking of player in his team"
                   ))
clean_dic <- rbind(clean_dic, c("player's age", "age", "age of the player"))
clean_dic <- rbind(clean_dic,
                   c(
                     "player's games_played",
                     "games_played",
                     "number of games played"
                   ))
clean_dic <- rbind(
  clean_dic,
  c(
    "player's games_started",
    "games_started",
    "number of time player on field when game starts"
  )
)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's minutes_played",
    "minutes_played",
    "total number of minutes played"
  )
)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's field_goal",
    "field_goal",
    "scored on any shot or tap other than a free throw"
  )
)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's field_goal_attempts",
    "field_goal_attempts",
    "attempted scored on any shot or tap other than a free throw"
  )
)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's field_goal_percent",
    "field_goal_percent",
    "score percent on any shot or tap other than a free throw"
  )
)
clean_dic <-
  rbind(clean_dic,
        c(
          "player's three_point_total",
          "three_point_total",
          "3 points scored"
        ))
clean_dic <- rbind(
  clean_dic,
  c(
    "player's three_point_attempt",
    "three_point_attempt",
    "3 points attemptd"
  )
)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's three_point_percent",
    "three_point_percent",
    "3 points hit rate"
  )
)
clean_dic <- rbind(clean_dic,
                   c(
                     "player's two_point_total",
                     "two_point_total",
                     "2 points scored"
                   ))
clean_dic <- rbind(clean_dic,
                   c(
                     "player's two_point_attempt",
                     "two_point_attempt",
                     "2 points attemptd"
                   ))
clean_dic <- rbind(clean_dic,
                   c(
                     "player's two_point_percent",
                     "two_point_percent",
                     "2 points hit rate"
                   ))
clean_dic <- rbind(
  clean_dic,
  c(
    "player's effective_goal_percent",
    "effective_goal_percent",
    "effective goal percent of that player"
  )
)
clean_dic <- rbind(
  clean_dic,
  c(
    "player's free_throw",
    "free_throw",
    "score points from a restricted area on the court"
  )
)
clean_dic <-
  rbind(
    clean_dic,
    c(
      "player's free_throw_attempts",
      "free_throw_attempts",
      "score points attempted from a restricted area on the court"
    )
    
  )
clean_dic <- rbind(
  clean_dic,
  c(
    "player's free_throw_percent",
    "free_throw_percent",
    "percent of score points attempted from a restricted area on the court"
  )
)
clean_dic <-
  rbind(
    clean_dic,
    c(
      "player's offensive_rebounds",
      "offensive_rebounds",
      "a statistic awarded to a player who retrieves the ball after a missed field goal or free throw"
    )
  )
clean_dic <- rbind(
  clean_dic,
  c
  (
  "player's defensive_rebounds",
  "defensive_rebounds",
  "a statistic awarded to a player who retrieves the ball after a defense round"
  )
)
clean_dic <-
  rbind(
    clean_dic,
    c(
      "player's total_rebounds",
      "total_rebounds",
      "the summation of offensive rebounds and defensive rebounds"
    )
  )
clean_dic <-
  rbind(
    clean_dic,
    c(
      "player's assists",
      "assists",
      "number of time player assists an successful offsense"
    )
  )
clean_dic <-
  rbind(
    clean_dic,
    c(
      "player's steals",
      "steals",
      "number of time player steals balls from opponents"
    )
  )

clean_dic <-
  rbind(clean_dic,
        c(
          "player's blocks",
          "blocks",
          "number of time player blocks opponents"
        ))
clean_dic <-
  rbind(clean_dic,
        c(
          "player's turnovers",
          "turnovers",
          "the ranking of player in his team"
        ))


clean_dic <-
  rbind(clean_dic,
        c("player's personal_fouls", "personal_fouls", "number of fouls"))
clean_dic <-
  rbind(clean_dic,
        c("player's points", "points", "total points obtained"))

#Store salary clean data frame back to disk as csv file.
file_name = "data/cleandata/cleandata_dictionary/clean_combine_dic.csv"
write.csv(clean_dic, file = file_name)