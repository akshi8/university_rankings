#!/bin/bash

## Create a driver script to execute R scripts based on the input arguments

## Author : Akshi Chaudhary
## Date: December 2017
## usage: bash Makefile.sh



echo " Make sure your current directory is the Project directory root"

## Runs script for importing data
Rscript src/data_download.R "https://raw.githubusercontent.com/akshi8/University_rankings/v1.1/data/external/timesData.csv" data/raw/times.csv "https://raw.githubusercontent.com/akshi8/University_rankings/v1.1/data/external/education_expenditure_supplementary_data.csv" data/raw/expenditure.csv


## Runs script for  data cleaning and summary
Rscript src/data_summary.R data/raw/times.csv data/raw/expenditure.csv data/processed/rank.csv data/processed/school_exp.csv

########## Note: User of this Makefile might face issues with some python libraries if not installed
## I will be addressing this Issue in the next milestone

#Runs script for creating the figures of summarized data
Rscript src/data_visualizations.R data/processed/rank.csv data/processed/school_exp.csv results/expenditure.png results/country_edu_rank.png


#Run scripts for creating the report

Rscript -e 'ezknitr::ezknit("src/Initial_analysis_Report.Rmd", out_dir="reports")'


#Clean all newly created files

rm -f data/processed/*.csv
rm -f data/raw/*.csv
rm -f results/figures/*.png
rm -f reports/*.html
rm -f reports/*.md
