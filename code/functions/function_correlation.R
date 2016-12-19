
#This file contains utility functions for correlation-scripts.R

# set function for relationship between different statistics
plot_corr = function (x_axis = EFF_table$total_points, y_axis = EFF_table$salary,
                      title_content = "Title", x_lab = "x", y_lab = "y") {
  approximation = lm(y_axis~x_axis, data = EFF_table)
  plot(y_axis~x_axis, data = EFF_table, xlab = x_lab, ylab = y_lab)
  abline(approximation$coefficients[1],approximation$coefficients[2],col="blue")}

#Install all required packages for correlation-script.R if not installed
#Input: none
#Output: none but packages are installed in global frame
install_package_correlation_eda <- function(){
	if("dplyr" %in% rownames(installed.packages()) == FALSE){
		install.packages("dplyr")
	}
	if("MASS" %in% rownames(installed.packages()) == FALSE){
		install.packages("MASS")
	}
	if("stringr" %in% rownames(installed.packages()) == FALSE){
		install.packages("stringr")
	}
	if("ggplot2" %in% rownames(installed.packages()) == FALSE){
		install.packages("ggplot2")
	}
	if("plyr" %in% rownames(installed.packages()) == FALSE){
		install.packages("plyr")
	}
	if("readr" %in% rownames(installed.packages()) == FALSE){
		install.packages("readr")
	}
	if("reshape2" %in% rownames(installed.packages()) == FALSE){
		install.packages("reshape2")
	}
}