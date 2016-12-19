#This file contains utility functions for compute-efficiency-script.R

#Install all required package for compute-efficiency-script.R if not installed
#Input: none
#Output: none but packages are installed in global frame
install_package_efficiency <- function(){
	if("dplyr" %in% rownames(installed.packages()) == FALSE){
		install.packages("dplyr")
	}

	if("ggplot2" %in% rownames(installed.packages()) == FALSE){
		install.packages("ggplot2")
	}
	if("FactoMineR" %in% rownames(installed.packages()) == FALSE){
		install.packages("FactoMineR")
	}

}