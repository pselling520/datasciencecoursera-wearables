# datasciencecoursera-wearables
Getting and Cleaning Data Course Project - wearable computing data

This repo analyzes data about wearables. This data is from Anguita, Ghio, Oneto, Parra, and Reyes-Ortiz (full citation at the bottom). 

The full dataset can be accessed here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the dataset can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis file does the following:
* Downloads the zip file and unzips the zip file to a local directory
* Imports all training and test data, along with the activity labels and variable labels
* Merges all data together, assigns variable names to the columns, and updates the outcomes to show the activity descriptor rather than the numeric value. This only contains the means and standard deviations for each variable
* Extracts a subset of the data containing the average of each variable for each activity for each subject

The code book contains information about the columns, variables and units contained in the dataset.


Data source:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
