
# Getting and Cleaning Data - Course Project 

Windows 10 
platform        x86_64-w64-mingw32          
arch            x86_64                      
os              mingw32                     
system          x86_64, mingw32  
version.string  R version 3.5.1 (2018-07-02)


### Overview

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data for this project: Human Activity Recognition Using Smartphones Dataset, by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto (Smartlab - Non Linear Complex Systems Laboratory, DITEN - Università degli Studi di Genova, Genoa, Italy).

Linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone (link below):

[Link to FUC_HAR Dataset zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Contents of Repo

Along with this ReadMe file in this Repo you will find:

- R script called run_analysis.R that performs the following tasks:
	* Merges the training and the test sets to create one data set.
	* Extracts only the measurements on the mean and standard deviation for each measurement.
	* Uses descriptive activity names to name the activities in the data set
	* Appropriately labels the data set with descriptive variable names.
	* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- A tidy data set called newTidyDataUCIHAR.txt:
	* resulting from R script run_analysis.R performed on HAR_USD data
	* variables are descriptive, unique, no underscore or dots or white spaces
	* variables with characters made into factors and descriptive
	* a variable on each column (tall table)
	* added column for type of type of experiment (train or test)

- A code book named "CodeBook"
	* describes the variables, the data, and any transformations
	* updates the available codebooks

### Instructions to run script run_analysis.R
- Step 1 - download / merge the data
	* load libraries
    		library(tidyr)
    		library(dplyr) 
	* check for/ create folder "data"
	* set working directory to folder "data"
	* download file from internet 
    	  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	* unzip file
	* load activity labels and features files
	* load the training and test datasets
	* 'subject_train': Each row identifies the subject who performed the activity for each window sample (range 1 to 30)
	* 'test/X_test.txt': Test set
	* 'test/y_test.txt': Test labels
	* 'subject_test': Each row identifies the subject who performed the activity for each window sample (range 1 to 30)
	* add train activity and train subject as columns to train table and rename columns 
	* add test activity and test subject as columns to test table and rename columns 
	* add train2 to test2 together as rows
- Step 2: extract measures related to mean and standard deviation only
    * find features related to mean or std, using regular expressions
- Step 3: add activity name
- Step 4: label data with descriptive variable names
- Step 5: reshape data and get the average of each variable for each activity and each subject
- Step 6:  write table containing your final tidy data

### Information about data source 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Reference: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
