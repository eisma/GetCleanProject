## 03 Getting and Cleaning Data - Week 3 Course Project

## You should create one R script called run_analysis.R that does the following. 

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## 0. read to order txt files from directory

# read features to be used as column names for the X-values of train and test data set
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("featureid", "feature"))

# read activity labels to be allocated to the Y-values of train and test data set
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activitylabelid", "activitylabel"))

# read subjects from both data sets 
# use same column name as it will be combined later
# use factor type because it classifies the 30 persons
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subject", colClasses = "factor")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subject", colClasses = "factor")

# read activity lables from both data sets
# use same column name as it will be combined later; the column contains the activitylabelid from the previously built data.frame
# use factor type because it classifies the 6 different activity labels
Ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names ="activitylabelid", colClasses ="factor")
Ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names ="activitylabelid", colClasses ="factor")

# read the set of 561 variables estimated from the inertial signals (X-values for both data sets
# use same column names as it will be combined later; the columns correspond to the 561 feature stored previously in the respective data.frame
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature)


## 1. Merge the training and the test sets to create one data set.

# basically rbind the three sets containing training and test data: X, Y, and subject

subjectall <- rbind(subjecttrain, subjecttest)
Yall <- rbind(Ytrain, Ytest)
Xall <- rbind(Xtrain, Xtest)

# the necessity of the following step depends on the understanding of the expression 'one data set'
# if we assume that previously we had two data sets (training and test), consisting of several txt-files, then we are done here.
# if we assume that 'one data set' means 'one data frame', then we need to do one more cbind
# therefore I chose to put Yall i.e. the activities at the end, as it will be modified in point 3.

all <- cbind(Xall, subjectall, Yall)


## 2. Extract only the measurements on the mean and standard deviation for each measurement. 

# after reading the provided info files "features_info.txt" and "README.txt", and cross-checking with opionions
# in the discussion forum, I come to the conclusion that only 'calculated' mean and stddev are asked.
# hence we are looking for "mean()" and "std()", and we exclude "meanFreq"
# For me remains unclear what the instructor understands by the term "measurement": because technically, there are only 
# 6 measurements: 3-axis acceleration from the accelerometer and 3-axis angular velocity from the gyroscope.
# All other values are _calculated_ and not _measured_. However, there is no data raw measurement data provided.
# It is at least filtered to remove noise, seperated into Body Acceleration and Gravity Acceleration, derived, 
# or subject to Euclidean norm or Fast Fourier Transformation. Hence, I do not care about these 'depth' in signal processing
# and do consider everything as a 'measurement' (otherwise there'd be zero measurements).

# extracting means and stddevs seperately (| operator does not work in grep using fixed = TRUE; the latter is needed to have only "mean()"
# and not "meanFreq"), then putting it into a list called "selection", containing the numbers of the selected columns, i.e. 33 means and 33 stddevs

means <- grep("mean()", features$feature, fixed = TRUE)
stds <- grep("std()", features$feature, fixed = TRUE)
selection <- sort(c(means,stds))

# subset the whole data set "Xall" with the selected column numbers, and cbind activity labels and subjects like before

Xallmeanstd <- Xall[,selection]
allmeanstd <- cbind(Xallmeanstd, subjectall, Yall)


## 4. Appropriately label the data set with descriptive activity names.

# I do start with task 4 as it seems to be more efficient to me.
# I apply the definition of "appropriate" according to lecture 04_01: all lower cases, not have underscores

activitylabels$activitylabel <- sub("_","",activitylabels$activitylabel)
activitylabels$activitylabel <- tolower(activitylabels$activitylabel)


## 3. Uses descriptive activity names to name the activities in the data set

# So far the activities are coded by there ID in the before last column; the data.frame activitylabels contains the respective names
# merge both (column names have been chosen identically), and drop the id

allmeanstdact <- merge(allmeanstd, activitylabels)
allmeanstdact$activitylabelid <- NULL


## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

# based on the data set from task 4, the number of columns is kept, but the number of rows is reduced by taking average values per group.
# There are 6 activities and 30 subjects, hence 180 groups, i.e. rows in the tidy data set.

# split the data.frame into 180 groups
s <- split(allmeanstdact, list(allmeanstdact$activitylabel, allmeanstdact$subject))

# calculate column Means for each group and bring it to the original shape --> as.data.frame and transpose

averages <- as.data.frame(t(sapply(s, function(allmeanstdact) colMeans(allmeanstdact[,1:66]))))

# restore activity labels as first column, subject in second column (as.numeric for sorting), and delete row names

averages <- cbind(row.names(averages), row.names(averages), averages[,1:66])
names(averages)[1:2] <- c("activity", "subject")
averages$activity <- sub("[.][0-9]+","",averages$activity)
averages$subject <- sub("[a-z]+[.]","",averages$subject)
averages$subject <- as.numeric(averages$subject)
averages <- averages[order(averages$activity, averages$subject),]
row.names(averages) <- NULL


## use the package gridExtra to generate a png-file

library(gridExtra)
png("averages.png", height = 4000, width = 9000)
grid.table(averages)
dev.off()

