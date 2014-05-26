averages
========

The provided dataset is a modification and re-organisation of the following dataset.
It is called "averages" because it contains average values by group.

With the original dataset came the following description:
(The description of the "tidy" dataset follows after the double double-dashed line


==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

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
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

======================================================================================

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'



======================================================================================
======================================================================================

The final (tidy) dataset called "averages" contains only one file with 180 rows and 68 columns.

There are several differences compared to the original datasets.

1. Rraining and test data has been merged: there is no seperation any more.
2. The number of feature (i.e. columns) has been reduced: only the means and standard deviations have been retained, i.e. 66 out of the original 561. They form the columns 3 to 68 of the final data set
3. The number of records (i.e. lines) has been reduced by calcuating average values per group: one group is defined as a combination of 1 out of 6 activities and 1 out of 30 subjects. These leads to the 180 rows.

The variables in details:

col 1: activity: characters, 6 levels, "laying", "sitting", "standing", "walking", "walkingdownstairs", "walkingupstairs"
col 2: subject: numeric, 30 levels, 1:30
col 3: group average of tBodyAcc-mean()-X
col 4: group average of tBodyAcc-mean()-Y
col 5: group average of tBodyAcc-mean()-Z
col 6: group average of tBodyAcc-std()-X
col 7: group average of tBodyAcc-std()-Y
col 8: group average of tBodyAcc-std()-Z
col 9: group average of tGravityAcc-mean()-X
col10: group average of tGravityAcc-mean()-Y
col11: group average of tGravityAcc-mean()-Z
col12: group average of tGravityAcc-std()-X
col13: group average of tGravityAcc-std()-Y
col14: group average of tGravityAcc-std()-Z
col15: group average of tBodyAccJerk-mean()-X
col16: group average of tBodyAccJerk-mean()-Y
col17: group average of tBodyAccJerk-mean()-Z
col18: group average of tBodyAccJerk-std()-X
col19: group average of tBodyAccJerk-std()-Y
col20: group average of tBodyAccJerk-std()-Z
col21: group average of tBodyGyro-mean()-X
col22: group average of tBodyGyro-mean()-Y
col23: group average of tBodyGyro-mean()-Z
col24: group average of tBodyGyro-std()-X
col25: group average of tBodyGyro-std()-Y
col26: group average of tBodyGyro-std()-Z
col27: group average of tBodyGyroJerk-mean()-X
col28: group average of tBodyGyroJerk-mean()-Y
col29: group average of tBodyGyroJerk-mean()-Z
col30: group average of tBodyGyroJerk-std()-X
col31: group average of tBodyGyroJerk-std()-Y
col32: group average of tBodyGyroJerk-std()-Z
col33: group average of tBodyAccMag-mean()
col34: group average of tBodyAccMag-std()
col35: group average of tGravityAccMag-mean()
col36: group average of tGravityAccMag-std()
col37: group average of tBodyAccJerkMag-mean()
col38: group average of tBodyAccJerkMag-std()
col39: group average of tBodyGyroMag-mean()
col40: group average of tBodyGyroMag-std()
col41: group average of tBodyGyroJerkMag-mean()
col42: group average of tBodyGyroJerkMag-std()
col43: group average of fBodyAcc-mean()-X
col44: group average of fBodyAcc-mean()-Y
col45: group average of fBodyAcc-mean()-Z
col46: group average of fBodyAcc-std()-X
col47: group average of fBodyAcc-std()-Y
col48: group average of fBodyAcc-std()-Z
col49: group average of fBodyAccJerk-mean()-X
col50: group average of fBodyAccJerk-mean()-Y
col51: group average of fBodyAccJerk-mean()-Z
col52: group average of fBodyAccJerk-std()-X
col53: group average of fBodyAccJerk-std()-Y
col54: group average of fBodyAccJerk-std()-Z
col55: group average of fBodyGyro-mean()-X
col56: group average of fBodyGyro-mean()-Y
col57: group average of fBodyGyro-mean()-Z
col58: group average of fBodyGyro-std()-X
col59: group average of fBodyGyro-std()-Y
col60: group average of fBodyGyro-std()-Z
col61: group average of fBodyAccMag-mean()
col62: group average of fBodyAccMag-std()
col63: group average of fBodyBodyAccJerkMag-mean()
col64: group average of fBodyBodyAccJerkMag-std()
col65: group average of fBodyBodyGyroMag-mean()
col66: group average of fBodyBodyGyroMag-std()
col67: group average of fBodyBodyGyroJerkMag-mean()
col68: group average of fBodyBodyGyroJerkMag-std() 


