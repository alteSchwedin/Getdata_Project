---
title: "Codebook for Getting and Cleaning Data Course Project"
author: "alteSchwedin"
date: "19.06.2015"
output: html_document
---

## Project description
This is the codebook for the Getting and Cleaning Data Course Project. The aim of the project was the creation of a tidy data set from the preprocessed data
of the sensor signals of a Samsung smartphone. The data was obtained by recording the sensor (accelerometer and gyroscope) signals of a smartphone weared by 30 volunteers (subjects) each performing 6 different activities.

## Study design and data processing

### Collection of the raw data
The raw data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip as a zipfile. It contained all the measured data which was preprocessed by the collectors to form the raw data used in this study. Moreover, the zipfile includes a README and a description of the preprocessing and variables.

### Notes on the original (raw) data
The data consists of a training and a test set each of which is residing in a separate folder. Each folder contains subfolder with the measured data and three files holding the subjects (*subject_\*.txt*) and activity (*y_\*.txt*) identifiers and the preprocessed data (*X_\*.txt*). Everthing comes without headers which is non-critical for the first two files since each one contains a single column of information. For the labelling of the 561 columns in the preprocessed data file the parent folder of the zipfile holds features.txt.

## Creating the tidy data file

First of all, you have to download the zipfile and unzip it to your working directory. After this you use the *run_analysis.R* script to load the relevant data into R and to do the cleaning steps. These consist of creating the full test and training sets, combining them to a big data frame and labelling the columns. Then, the columns with mean() and std() values are selected to form the intermediate data set. After labelling the activities and grouping the data, a second data set is created holding the mean of each variable for each activity and each subject. This dataset has been written to *tidy_data.txt*.

More information on the technical details of the process done in *run_analysis.R* can be found in README.md. Both files reside in the same folder as this code book.

## Description of the variables in the tidy_data.txt file

The resulting data set contains 180 observations of 68 variables. The classes of the columns are character (1), integer (2) and numeric (3-68). The columns 3 to 68 need a further explanation. Their names are composed of different parts:

* "t" stands for a signal in time domain
* "f" stands for a signal in frequency domain, was obtained from time domain signals via FFT (Fast Fourier Transformation)
* "Body" stands for the acceleration signals coming from the movement of the body
* "Gravity" denotes the gravity acceleration
* "Acc" denotes signals from the accelerometer measuring linear acceleration
* "Gyro" denotes signal from the gyroscope measuring angular velocity
* "Jerk" stands for values that were derived in time
* "Mag" stands for magnitudes of values obtained by taking their Euclidean norm.
* "mean" is the mean of the signal
* "std" is the standard deviation of the signal
* "X axis"/"Y axis"/"Z axis" denote the 3-axial signals in X-, Y- and Z-direction

Each column in the original data set was normalised and bounded within [-1, 1].

All of the values in *tidy_data.txt* are means of the respective values for each activity and subject.

<table>
<tr><td>Activity</td><td>Activity done by the subjects<br>levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING</td></tr>
<tr><td>Subject</td><td>Number of the volunteer doing the experiment, [1:30]</td></tr>
<tr><td>Activity</td><td>Activity</td></tr>
<tr><td>Subject</td><td>Subject</td></tr>
<tr><td>tBodyAcc.mean...X</td><td>time - body - accelerometer - mean - X axis</td></tr>
<tr><td>tBodyAcc.mean...Y</td><td>time - body - accelerometer - mean - Y axis</td></tr>
<tr><td>tBodyAcc.mean...Z</td><td>time - body - accelerometer - mean - Z axis</td></tr>
<tr><td>tGravityAcc.mean...X</td><td>time - gravity - accelerometer - mean - X axis</td></tr>
<tr><td>tGravityAcc.mean...Y</td><td>time - gravity - accelerometer - mean - Y axis</td></tr>
<tr><td>tGravityAcc.mean...Z</td><td>time - gravity - accelerometer - mean - Z axis</td></tr>
<tr><td>tBodyAccJerk.mean...X</td><td>time - body - accelerometer - Jerk - mean - X axis</td></tr>
<tr><td>tBodyAccJerk.mean...Y</td><td>time - body - accelerometer - Jerk - mean - Y axis</td></tr>
<tr><td>tBodyAccJerk.mean...Z</td><td>time - body - accelerometer - Jerk - mean - Z axis</td></tr>
<tr><td>tBodyGyro.mean...X</td><td>time - body - gyroscope - mean - X axis</td></tr>
<tr><td>tBodyGyro.mean...Y</td><td>time - body - gyroscope - mean - Y axis</td></tr>
<tr><td>tBodyGyro.mean...Z</td><td>time - body - gyroscope - mean - Z axis</td></tr>
<tr><td>tBodyGyroJerk.mean...X</td><td>time - body - gyroscope - Jerk - mean - X axis</td></tr>
<tr><td>tBodyGyroJerk.mean...Y</td><td>time - body - gyroscope - Jerk - mean - Y axis</td></tr>
<tr><td>tBodyGyroJerk.mean...Z</td><td>time - body - gyroscope - Jerk - mean - Z axis</td></tr>
<tr><td>tBodyAccMag.mean..</td><td>time - body - accelerometer - magnitude - mean - </td></tr>
<tr><td>tGravityAccMag.mean..</td><td>time - gravity - accelerometer - magnitude - mean - </td></tr>
<tr><td>tBodyAccJerkMag.mean..</td><td>time - body - accelerometer - Jerk - magnitude - mean - </td></tr>
<tr><td>tBodyGyroMag.mean..</td><td>time - body - gyroscope - magnitude - mean - </td></tr>
<tr><td>tBodyGyroJerkMag.mean..</td><td>time - body - gyroscope - Jerk - magnitude - mean - </td></tr>
<tr><td>fBodyAcc.mean...X</td><td>frequency - body - accelerometer - mean - X axis</td></tr>
<tr><td>fBodyAcc.mean...Y</td><td>frequency - body - accelerometer - mean - Y axis</td></tr>
<tr><td>fBodyAcc.mean...Z</td><td>frequency - body - accelerometer - mean - Z axis</td></tr>
<tr><td>fBodyAccJerk.mean...X</td><td>frequency - body - accelerometer - Jerk - mean - X axis</td></tr>
<tr><td>fBodyAccJerk.mean...Y</td><td>frequency - body - accelerometer - Jerk - mean - Y axis</td></tr>
<tr><td>fBodyAccJerk.mean...Z</td><td>frequency - body - accelerometer - Jerk - mean - Z axis</td></tr>
<tr><td>fBodyGyro.mean...X</td><td>frequency - body - gyroscope - mean - X axis</td></tr>
<tr><td>fBodyGyro.mean...Y</td><td>frequency - body - gyroscope - mean - Y axis</td></tr>
<tr><td>fBodyGyro.mean...Z</td><td>frequency - body - gyroscope - mean - Z axis</td></tr>
<tr><td>fBodyAccMag.mean..</td><td>frequency - body - accelerometer - magnitude - mean - </td></tr>
<tr><td>fBodyBodyAccJerkMag.mean..</td><td>frequency - body - body - accelerometer - Jerk - magnitude - mean - </td></tr>
<tr><td>fBodyBodyGyroMag.mean..</td><td>frequency - body - body - gyroscope - magnitude - mean - </td></tr>
<tr><td>fBodyBodyGyroJerkMag.mean..</td><td>frequency - body - body - gyroscope - Jerk - magnitude - mean - </td></tr>
<tr><td>tBodyAcc.std...X</td><td>time - body - accelerometer - standard deviation - X axis</td></tr>
<tr><td>tBodyAcc.std...Y</td><td>time - body - accelerometer - standard deviation - Y axis</td></tr>
<tr><td>tBodyAcc.std...Z</td><td>time - body - accelerometer - standard deviation - Z axis</td></tr>
<tr><td>tGravityAcc.std...X</td><td>time - gravity - accelerometer - standard deviation - X axis</td></tr>
<tr><td>tGravityAcc.std...Y</td><td>time - gravity - accelerometer - standard deviation - Y axis</td></tr>
<tr><td>tGravityAcc.std...Z</td><td>time - gravity - accelerometer - standard deviation - Z axis</td></tr>
<tr><td>tBodyAccJerk.std...X</td><td>time - body - accelerometer - Jerk - standard deviation - X axis</td></tr>
<tr><td>tBodyAccJerk.std...Y</td><td>time - body - accelerometer - Jerk - standard deviation - Y axis</td></tr>
<tr><td>tBodyAccJerk.std...Z</td><td>time - body - accelerometer - Jerk - standard deviation - Z axis</td></tr>
<tr><td>tBodyGyro.std...X</td><td>time - body - gyroscope - standard deviation - X axis</td></tr>
<tr><td>tBodyGyro.std...Y</td><td>time - body - gyroscope - standard deviation - Y axis</td></tr>
<tr><td>tBodyGyro.std...Z</td><td>time - body - gyroscope - standard deviation - Z axis</td></tr>
<tr><td>tBodyGyroJerk.std...X</td><td>time - body - gyroscope - Jerk - standard deviation - X axis</td></tr>
<tr><td>tBodyGyroJerk.std...Y</td><td>time - body - gyroscope - Jerk - standard deviation - Y axis</td></tr>
<tr><td>tBodyGyroJerk.std...Z</td><td>time - body - gyroscope - Jerk - standard deviation - Z axis</td></tr>
<tr><td>tBodyAccMag.std..</td><td>time - body - accelerometer - magnitude - standard deviation - </td></tr>
<tr><td>tGravityAccMag.std..</td><td>time - gravity - accelerometer - magnitude - standard deviation - </td></tr>
<tr><td>tBodyAccJerkMag.std..</td><td>time - body - accelerometer - Jerk - magnitude - standard deviation - </td></tr>
<tr><td>tBodyGyroMag.std..</td><td>time - body - gyroscope - magnitude - standard deviation - </td></tr>
<tr><td>tBodyGyroJerkMag.std..</td><td>time - body - gyroscope - Jerk - magnitude - standard deviation - </td></tr>
<tr><td>fBodyAcc.std...X</td><td>frequency - body - accelerometer - standard deviation - X axis</td></tr>
<tr><td>fBodyAcc.std...Y</td><td>frequency - body - accelerometer - standard deviation - Y axis</td></tr>
<tr><td>fBodyAcc.std...Z</td><td>frequency - body - accelerometer - standard deviation - Z axis</td></tr>
<tr><td>fBodyAccJerk.std...X</td><td>frequency - body - accelerometer - Jerk - standard deviation - X axis</td></tr>
<tr><td>fBodyAccJerk.std...Y</td><td>frequency - body - accelerometer - Jerk - standard deviation - Y axis</td></tr>
<tr><td>fBodyAccJerk.std...Z</td><td>frequency - body - accelerometer - Jerk - standard deviation - Z axis</td></tr>
<tr><td>fBodyGyro.std...X</td><td>frequency - body - gyroscope - standard deviation - X axis</td></tr>
<tr><td>fBodyGyro.std...Y</td><td>frequency - body - gyroscope - standard deviation - Y axis</td></tr>
<tr><td>fBodyGyro.std...Z</td><td>frequency - body - gyroscope - standard deviation - Z axis</td></tr>
<tr><td>fBodyAccMag.std..</td><td>frequency - body - accelerometer - magnitude - standard deviation - </td></tr>
<tr><td>fBodyBodyAccJerkMag.std..</td><td>frequency - body - body - accelerometer - Jerk - magnitude - standard deviation - </td></tr>
<tr><td>fBodyBodyGyroMag.std..</td><td>frequency - body - body - gyroscope - magnitude - standard deviation - </td></tr>
<tr><td>fBodyBodyGyroJerkMag.std..</td><td>frequency - body - body - gyroscope - Jerk - magnitude - standard deviation - </td></tr>
</table>

