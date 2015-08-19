#########################################
# run_analysis.R 
# 4 Aug 2015
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
