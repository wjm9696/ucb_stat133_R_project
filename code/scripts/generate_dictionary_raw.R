#-----------------------------
# generate_dictionary.R
# This scripts help to generate dictionary table for three different kind of
# raw data table and store them back to the "data/rawdata/rawdata_dictionary"
# folder.
#-----------------------------

#create directory if not exist.
dir.create("data/rawdata/rawdata_dictionary", showWarnings = FALSE)

#create salary dictionary data frame.
salary_dic <- data.frame(
  name = character(),
  plot_name = character(),
  description = character()
  ,
  stringsAsFactors = FALSE
)
col_name <- names(roster_dic)

#add rows to data frame
roster_dic <-
  rbind(
    roster_dic,
    c(
      "uniform number",
      "roster.No",
      "the number on the back of the uniform the player waers"
    ),
    stringsAsFactors = FALSE
  )
names(roster_dic) <- col_name
roster_dic <-
  rbind(roster_dic,
        c(
          "player name",
          "roster.Player",
          "the first and last name of the player"
        ))
roster_dic <-
  rbind(
    roster_dic,
    c(
      "position",
      "roster.Pos",
      "the position the player plays for in abbreviation form"
    )
  )
roster_dic <-
  rbind(roster_dic,
        c("height", "roster.Ht", "the height of player, in inch and feet unit"))
roster_dic <-
  rbind(roster_dic,
        c("weight", "roster.Wt", "the weight of the player in lbs unit"))
roster_dic <-
  rbind(roster_dic,
        c(
          "date of birth",
          "roster.Birth.Date",
          "the date of birth of the player"
        ))
roster_dic <-
  rbind(roster_dic,
        c(
          "country",
          "roster..",
          "the nationality of the plaer in abbreviation"
        ))
roster_dic <-
  rbind(roster_dic,
        c("year of experience", "roster.Exp", "the number of years in NBA"))
roster_dic <-
  rbind(roster_dic,
        c(
          "college",
          "roster.College",
          "the college the player graduates from"
        ))

# Store roster data frame back to disk as csv file.
file_name = "data/rawdata/rawdata_dictionary/roster_raw_dic.csv"
write.csv(roster_dic, file = file_name)

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
  rbind(
    salary_dic,
    c("salary rank", "salaries.Rk", "the ranking of salary in his team"),
    stringsAsFactors = FALSE
  )
names(salary_dic) <- col_name
salary_dic <-
  rbind(salary_dic,
        c(
          "player name",
          "salaries.Player",
          "the first and last name of the player"
        ))
salary_dic <-
  rbind(salary_dic,
        c("salary", "salaries.Salary", "the total salary for the whole "))

# Store salary data frame back to disk as csv file.
file_name = "data/rawdata/rawdata_dictionary/salary_raw_dic.csv"
write.csv(salary_dic, file = file_name)

#create stat dictionary data frame.
stat_dic <- data.frame(
  name = character(),
  plot_name = character(),
  description = character()
  ,
  stringsAsFactors = FALSE
)

#add rows to data frame
col_name <- names(stat_dic)
stat_dic <-
  rbind(stat_dic,
        c("rank", "totals.Rk", "the ranking of player in his team"),
        stringsAsFactors = FALSE)
names(stat_dic) <- col_name
stat_dic <-
  rbind(stat_dic,
        c(
          "palyer name",
          "totals.Player",
          "the first and last name of the player"
        ))
stat_dic <-
  rbind(stat_dic, c("age", "totals.Age", "age of the player"))
stat_dic <-
  rbind(stat_dic, c("games played", "totals.G", "number of games played"))
stat_dic <-
  rbind(
    stat_dic,
    c(
      "games started",
      "totals.GS",
      "number of time player on field when game starts"
    )
  )
stat_dic <-
  rbind(stat_dic,
        c("minutes played", "totals.MP", "total number of minutes played"))
stat_dic <-
  rbind(stat_dic,
        c(
          "field goal",
          "totals.FG",
          "scored on any shot or tap other than a free throw"
        ))
stat_dic <-
  rbind(
    stat_dic,
    c(
      "field goal attempts",
      "totals.FGA",
      "attempted scored on any shot or tap other than a free throw"
    )
  )
stat_dic <-
  rbind(
    stat_dic,
    c(
      "field goal percent",
      "totals.FG.",
      "score percent on any shot or tap other than a free throw"
    )
  )
stat_dic <-
  rbind(stat_dic, c("three point total", "totals.3P", "3 points scored"))
stat_dic <-
  rbind(stat_dic,
        c("three point attempt", "totals.3PA", "3 points attemptd"))
stat_dic <-
  rbind(stat_dic,
        c("three point percent", "totals.3P.", "3 points hit rate"))
stat_dic <-
  rbind(stat_dic, c("two point total", "totals.2P", "2 points scored"))
stat_dic <-
  rbind(stat_dic,
        c("two point attempt", "totals.2PA", "2 points attemptd"))
stat_dic <-
  rbind(stat_dic,
        c("two point percent", "totals.2P.", "2 points hit rate"))
stat_dic <-
  rbind(
    stat_dic,
    c(
      "effective goal percent",
      "totals.eFG",
      "effective goal percent of that player"
    )
  )
stat_dic <-
  rbind(stat_dic,
        c(
          "free throw",
          "totals.FT",
          "score points from a restricted area on the court"
        ))
stat_dic <-
  rbind(
    stat_dic,
    c(
      "free throw attempts",
      "totals.FTA",
      "score points attempted from a restricted area on the court"
    )
  )
stat_dic <-
  rbind(
    stat_dic,
    c(
      "free throw percent",
      "totals.FT.",
      "percent of score points attempted from a restricted area on the court"
    )
  )
stat_dic <-
  rbind(
    stat_dic,
    c(
      "offensive rebounds",
      "totals.ORB",
      "a statistic awarded to a player who retrieves the ball after a missed field goal or free throw"
    )
  )
stat_dic <-
  rbind(
    stat_dic,
    c(
      "defensive rebounds",
      "totals.DRB",
      "a statistic awarded to a player who retrieves the ball after a defense round"
    )
  )
stat_dic <-
  rbind(
    stat_dic,
    c(
      "total rebounds",
      "totals.TRB",
      "the summation of offensive rebounds and defensive rebounds"
    )
  )
stat_dic <-
  rbind(
    stat_dic,
    c(
      "assists",
      "totals.AST",
      "number of time player assists an successful offsense"
    )
  )
stat_dic <-
  rbind(stat_dic,
        c(
          "steals",
          "totals.STL",
          "number of time player steals balls from opponents"
        ))
stat_dic <-
  rbind(stat_dic,
        c("blocks", "totals.BLK", "number of time player blocks opponents"))
stat_dic <-
  rbind(stat_dic,
        c("turnovers", "totals.TOV", "the ranking of player in his team"))
stat_dic <-
  rbind(stat_dic, c("personal fouls", "totals.PF", "number of fouls"))
stat_dic <-
  rbind(stat_dic, c("points", "totals.PTS", "total points obtained"))

# Store stat data frame back to disk as csv file.
file_name = "data/rawdata/rawdata_dictionary/stat_raw_dic.csv"
write.csv(stat_dic, file = file_name)
