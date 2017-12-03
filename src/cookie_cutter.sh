#!/bin/bash

## Create a new data science project repo and push to a new github repo from the command line

## Author : Akshi Chaudhary

## taking inputs from the user to automate project directory names

read -p "Enter full User Name :" username

read -p "Enter Project name to be initialized: " project_name

read -p "Enter Date as Month-Day-Year : " updated_on

read -p "Enter your new repo name for this project (without_spaces) :" new_repo

mkdir ../$new_repo


cd ..

cd $new_repo

git init

## New README for user
touch README.md

## Updating README for user repo
echo "# $project_name

**Author** : $username

**Latest Update** : $updated_on

" > README.md

mkdir docs
cd docs
echo "test" > test.txt
cd ..

mkdir data
cd data
mkdir raw

cd raw
echo "test" > test.txt
cd ..

mkdir processed
cd processed
echo "test" > test.txt
cd ..

mkdir external
cd external
echo "test" > test.txt
cd ..


cd ..

mkdir models
cd models
echo "test" > test.txt
cd ..

mkdir notebooks
cd notebooks
echo "test" > test.txt
cd ..


mkdir citations
cd citations
echo "# References" > citations.md
cd ..


mkdir reports
cd reports
mkdir figures
cd figures
touch test.png
echo "test" > test.txt
cd ..
mkdir images
cd images
touch test.svg
echo "test" > test.txt
cd ..

cd ..

mkdir src
cd src
echo "test" > test.txt
cd ..

mkdir from_team
cd from_team
echo "test" > test.txt
cd ..


##creating new LICENSE file

echo "The MIT License (MIT)

Copyright (c) $updated_on $username

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE." > LICENSE.md


## pushing the local repo to github

git commit -m "first commit"
git remote add origin https://github.com/akshi8/university_rankings.git
git push -u origin master
