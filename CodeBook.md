Variables:
X_train, X_test, y_train, y_test, features, activity, train_subjects, and test_subjects contain the data loaded in from the source data.

x_id_train and x_id_test contain the X data with the subject ids appended to the data set.

train and test contain the merged variables and outcomes for the training data and the test data.

all_data contains the merged training and test data

summarized_data contains the tidy data set


Feature Selection:

The features selected for this database come from the dataset referenced in the README.md file (citation at bottom).

This dataset includes the mean and standard deviation for each of the following features:<br/>
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ<br/>
tGravityAcc-XYZ<br/>
tBodyAccJerk-XYZ<br/>
tBodyGyro-XYZ<br/>
tBodyGyroJerk-XYZ<br/>
tBodyAccMag<br/>
tGravityAccMag<br/>
tBodyAccJerkMag<br/>
tBodyGyroMag<br/>
tBodyGyroJerkMag<br/>
fBodyAcc-XYZ<br/>
fBodyAccJerk-XYZ<br/>
fBodyGyro-XYZ<br/>
fBodyAccMag<br/>
fBodyAccJerkMag<br/>
fBodyGyroMag<br/>
fBodyGyroJerkMag<br/>
gravityMean<br/>
tBodyAccMean<br/>
tBodyAccJerkMean<br/>
tBodyGyroMean<br/>
tBodyGyroJerkMean<br/>

The tidy dataset contains the the average of each variable listed above for each activity for each subject.


Source:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
