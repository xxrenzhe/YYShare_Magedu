#!/bin/bash
# Function : create repo_test
# Author : Jacob.Yu
# CTime : 2015.10.15

## Git global setup
git config --global user.name "Administrator"
git config --global user.email "admin@example.com"

## Create a new repository
git clone git@123.59.68.177:root/repo_test.git
cd repo_test
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master

## Existing folder or Git repository
#cd existing_folder
#git init
#git remote add origin git@123.59.68.177:root/repo_test.git
#git add .
#git commit
#git push -u origin master
