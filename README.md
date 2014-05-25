GetCleanProject
===============

Course Project of module Getting and Cleaning Data

This file is meant to explain how the code in run_Analysis.R works. However, the main comments are also provided inside the code.

The data which the code works upon originates from here

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The zip folder contains mainly two data sets (one called 'test' and one called 'training'). The data itself (identically for both) consists of as set of records obtained by signal processing of measurements from accelerometers and gyroscopes inside samsung devices; these are referred to as X-values. Furthermore, each record can be allocated to one out of 30 test persons (subjects) and one out of 6 defined activities (walking, sitting, etc.); these are referred to as Y-values. More details are omitted here as they are provided with the original data set.

The specification of the code was the following:

You should create one R script called run_analysis.R that does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive activity names. 
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


However, there are several things to consider during the initial data reading, therefore the task 0 consists of the following

- The 561 features (id, name) are stored in one object to be used as column names for the X-values of train and test data set.
- The 6 acitivity labels (id, name) are stored in one object to be allocated to the Y-values of train and test data set
- The subjects, i.e. the test persons, belonging to each record are stored in two different objects (due to the different origin from the training and test set).
- The same approach is applied to the Y-values (corresponding to the activity lavel id, therefore used as column name) and to the X-values (the actual processed data). The column names for the X-values are exactly the names of the 561 features.


Task 1
The merging of the training and the test sets consists basically of binding them by row (rbind). This applies to the three objects which originate from the different data sets, i.e. subjects, Y-values, and X-values. The necessity of a following step depends on the understanding of the expression 'one data set': assuming that previously there were two data sets (training and test), consisting of several txt-files, then the task is accomplished by rbind.
However, assuming that 'one data set' means 'one data frame', one has to put together those three objects by columnthen we need to do one more cbind


Task 2
Starting with some thoughts on different possible interpretations: After reading the provided info files "features_info.txt" and "README.txt", and cross-checking with opionions in the discussion forum, I come to the conclusion that only 'calculated' mean and stddev are asked. Hence we are looking for "mean()" and "std()", and we exclude "meanFreq". For me remains unclear what the instructor understands by the term "measurement": because technically, there are only 6 measurements: 3-axis acceleration from the accelerometer and 3-axis angular velocity from the gyroscope. All other values are calculated and not measured. However, there is no data raw measurement data provided. It is at least filtered to remove noise, seperated into Body Acceleration and Gravity Acceleration, derived, or subject to Euclidean norm or Fast Fourier Transformation. Hence, I do not care about these 'depth' in signal processing and do consider everything as a 'measurement' (otherwise there'd be zero measurements).

Hence, in this step, the 561 features are searched for calculated means and standard deviations. With the above reasoning, there are 33 of each. It results in a list called "selection", containing the numbers of the selected columns, i.e. 33 means and 33 stddevs. This list is used for subsetting the original data set, hence reducing the data columns from 561 to 66.


Task 4
It appears more efficient to do this before task 3.
In accordance with lecture 04_01, "appropriate" shall mean: all lower cases, no underscores. Hence underscore are omitted and letters are set lower case in the object with the activity names


Task 3
So far the activities are coded by there ID in the before last column of the data.frame containing the subsetted data; the data.frame activitylabels contains the respective names, thus, both are merged (by default by id as column names have been chosen identically), and the id is dropped


Task 5
Based on the data set from task 4, the number of columns is kept, but the number of rows is reduced by taking average values per group. There are 6 activities and 30 subjects, hence 180 groups, i.e. 180 rows in the tidy data set. Firstly, the data.frame is split into these 180 groups. Secondly, the column mean within each group is calculated using lapply. However, some modifications to column and row names are necessary before finally obtaining the data.frame "averages", sorted by activity and then by subject. 

This data.frame is finally given to a graphical output file using the gridExtra package.
