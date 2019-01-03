# Getting and Cleaning Data peer-Graded Assignment: script rn_analysis.R

# On Windows 10 / R version 3.5.1 (2018-07-02)

# R script run_analysis.R that does the following:
#   1- Merges the training and the test sets to create one data set.
#   2- Extracts only the measurements on the mean and standard deviation for each measurement.
#   3- Uses descriptive activity names to name the activities in the data set
#   4- Appropriately labels the data set with descriptive variable names.
#   5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#      for each activity and each subject.

# Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) 
# while carrying a waist-mounted smartphone with embedded inertial sensors
#   By Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
#   Smartlab - Non Linear Complex Systems Laboratory


##########################################
# Step 1 - download / merge the data
##########################################
#setwd("C:/Users/fgg5mxe/Documents/R_Projects/Coursera/gettingAndCleaningData/data/gettingAndCleaningData/data")
# load libraries
    library(tidyr)
    library(dplyr) 

# check for/ create folder "data"
    getwd()
    
        if(!file.exists("data")){
            dir.create("data")
            }

# set working directory to folder "data"
    setwd("./data")
    
# download file from internet 
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "./dataset.zip", method = "curl")
    dateDownloaded <- date()

# unzip file
    if (!file.exists("./UCI HAR Dataset")) {
    unzip("./dataset.zip")
    }
    list.files()

# load activity labels and features files

# 'activity_labels.txt': Links the class labels with their activity name
    activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
    # head(activityLabels); str(activityLabels)
    names(activityLabels) <- c("activityId", "activityName")

# 'features.txt': List of all features
    features <- read.table("UCI HAR Dataset/features.txt")  # List of all features
    # head(features); str(features)
    names(features) <- c("featureId", "featureName")
    features$featureName <- as.character(features$featureName)
    # tAcc-XYZ; tGyro-XY = accelerometer 3-axial; gyroscope 3-axial; t time domain
    # tBodyAcc-XYZ; tGravityAcc-XYZ = body acceleration, gravity acceleration signal
    # tBodyAccJerk-XYZ, tBodyGyroJerk-XYZ = acceleration, angular velocity derived in time
    # tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag = magnitude of signals (Euclidean norm)
    # fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag = Fast Fourier Transform (FFT) applied to signals
    # t, f = time, frequency

# load the training and test datasets

# 'train/X_train.txt': Training set
    train <- read.table("UCI HAR Dataset/train/X_train.txt")
    # head(train) ; str(train)
    
# 'train/y_train.txt': Training labels
    trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")
    # head(trainActivities); str(trainActivities)
    names(trainActivities) <- c("activityId")
    
# 'subject_train': Each row identifies the subject who performed the activity for each window sample (range 1 to 30)
    trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
    # head(trainSubjects); str(trainSubjects)
    names(trainSubjects) <- c("subjectId")
    # length(unique(trainSubjects$subjectId)) == 21
    # 21% of 30 volunteers

# 'test/X_test.txt': Test set
    test <- read.table("UCI HAR Dataset/test/X_test.txt")
    # head(test); str(test)
    
# 'test/y_test.txt': Test labels
    testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")
    # head(testActivities); str(testActivities)
    names(testActivities) <- c("activityId")
    
# 'subject_test': Each row identifies the subject who performed the activity for each window sample (range 1 to 30)
    testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
    # head(testSubjects); str(testSubjects)
    names(testSubjects)  <- c("subjectId")
    # length(unique(testSubjects$subjectId)) == 9 
    # 9% of 30 volunteers 
    
# add train activity and train subject as columns to train table and rename columns 
    train2 <- cbind(train, trainActivities, trainSubjects, c(rep("train", nrow(train))))
    names(train2) <- c(features$featureName, "activityId", "volunteerId", "source")
    # head(train2); str(train2)

# add test activity and test subject as columns to test table and rename columns 
    test2 <- cbind(test, testActivities, testSubjects, c(rep("test", nrow(test))))
    names(test2) <- c(features$featureName, "activityId", "volunteerId", "source")
    # head(test2); str(test2)

# add train2 to test2 together as rows
    comboData <- rbind(train2, test2)
    # head(comboData); str(comboData)

    
##########################################################################
# Step 2: extracting measures related to mean and standard deviation only
##########################################################################

    
# find features related to mean or std, using regular expressions
    filterFeaturesIndex <- grep(".*mean.*|.*std.*", names(comboData))
    comboData2 <- comboData[c(filterFeaturesIndex, 562:564)]


###############################
# Step 3: adding activity name
###############################

# adding activity name
    comboData2 <- left_join(comboData2, activityLabels)
    
####################################################
# Step 4: label data with descriptive variable names
####################################################
    
    # tidy data; variables all lower, descriptive, unique, no underscore or dots or white spaces

    regexA <- c("\\()|-",
        "std",
        "^(t)",
        "^(f)",
        "([Bb]ody)+",
        "[Gg]yro",
        "Acc",
        "[Mm]ag",
        "Freq",
        "mean"
        )
    subB <- c("",
              "StandardDeviation",
              "time",
              "frequency",
              "Body",
              "Gyroscope",
              "Acceleration",
              "Magnitude",
              "Frequency",
              "Mean"
              )
    if (length(regexA) == length((subB))) {
        for (i in 1:length(regexA)) {
            names(comboData2) <- gsub(names(comboData2), 
                                      pattern = regexA[i], 
                                      replacement = subB[i])
        }
    }
    

####################################################################################################
# Step 5: reshapping data and getting the average of each variable for each activity and each subject
####################################################################################################

    # tidy data: variables with characters should be made into factors and be descriptive
    
    # converting "wide" table onto "long"
    comboData3 <- gather(comboData2, feature, measure, 1:79)
    
    comboData4 <- comboData3[2:5] %>%
        lapply(factor) %>%
        bind_cols(comboData3[6]) %>%
        group_by(source, volunteerId, activityName, feature) %>%
        summarise(averageMeasure = (mean(measure)))          

   write.table(comboData4, './newTidyDataUCIHAR.txt',row.names=FALSE,sep='\t')
   # list.files()
   # tidyTable <- read.table( "./newTidyDataUCIHAR.txt")











