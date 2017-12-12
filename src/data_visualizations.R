
#! /usr/bin/env Rscript 
# Akshi Chaudhary, December 9, 2017
#
# This script uses the summarised data of country-wise university score and education expenditure for plots
# Visulaize 
# This script has two arguments 
# First: the input file
# Second: a path/filename to write the summarized dataset 

# Import libraries and packages


args <- commandArgs(trailingOnly = TRUE)
input_file1 <- args[1]
input_file2 <- args[2]
figure1 <- args[3]
figure2 <- args[4]

# read from raw data file
main <- function(){
  
  library(dplyr)
  library(ggplot2)
 
## reading summarized data 
  country_score <- read.csv(input_file1)
  school_exp <- read.csv(input_file2)

## plot1 of public expenditure
  plot1 <- school_exp %>% ggplot(aes(direct_expenditure_type,log(total_exp * 10^6))) + geom_boxplot(aes(color = institute_type)) 
  + labs(title = 'Expenditure by countries based on Institute type', y = 'expenditure in billion dollars', x = "Expenditure in millions dollars") 
  + theme(axis.text=element_text(size=8),axis.title=element_text(size=10,face="bold" )) 
  + theme_bw() 
  + theme(legend.position = "bottom") 
  + scale_color_discrete("Institute Type:")
  
  
  # saving figure to png    
    png(figure1)
    print(plot1)
    dev.off()

    
        
## plot2 of Institute ranking
    
  plot2 <- country_score %>% top_n(20) %>% arrange(desc(best_score)) %>% ggplot(aes(x = best_score, y = country)) + geom_point(color ='blue') 
  + labs(title = 'Country education score based on institition rankings', x = 'Education Score', y ='Country')
  + theme(axis.text=element_text(size=8,axis.title=element_text(size=14,face="bold"))) + theme_bw()
  
  # 2. Save the plot to a file
  png(figure2)
  print(plot2)
  dev.off()

}
# call main function
main()


