# Getting-and-Cleaning-Data-Course-Project

The data is taken from UCI HAR Dataset. This dataset provide the following variables for each activity:

1. subject - ID of participant
2. activity - ID of activity type
Mean and standart deviation for the following features (other values are presented in initial dataset, but for this reasearch only these parameters were used)
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The following data transformations were conducted to form a tidy dataset:

1. Added a new feature activitylabel - factor variable for activities     with the following levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

2. Tidy dataset was build as a mean values of features grouped by         activitylabel and subject - for each subject and activity type    determined mean values over all activities of that type.