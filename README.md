## README on the Course Project for Coursera Getting and Cleaning Data

The aim of the project was the creation of a tidy data set from the preprocessed data of the sensor signals of a Samsung smartphone. The data was obtained by recording the sensor (accelerometer and gyroscope) signals of a smartphone weared by 30 volunteers (subjects) each performing 6 different activities.

After downloading and unzipping https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip everything is prepared to run *run_analysis.R* and thus produce *tidy_data.txt*. DO NOT copy around or rename any of the files in the folder "UCI HAR Dataset" as the R script relies on the structure of the folder.

More details are provided in codebook.md.


### Details of *run_analysis.R*

As is additionally documented in the code, first of all the data in the test and train folders are read and each merged into a data set (df_train and df_test) before combining both into a big data set (df).

Then the column names were extracted from *features.txt* and along with "Activity" and "Subject" assigned to the df. The make.names() command makes sure that the column names are valid in R. (which was not the case with the original names in *features.txt*)

Next step is the removal of the columns with duplicate column names from df. It was made sure that none of those columns was necessary to form the tidy data set.

After selecting the "Activtiy" and "Subject" columns along with those containing ".mean." and ".std." to form final_df, the numbers in the activity column were exchanged with the labels read from *activity.txt*.

At last, final_df was grouped by "Activity" and "Subject" and the mean of each group was calculated for each variable. The result was then written to *tidy_data.txt*.
