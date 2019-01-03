# Getting and Cleaning Data - Course Project
## Tidy Data Code Book



#### This code book describes the variables, data, and transformations performed to clean up the raw dataset and create a new tidy table.

 
## Data Set Information

The data for this project: Human Activity Recognition Using Smartphones Dataset, by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto (Smartlab - Non Linear Complex Systems Laboratory, DITEN - Università degli Studi di Genova, Genoa, Italy).

Linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone (link below):
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws
Reference: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Study Design
               
system          x86_64, mingw32  
version.string  R version 3.5.1 (2018-07-02)

### Method

- Downloaded FUCI_HAR data from internet to local machine 
- Created R script run_analysis.R to perform the following tasks 
	* Merges the training and the test sets to create one data set.
	* Extracts only the measurements on the mean and standard deviation for each measurement.
	* Uses descriptive activity names to name the activities in the data set
	* Appropriately labels the data set with descriptive variable names.
	* From the data set in step 4, creates a second, independent tidy data set with the average of each 
- Created tidy data table newTidyDataUCIHAR.txt:
	* resulting from R script run_analysis.R performed on HAR_USD data
	* variables are descriptive, unique, no underscore or dots or white spaces
	* variables with characters made into factors and descriptive
	* a variable on each column (tall table)
	* added column for type of type of experiment (train or test)

## Code Book

The tidy data set variables are described below:

    * source: train or test 
    * volunteerId: an identifier of the subject who carried out the experiment (Subject). Its range is from 1 to 30.
    * Aativity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
    * averageMeasure: average of mean or standard deviation of the measurementby Volunteer Id, Activity and Feature
    * Features:

Features | Description |
| ------ | ------------------------------------------------------ |
|timeBodyAccelerationMeanX  |Mean of X for Time Body Acceleration|
|timeBodyGyroscopeMeanY  |Mean of Y for Time Body Gyroscope|
|timeBodyGyroscopeJerkMeanX |Mean of X for Time Body Gyroscope Jerk |
|timeBodyGyroscopeJerkMeanZ                               | Mean of X for Time Body Gyroscope Jerk|
|timeBodyAccelerationMagnitudeMean                         |Mean for Time Body Acceleration Magnitude|
|timeBodyAccelerationJerkMagnitudeMean                     |Mean for Time Body Acceleration Magnitude|
|timeBodyGyroscopeJerkMagnitudeMean                        |Mean for Time Body Gyroscope Jerk Magnitude|
|frequencyBodyAccelerationMeanY                            |Mean for Time Body  AccelerationJerkMagnitud|
|frequencyBodyAccelerationMeanFrequencyX                   |Mean of X for frequency body acceleration |
|frequencyBodyAccelerationMeanFrequencyZ                   |Mean of Z for frequency body acceleration |
|frequencyBodyAccelerationJerkMeanX                        |Mean of X for frequency body acceleration |
|frequencyBodyAccelerationJerkMeanZ                        |Mean of Z for frequency body acceleration jerk |
|frequencyBodyAccelerationJerkMeanFrequencyY               |Mean of Y for frequency body acceleration jerk |
|timeGravityAccelerationMeanX                              |Mean of X for frequency body acceleration jerk |
|frequencyBodyGyroscopeMeanX                               |Mean of X for frequency body gyroscope |
|frequencyBodyGyroscopeMeanZ                               |Mean of Z for frequency body gyroscope |
|frequencyBodyGyroscopeMeanFrequencyX                      |Mean of X for frequency body gyroscope |
|frequencyBodyGyroscopeMeanFrequencyZ                      |Mean of Z for frequency body gyroscope |
|frequencyBodyAccelerationMagnitudeMeanFrequency           |Mean of X for frequency body accelerat magnitude frequency    |
|frequencyBodyAccelerationJerkMagnitudeMeanFrequency       |Mean of X for frequency body acceleration Jerk Magnitude|
|frequencyBodyGyroscopeMagnitudeMeanFrequency              |Mean of X for frequency body gyroscope magnitude       |
|frequencyBodyGyroscopeJerkMagnitudeMeanFrequency          |Mean of X for frequency body gyroscope |
|timeBodyAccelerationJerkMeanY                             |Mean of X for Time Body Acceleration JerkMean|
|timeBodyGyroscopeStandardDeviationX                       |Standard Deviation of X for Time Body Gyroscope |
|timeBodyGyroscopeStandardDeviationZ                       |Standard Deviation of Z for Time Body Gyroscope StandardDev|
|timeBodyGyroscopeJerkStandardDeviationY                   |Standard Deviation of Y for Time Body Gyroscope JerkStandar|
|timeBodyAccelerationMagnitudeStandardDeviation            |Standard Deviation for Time Body Acceleration Magnitud|
|timeBodyAccelerationJerkMagnitudeStandardDeviation        |Standard Deviation for Time Body Acceleration Jerk Magnitud|
|timeBodyGyroscopeJerkMagnitudeStandardDeviation           |Standard Deviation for Time Body Gyroscope Jerk Magnitud|
|frequencyBodyAccelerationStandardDeviationY               |Standard Deviation of Y for frequency Body AccelerationSta|
|frequencyBodyAccelerationJerkStandardDeviationX           |Standard Deviation of X for frequency Body AccelerationJer|
|frequencyBodyAccelerationJerkStandardDeviationZ           |Standard Deviation of X for frequency Body AccelerationJer|
|frequencyBodyGyroscopeStandardDeviationX                  |Standard Deviation of X for frequency Body Gyroscope|
|frequencyBodyGyroscopeStandardDeviationZ                  |Standard Deviation of X for frequency Body Gyroscope|
|timeGravityAccelerationStandardDeviationY                 |Standard Deviation of Y for time Gravity Acceleration|
|timeBodyAccelerationStandardDeviationY                    |Standard Deviation of Y for time Body Acceleration|
|frequencyBodyAccelerationJerkMagnitudeStandardDeviation   |Standard Deviation of X for frequency Body Accelerationr|
|frequencyBodyGyroscopeJerkMagnitudeStandardDeviation      |Standard Deviation of X for frequency Body Gyroscope|
|timeBodyAccelerationJerkStandardDeviationX                |Standard Deviation of X for time Body Acceleration|
|timeBodyAccelerationJerkStandardDeviationZ                |Standard Deviation of Z for time Body Acceleration| 
|timeBodyGyroscopeMeanX                               |Mean of X timeBody Gyroscope |
|timeBodyGyroscopeMeanZ                               |Mean of Y timeBody Gyroscope |
|timeBodyGyroscopeJerkMeanY                           |Mean of Y timeBody Gyroscope Jerk|
|timeBodyAccelerationMeanY                            |Mean of Y timeBody Acceleration |
|timeGravityAccelerationMagnitudeMean                 |Mean of   timeGravity Acceleration |
|timeBodyGyroscopeMagnitudeMean                       |Mean of X timeBody Gyroscope Magnitude|
|frequencyBodyAccelerationMeanX                       |Mean of X frequencyBody Acceleration|
|frequencyBodyAccelerationMeanZ                       |Mean of Z frequencyBody Acceleration|
|frequencyBodyAccelerationMeanFrequencyY              |Mean of Y frequencyBody Acceleration|
|timeBodyAccelerationMeanZ                            |Mean of Z timeBody Acceleration Magnitude|
|frequencyBodyAccelerationJerkMeanY                   |Mean of Y frequency Body Acceleration|
|frequencyBodyAccelerationJerkMeanFrequencyX          |Mean of X frequency Body Acceleration|
|frequencyBodyAccelerationJerkMeanFrequencyZ          |Mean of Z frequency Body Acceleration|
|timeGravityAccelerationMeanY                         |Mean of Y time Gravity Acceleration|
|frequencyBodyGyroscopeMeanY                          |Mean of Y frequencyBody Gyroscope Magnitude|
|timeGravityAccelerationMeanZ                         |Mean of Z time Gravity Acceleration|
|frequencyBodyGyroscopeMeanFrequencyY                 |Mean of Y frequency Body Gyroscope Magnitude|
|frequencyBodyAccelerationMagnitudeMean               |Mean for frequency Body Acceleration|
|frequencyBodyAccelerationJerkMagnitudeMean           |Mean for frequency Body Acceleration|
|frequencyBodyGyroscopeMagnitudeMean                  |Mean for frequency Body Gyroscope Magnitude |
|frequencyBodyGyroscopeJerkMagnitudeMean              |Mean for frequency Body Gyroscope Jerk  |
|timeBodyAccelerationJerkMeanX                        |Mean of X time Body Acceleration Jerk |
|timeBodyAccelerationJerkMeanZ                        |Mean of Z time Body Acceleration Jerk |
|timeBodyGyroscopeStandardDeviationY                  |Standard Deviation of Y timeBody Gyroscope|
|timeBodyGyroscopeJerkStandardDeviationX              |Standard Deviation of X timeBody Gyroscope Jerk|
|timeBodyGyroscopeJerkStandardDeviationZ              |Standard Deviation of Z timeBody Gyroscope Jerk|
|timeGravityAccelerationMagnitudeStandardDeviation    |Standard Deviation for time Gravity Acceleration Magnitude|
|timeBodyGyroscopeMagnitudeStandardDeviation          |Standard Deviation for time Body Gyroscope Magnitude|
|frequencyBodyAccelerationStandardDeviationX          |Standard Deviation of X frequency Body Acceleration|
|frequencyBodyAccelerationStandardDeviationZ          |Standard Deviation of Z frequency Body Acceleration|
|frequencyBodyAccelerationJerkStandardDeviationY      |Standard Deviation of Y frequency Body AccelerationJerk|
|timeBodyAccelerationStandardDeviationX               |Standard Deviation of X time Body Acceleration|
|frequencyBodyGyroscopeStandardDeviationY             |Standard Deviation of Y frequency Body Gyroscope|
|timeGravityAccelerationStandardDeviationX            |Standard Deviation of X time Gravity Acceleration|
|timeGravityAccelerationStandardDeviationZ            |Standard Deviation of Z time Gravity Acceleration|
|frequencyBodyAccelerationMagnitudeStandardDeviation  |Standard Deviation for frequency Body Acceleration Magnitude|
|frequencyBodyGyroscopeMagnitudeStandardDeviation     |Standard Deviation for frequency Body Gyroscope Magnitude|
|timeBodyAccelerationStandardDeviationZ               |Standard Deviation of Z time Body Acceleration|
|timeBodyAccelerationJerkStandardDeviationY           |Standard Deviation of Y time Body Acceleration Jerk|

