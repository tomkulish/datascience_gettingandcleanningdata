#########################################
# run_analysis.R 
# 4 Aug 2015
# NOTE: This has been created to work on a Windows machine (notice backslashes)
#########################################

# Goals:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

######################
# Step 0: Setup your environment
######################

# We want to set the working directory of your env to make this a bit easier as we go forward.
setwd("C:\\Users\\me_000\\Documents\\GitHub\\datascience_gettingandcleanningdata")

# We are going to store our data files in a data directory, lets make sure its created
if(!file.exists("data")) {
  dir.create("data")
}

######################
# Step 1: Get the data
######################
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- ".\\data\\UCIDataset.zip"

download.file(fileUrl, destfile = destFile)
list.files(".\\data")
# Unzip file
files <- unzip(destFile, list=TRUE)
unzip(destFile, exdir="data")

# The files we are looking to play with:
activityLabelsFile <- "data\\UCI HAR Dataset\\activity_labels.txt"
featuresFile <- "data\\UCI HAR Dataset\\features.txt"

trainXFile <- "data\\UCI HAR Dataset\\train\\X_train.txt"
trainYFile <- "data\\UCI HAR Dataset\\train\\y_train.txt"
testSubjectFile <- "data\\UCI HAR Dataset\\test\\subject_test.tx"
testXFile <- "data\\UCI HAR Dataset\\test\\X_test.txt"
testYFile <- "data\\UCI HAR Dataset\\test\\y_test.txt"
trainSubjectFile <- "data\\UCI HAR Dataset\\train\\subject_train.txt"

#####################
# Step 2: Merge the data sets to create one dataset
#####################
# Load the data sets
trainX <- read.table(trainXFile)
trainY <- read.table(trainYFile)

# Join the datasets and numbers
trainingData <- cbind(trainY, trainX)


