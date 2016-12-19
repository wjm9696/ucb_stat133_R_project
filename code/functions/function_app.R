#This is the utility function for all shiny app file

#Install all required package if not installed
#Input: none
#Output: none but packages are installed in global frame
install_package_app <- function(){
	if("dplyr" %in% rownames(installed.packages()) == FALSE){
		install.packages("dplyr")
	}
	if("shiny" %in% rownames(installed.packages()) == FALSE){
		install.packages("shiny")
	}
	if("ggplot2" %in% rownames(installed.packages()) == FALSE){
		install.packages("ggplot2")
	}
}