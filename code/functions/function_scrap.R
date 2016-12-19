#Utility function for data scraping

#scraping all raw data for 30 NBA teams and write out to disk
#Input teams_names: the character vector with the team abbreviations
#		team_hrefs: the corresponding website link for each team
#Output: none but would write raw data of each team to corresponding folders
scrap_data <- function(team_names,team_hrefs){
	for(i in 1:length(team_hrefs)){
		url_team <- paste0(basketref, team_hrefs[i])
		html_doc <- readLines(con = url_team)
		tableName <- c("roster","totals","salaries")
	
		#loop through 3 different tables.
		for(l in 1:3){
	
			# initial line position of roster html table
			keyWord <- paste0('id="',tableName[l],'"')
			begin_line <- grep(keyWord, html_doc)
	
			# find the line where the html ends
			line_counter <- begin_line
			while (!grepl("</table>", html_doc[line_counter])) {
			  line_counter <- line_counter + 1
			}
			
			# read roster table as data.frame and export it as csv
			table <- readHTMLTable(html_doc[begin_line:line_counter])
			file_path = paste0(folders_name[l],tableName[l],'-',team_names[i],'.csv')
			write.csv(table,file = file_path)
		}
	} 	

}