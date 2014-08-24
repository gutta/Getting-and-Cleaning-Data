# Getting and Cleaning Data : Course Project Code Book

## Information provided by the original source

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the ```README.txt``` file in the dowloaded folder for further details about this dataset.

####Attribute Information:

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

####Citation Request:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Please read on for other useful information  

* Please see ```features_info.txt``` file for a brief explantion about the feature selection
* Complete list of variables of each feature vector is available in ```features.txt```. This file is used by the program to label the columns.
* ```X_ ...``` are the data files for the features
* ```y_ ...``` are the data files for identifiers for the activities  
* ```subject_...``` identify the subjects 

###Calculations

The propgram run_analysis.R:
 
* Merges the test and train data sets to create an object "alldata" : ```Part1```.
* Subsets "alldata" to "firsttidydata" ```Part2```.
* Changes the activity codes to activing names in "firsttidydata" ```Part 3```
* Adds column names "firsttidydata": ```Part 4```
* Compute means and arrange data as required outputs to a file ```second_tidydata.txt```.  This file has 180 rows (6 activities X 30 subjects).  The activities and sujects are listed in the first 2 columns and averages for 86 variables in the next 86 columns. 
