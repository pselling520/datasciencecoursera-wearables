#Initial library load
library(RCurl)
library(dplyr)

#Loading in data
destfile <- ".\\UCI_Data.zip"
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- download.file(URL,method="curl")
unzip(destfile)

X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", header=FALSE)
X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", header=FALSE)
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", header=FALSE)
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", header=FALSE)
features <- read.table(".\\UCI HAR Dataset\\features.txt",sep = "")
activity <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")
train_subjects <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
test_subjects <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")


#Add feature names to dataset and add id column
features <- as.vector(features[,2])
colnames(X_train) <- features
colnames(X_test) <- features
colnames(train_subjects) <- c("id")
colnames(test_subjects) <- c("id")

#join IDs to datasets and pull in all values
x_id_train <- cbind(train_subjects, X_train)
x_id_test <- cbind(test_subjects, X_test)
train <- cbind(x_id_train, y_train)
test <- cbind(x_id_test, y_test)

#merge train and test together
all_data <- union(train, test)

#update activity id with descriptor

