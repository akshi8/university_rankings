
#! /usr/bin/env Rscript 
# Akshi Chaudhary, December 9, 2017
#
# This script uses the raw university ranking data, performs data cleaning and summarises the data in final dataset
# Data cleaning is required for some variables like year etc.
# This script has two arguments 
# First: the input file
# Second: a path/filename to write the summarized dataset 

# Import libraries and packages



library(dplyr)
#library(forcats)

options(warn=-1)
# Input arguments

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]

input_file2 <- args[2]

rank <- args[3]
public <- args[4]

# read from raw data file
main <- function(){

  times <- read.csv(input_file)
  times$total_score <- as.numeric(times$total_score)
  expenditure <- read.csv(input_file2)

# create country level score using best global university score
  country_score <- times %>% filter(total_score != '') %>% group_by(country) %>% 
    summarise(best_score = max(total_score)) %>% select(country,best_score) %>% arrange(desc(best_score))
  
  country_score$country <- factor(country_score$country , levels = country_score$country [order(country_score$best_score)])
  
# cleaning up column names in expenditure 
  expenditure <- expenditure %>% select(-X)
  colnames(expenditure)[4] <- "y1995"
  colnames(expenditure)[5] <- "y2000"
  colnames(expenditure)[6] <- "y2005"
  colnames(expenditure)[7] <- "y2009"
  colnames(expenditure)[8] <- "y2010"
  colnames(expenditure)[9] <- "y2011"
  
# Replacing missing value with 0
  overall <- expenditure %>% mutate(y1995 = ifelse(is.na(y1995),0,y1995)
                                        ,y2000 = ifelse(is.na(y2000),0,y2000)
                                        ,y2005 = ifelse(is.na(y2005),0,y2005)
                                        ,y2009 = ifelse(is.na(y2009),0,y2009)
                                        ,y2010 = ifelse(is.na(y2010),0,y2010) 
                                        ,y2011 = ifelse(is.na(y2011),0,y2011))

# taking average expenditure over the years
  
  
  school_exp <- overall %>% mutate(avg_exp = (y1995+ y2000 +y2005+y2009+y2010+y2011)/6) %>% 
    group_by(country,institute_type, direct_expenditure_type) %>% summarise(total_exp = sum(avg_exp)) %>% filter(direct_expenditure_type != "Total")
  
  

# writing sumarised data into summary file  
  write.csv(country_score, rank)
  write.csv(school_exp, public)
}
# call main function
main()


