#!/bin/bash

## Milestone1 : Download dataset and hypothesize an analytical question
## Author : Akshi Chaudhary

## install kaggle-client to download the dataset from kaggle dataset repo

## pip install kaggle-cli

echo "you will be required to input your kaggle username and password"

read -p "Enter kaggle username :" username

read -p "Enter kaggle password :" password

echo "Make sure current directory is the project repo: University_rankings "

cd data/raw

kg dataset -u $username -p $password -o mylesoneill -d world-university-rankings
