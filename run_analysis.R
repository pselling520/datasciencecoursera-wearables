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
colnames(y_train) <- c("activity")
colnames(y_test) <- c("activity")

#Converting activities into activity descriptors
y_train <- mutate(y_train, activity = ifelse(y_train$activity==1, "WALKING",
                                               if_else(y_train$activity==2,"WALKING_UPSTAIRS",
                                                       if_else(y_train$activity==3, "WALKING_DOWNSTAIRS",
                                                               if_else(y_train$activity==4, "SITTING",
                                                                       if_else(y_train$activity==5,"STANDING","LAYING"))))))
y_test <- mutate(y_test, activity = ifelse(y_test$activity==1, "WALKING",
                                               if_else(y_test$activity==2,"WALKING_UPSTAIRS",
                                                       if_else(y_test$activity==3, "WALKING_DOWNSTAIRS",
                                                               if_else(y_test$activity==4, "SITTING",
                                                                       if_else(y_test$activity==5,"STANDING","LAYING"))))))



#join IDs to datasets and pull in all values
x_id_train <- cbind(train_subjects, X_train)
x_id_test <- cbind(test_subjects, X_test)
train <- cbind(x_id_train, y_train)
test <- cbind(x_id_test, y_test)

#merge train and test together
all_data <- union(train, test)

#Creates the second, independent tidy data set with the average of 
#each variable for each activity and each subject.
all_data$id <- as.factor(all_data$id)
all_data$activity <- as.factor(all_data$activity)

summarized_data <- aggregate(all_data[, 2:562],
                             by=list(id=all_data$id, activity = all_data$activity),
                             mean)

summarized_data <- summarized_data[order(summarized_data$id, summarized_data$activity),]
row.names(summarized_data) <- NULL

write.csv(summarized_data, file=".\\tidy_wearables_averages.csv")
