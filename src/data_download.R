
#! /usr/bin/env Rscript 
# Akshi Chaudhary, December 8, 2017
#
# This script downloads the data required for the University Ranking Project from a Public Github repo
# The data is originally downloaded from Kaggle and steps to do that are documented in the project README
# This script has two arguments 
# First: a URL pointing to the data
# Second: a path/filename where to write the dataset to 


args <- commandArgs(trailingOnly = TRUE)
url1 <- args[1]
filename <- args[2]

# read from url
main <- function(){
times <- read.csv(url(url1), header=TRUE, sep=",")
head(times)

write.csv(times, file = filename)
}
# call main function
main()


