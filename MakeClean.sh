#!/bin/bash

## Create a driver script to execute R scripts based on the input arguments

## Author : Akshi Chaudhary
## Date: December 2017
## usage: bash MakeClean.sh



echo " Make sure your current directory is the Project directory root"

#Clean all newly created files

rm -f data/processed/*.csv
rm -f data/raw/*.csv
rm -f results/figures/*.png
rm -f reports/*.html
rm -f reports/*.md
