#Assignment 4, Analysing the Data collected from the accelerometers from the Samsung Galaxy S smartphone. #

##Assignment has only one script run_analysis.R.## 
It assumes following.
1. Data Set is kept unzipped parallel to it.
2. Your R working directory is set to present directory. 

##Running run_analysis.R##
1. setwd("present directory")
2. source("run_analysis.R")

##Output##
1. tidydataset.txt : It has average of each variables for each subject for each Activity. 
2. Use read.table("tidydataset.txt",header=TRUE)
3. It has 180 rows and 68 columns. 
4. First two columns are subject and activity, rest all of them are sensor related data of (mean and std), for each subject and activity.

##Script Working##
See CodeBook.md 