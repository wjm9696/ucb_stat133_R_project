# STAT133 Fall 2016 Final project



### Discription

   This is the final project of Stats 133 fall 2016. The main purpose of the project is to analyze the correlation between salaries and players skills of all NBA players from 2015-2016 season. The first part of the project is to scrape and clean rosters, salaries and all other statistical information from an online website [Basketball reference](http://www.basketball-reference.com/). Several analyses are done based the clean data table. These include calculating the statistics per team, the performance(which is defined as “eﬃciency" in basketball) of all players. Exploratory Data Analysis (EDA) is done on every column of the clean data. A shiny app "stat-salaries" is also provided for visualizing between all players statistics. Using the ratio of efficiency and salary, the most valuable and worst valuable players are picked.

### Authors information (alphabetically)


Juexiao Wang

Jieming Wei

Jiushuang Guo

Yijun Wu


### Installation instruction of R to run R script

- Download and install R
    - R for Mac: [https://cran.r-project.org/bin/macosx/](https://cran.r-project.org/bin/macosx/)
	  - R for windows: [https://cran.r-project.org/bin/windows/base/](https://cran.r-project.org/bin/windows/base/)
	
- Download and install R studio 
    - RStudio download: [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/)


### Directory-ﬁles structure

    project/

       README.md 
       
       code/ 
           functions/ 
           
               function_app.R

               function_clean.R

               function_correlation.R

               function_efficiency.R

               function_scrap.R
           
           scripts/
           
               download_data_script.R 
               
               clean_data_script.R 
               
               eda_script.R 
               
               compute_efficiency_script.R
               
               generate_dictionary_clean.R
               
               generate_dictionary_raw.R
               
               correlation_script.R
               
               salary_statistics_script.R
               
       data/
       
           rawdata/
           
               roster-data/

                   ... (30 teams' roster data)
                   
               salary-data/

                   ... (30 teams' salary data)
                   
               stat-data/
               
                   ... (30 teams' stat data)
                   
               rawdata_dictionary/
               
                   roster_raw_dic.csv
                  
                   salary_raw_dic.csv
                  
                   stat_raw_dic.csv
                   
           cleandata/
           
               roster-salary-stats.csv       
               
               eff-stats-salary.csv 
               
               eda-output.txt
               
               team-salaries.csv
               
               best-worst-value-players.txt
               
               cleandata_dictionary/
               
                    clean_combine_dic.csv
                    
                    salary_clean_dic.csv
              
       images/
       
           ... (graphs of all related variables)
           
       apps/
       
           team-salaries/
           
               ui.R
               
               server.R

           stat-salaries/
                
               ui.R
               
               server.R
               

       report/
       
           report.Rmd 
           
           report.pdf
           
       slides/
       
           slides.Rmd
           
           slides.html
           
           
### Other requirement
- Set working directory to directory where the README.md is located before running any R code.
- Make sure you have internet connection when running download-data-script.R.



### License
The MIT License (MIT)
Copyright (c) <2016> <STAT133 FALL 2016 UC Berkeley>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.