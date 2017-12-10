
#! /usr/bin/env Rscript 
# Akshi Chaudhary, December 9, 2017
#
# This script uses the summarised data of country-wise university score and education expenditure for plots
# Visulaize 
# This script has two arguments 
# First: the input file
# Second: a path/filename to write the summarized dataset 

# Import libraries and packages
options(warn=-1)
suppressMessages(library(tidyverse))
suppressMessages(library(dplyr))
suppressMessages(library(ggplot2))
suppressMessages(library(forcats))
suppressMessages(library(ggsave))

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
figure1 <- arg[2]
figure2 <- args[3]

# read from raw data file
main <- function(){
 
## reading summarized data 
  combined <- read.csv(input_file)

## plot1 of public expenditure
  plot1 <- combined %>% filter(direct_expenditure_type == 'Public') %>% 
    ggplot(aes(total_exp,fill = institute_type )) + 
    geom_density( aes(y = ..count..)) + labs(title = 'Expenditure by countries based on Public Institute type', x = 'expenditure in billion dollars') + 
    theme(axis.text=element_text(size=8),axis.title=element_text(size=10,face="bold" )) + theme_bw() 
  
  
    country_score <- combined %>% select(country,best_score, direct_expenditure_type) %>% filter(direct_expenditure_type == "Public") %>% group_by(direct_expenditure_type,country) %>% summarise(score = mean(as.numeric(best_score))) %>% filter(score !='')
  
    country_score$country <- factor(country_score$country , levels = country_score$country [order(country_score$score)])
## saving figure to png    
    png(figure1)
    print(plot1)
    dev.off()

    
        
## plot2 of Institute ranking
    
  plot2 <- country_score %>% top_n(20) %>% arrange(desc(score)) %>% ggplot(aes(x = score, y = country)) + geom_point(color ='blue') +
    labs(title = 'Country education score based on institition rankings', x = 'Education Score', y ='Country') + theme(axis.text=element_text(size=8),                                                                                                                                                                                                                                           axis.title=element_text(size=14,face="bold")) +theme_bw()
  
  # 2. Save the plot to a file
  png(figure1)
  print(plot1)
  dev.off()

}
# call main function
main()


