# CodeBook
This book contains descriptions of the variables, the data, and any transformations that have taken place.

## Reference Fields
* `activity` - The label of the activity performed. Sourced from the zip file: 'activity_labels.txt'. See Activity Labels below
* `subject` - The participant subject ID. This was the first label from the Y files in the zip file. Its range is from 1 to 30. 

## Extracted Fields
- Features are normalized and bounded within [-1,1].

* tBodyAcceleration.mean.X
* tBodyAcceleration.mean.Y
* tBodyAcceleration.mean.Z
* tBodyAcceleration.std.X
* tBodyAcceleration.std.Y
* tBodyAcceleration.std.Z
* tGravityAcceleration.mean.X
* tGravityAcceleration.mean.Y
* tGravityAcceleration.mean.Z
* tGravityAcceleration.std.X
* tGravityAcceleration.std.Y
* tGravityAcceleration.std.Z
* tBodyAccelerationJerk.mean.X
* tBodyAccelerationJerk.mean.Y
* tBodyAccelerationJerk.mean.Z
* tBodyAccelerationJerk.std.X
* tBodyAccelerationJerk.std.Y
* tBodyAccelerationJerk.std.Z
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccelerationMag.mean
* tBodyAccelerationMag.std 
* tGravityAccelerationMag.mean
* tGravityAccelerationMag.std
* tBodyAccelerationJerkMag.mean
* tBodyAccelerationJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* fBodyAcceleration.mean.X
* fBodyAcceleration.mean.Y
* fBodyAcceleration.mean.Z
* fBodyAcceleration.std.X
* fBodyAcceleration.std.Y
* fBodyAcceleration.std.Z
* fBodyAcceleration.meanFrequency.X
* fBodyAcceleration.meanFrequency.Y
* fBodyAcceleration.meanFrequency.Z
* fBodyAccelerationJerk.mean.X
* fBodyAccelerationJerk.mean.Y
* fBodyAccelerationJerk.mean.Z
* fBodyAccelerationJerk.std.X
* fBodyAccelerationJerk.std.Y
* fBodyAccelerationJerk.std.Z
* fBodyAccelerationJerk.meanFrequency.X
* fBodyAccelerationJerk.meanFrequency.Y
* fBodyAccelerationJerk.meanFrequency.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyGyro.meanFrequency.X
* fBodyGyro.meanFrequency.Y
* fBodyGyro.meanFrequency.Z
* fBodyAccelerationMag.mean
* fBodyAccelerationMag.std
* fBodyAccelerationMag.meanFrequency
* fBodyBodyAccelerationJerkMag.mean
* fBodyBodyAccelerationJerkMag.std
* fBodyBodyAccelerationJerkMag.meanFrequency
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.std
* fBodyBodyGyroMag.meanFrequency
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.std
* fBodyBodyGyroJerkMag.meanFrequency

## Activity Labels
* WALKING
* WALKING_UPSTAIRS 
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

## Tidy Data
This is a mean of all of the extracted fields grouped by activity and subject. 