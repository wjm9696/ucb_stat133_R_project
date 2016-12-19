#Utility function for clean-data-script.R

#Install all required package if not installed
#Input: none
#Output: none but packages are installed in global frame
install_package_clean <- function(){
	install.packages("dplyr")
	if("XML" %in% rownames(installed.packages()) == FALSE){
		install.packages("XML")
	}
	if("stringr" %in% rownames(installed.packages()) == FALSE){
		install.packages("stringr")
	}
}

#Scrap all NBA player data from website
#Input: file_folder: a vector of folder path that storing the required data
#		team_names: a vector of NBA team names in string
#Output: a list of binded data frame
read_raw_table <- function(file_folder, team_names){
	result  = list()

	#Begin read table
	for(i in 1:3){

		filepath = paste0(file_folder[i],team_names[1],".csv")
		table = read.csv(file=filepath, header=TRUE, sep=",", stringsAsFactors=FALSE)
		table = mutate(table,team = team_names[1])
		for(l in 2:30){
			filepath = paste0(file_folder[i],team_names[l],".csv")
			current_table = read.csv(file=filepath, header=TRUE, sep=",",, stringsAsFactors=FALSE)
			current_table = mutate(current_table, team = team_names[l])
			table = rbind(table, current_table)
		}
		result[[i]] = table
	}
	return(result)
}

#modify the joined table's column name
#input: joined_table: table joined by roster, salary and stat table
#		old_column_name: column name in raw data table
#		new_column_name: column name after change
#output: joined table whose column name has been modified
modify_column <- function(joined_table, old_column_name, new_column_name){
		names(joined_table)[names(joined_table) == old_column_name] <- new_column_name
		return(joined_table)
}

