#-----------------------------
#download-data-script.R
#This scripts scrping all data needed from http://www.basketball-reference.com/ and store
#roster, salary and stats data into the data folder.
#Imported functions: scrap_data
#-----------------------------

#install XML if not installed.
if ("XML" %in% rownames(installed.packages()) == FALSE) {
  install.packages("XML")
}

#import library
library(XML, warn.conflicts = FALSE)

#source needed function
source("code/functions/function_scrap.R")

#create folders roster-data/, stat-data/, and salary-data/
dir.create("data", showWarnings = FALSE)
dir.create("data/rawdata", showWarnings = FALSE)
folders_name = c(
  "data/rawdata/roster-data/",
  "data/rawdata/stat-data/",
  "data/rawdata/salary-data/"
)
for (i in 1:length(folders_name)) {
  dir.create(folders_name[i], showWarnings = FALSE)
}

# base url
basketref <- 'http://www.basketball-reference.com'

# parse 'http://www.basketball-reference.com/leagues/NBA_2016.html'
url <- paste0(basketref, '/leagues/NBA_2016.html')
doc <- htmlParse(url)

# identify nodes with anchor tags for each team and
# extract the href attribute from the anchor tags
team_rows <- getNodeSet(doc, "//th[@scope='row']/a")
team_hrefs <- xmlSApply(team_rows, xmlAttrs)

# the character vector with the team abbreviations
team_names <- substr(team_hrefs, 8, 10)

#loop through team name and export csv files.
scrap_data(team_names, team_hrefs)
