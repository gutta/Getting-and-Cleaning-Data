
# Getting and Cleaning Data

## Course Project

R script called run_analysis.R was created to accomplish the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## How to run run_analysis.R

1. Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2. Unzip into your working directory, you should now have a directory called UCI HAR Dataset in the working directory.
3. Download run_analysis.R into your working directory.  
4. At the prompt run  ```source("run_analysis.R")```, the output will be ```second_tidydata.txt``` in your working directory.
5. Reading and processing large files may take a while.

## How run_analysis.R works

1. First it reads all the files that are to be merged.
2. Uses ```cbind``` and ```rbind``` to merge the test and train data sets: ```Part1```.
3. Cleans the feature list with pattern searching and replacing```gsub```.
4. Pattern searches the cleaned feature list using ```grep```, subsets the data frame of Part1 to solve for ```Part2```.
5. Changes the activity codes to activing names: ```Part3```
6. Adds column names by using the list from Part 2: ```Part4```
7. Uses ```aggregate``` to compute means and arrange data as required;the output will be ```second_tidydata.txt```:    ```Part5```
