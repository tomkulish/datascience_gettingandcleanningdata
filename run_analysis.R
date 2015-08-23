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
# This is commented out for execution on your local working directory.
# setwd("C:\\Users\\me_000\\Documents\\GitHub\\datascience_gettingandcleanningdata")

print("Staring run_analysis.R")
# We are going to store our data files in a data directory, lets make sure its created
if(!file.exists("data")) {
  dir.create("data")
}

# Install the reshape2 and load it.
install.packages("reshape2")
library(reshape2)


install.packages("dplyr")
library(dplyr)

######################
# Step 1: Get the data
######################
print("Downloading Data.")
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
testSubjectFile <- "data\\UCI HAR Dataset\\test\\subject_test.txt"
testXFile <- "data\\UCI HAR Dataset\\test\\X_test.txt"
testYFile <- "data\\UCI HAR Dataset\\test\\y_test.txt"
trainSubjectFile <- "data\\UCI HAR Dataset\\train\\subject_train.txt"

cleanFile <- "data\\cleanedData.txt"

#####################
# Step 2: Merge the data sets to create one dataset
#####################
# Load the data sets
print("Merging the train and test datasets.")
trainX <- read.table(trainXFile)
trainY <- read.table(trainYFile)
subjectTrain <- read.table(trainSubjectFile)

testX <- read.table(testXFile)
testY <- read.table(testYFile)
subjectTest <- read.table(testSubjectFile)

# Load features
featuresData <- read.table(featuresFile, colClasses = c("character"))
activityLabelsData <- read.table(activityLabelsFile, col.names =  c("activityId", "activity"))

# Join the datasets and numbers
trainingData <- cbind(subjectTrain, trainY, trainX)
testData <- cbind(subjectTest, testY, testX)
joinedData <- rbind(trainingData, testData)

joinedDataLabels <- rbind(c(1, "subject"), rbind(c(2,"activityId"), featuresData))[,2]
names(joinedData) <- joinedDataLabels
# We should now have a dataset that contains both the trained data and joined data

####################
# Step 3: We want to only get the columns that measure mean and std
####################
print("Gathering the mean and std columns.")
joinedDataOnlyMeanStdColumns <- joinedData[,grep("subject|activityId|mean|std", names(joinedData))]

####################
# Step 4: Lets getting better names from the activity dataset and do a left_join no the activityID
####################
print("Attaching the activity to the dataset.")
joinedDataOnlyMeanStdColumns <- left_join(joinedDataOnlyMeanStdColumns, activityLabelsData, by = "activityId")

# Need to remove the second column
head(joinedDataOnlyMeanStdColumns)
joinedDataOnlyMeanStdColumns$activityId <- NULL

# Move the activity to the begining
joinedDataOnlyMeanStdColumns <- select(joinedDataOnlyMeanStdColumns, activity, everything())

###################
# Step 5: Approp label the dataset with descriptive variables
###################
print("Creating better column names.")
# Remove all the stupid ()
names(joinedDataOnlyMeanStdColumns) <- gsub('\\(|\\)',"",names(joinedDataOnlyMeanStdColumns), perl = TRUE)
# make.names to make synataically correct names
names(joinedDataOnlyMeanStdColumns) <- make.names(names(joinedDataOnlyMeanStdColumns), unique = TRUE)

# Update Acc and Freq to fully qualified names
names(joinedDataOnlyMeanStdColumns) <- gsub('Acc',"Acceleration",names(joinedDataOnlyMeanStdColumns))
names(joinedDataOnlyMeanStdColumns) <- gsub('Freq\\.',"Frequency.",names(joinedDataOnlyMeanStdColumns))
names(joinedDataOnlyMeanStdColumns) <- gsub('Freq$',"Frequency",names(joinedDataOnlyMeanStdColumns))

###################
# Step 6: Run the dataset through a average of each activity and subject to create a 
#         indepenent tidy dataset.
####################
print("Creating the tidy dataset.")
# So we want to melt the data using the reshape2, which will give us a long view of each activity.
joinedDataOnlyMeanStdColumns.long <- melt(joinedDataOnlyMeanStdColumns, id = c("subject", "activity"))
# We can then take that long view and summarize it by mean on subject and activity. A GROUP BY so to speak.
joinedDataOnlyMeanStdColumns.wide <- dcast(joinedDataOnlyMeanStdColumns.long, subject + activity ~ variable, mean)

# Now lets save the data.
write.table(joinedDataOnlyMeanStdColumns.wide, cleanFile, row.names = FALSE)

print("Program completed.")