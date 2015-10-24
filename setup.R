## Script for the "Getting and Cleaning Data" course project

## 0. The script assumes that the data has been downloaded, unzipped and
#  is available in the directory in variable "mydir", below.
#  If not, uncomment the following 3 lines to dowload, unzip, and set mydir

#dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ;
#download.file(dataURL, dest="dataset.zip", method="curl", mode="wb") ;
#utils::unzip("dataset.zip", exdir = "./") ;
mydir <- "UCI HAR Dataset" ;


## 1. Merges the training and the test sets to create one data set.

# Training data is in the train/ subdir in three files containing:
# - the 7352x561 input data (X_train),
# - the 7352x1 subject ID (subject_train),
# - the 7352x1 target output (y_train)
# We need to put these into a single 7352x563 table.
subjectFile <- file.path(mydir, "train", "subject_train.txt") ;
inputFile   <- file.path(mydir, "train", "X_train.txt") ;
targetFile  <- file.path(mydir, "train", "y_train.txt") ;

subject.train <- read.table(file=subjectFile, header=FALSE, col.names=c("Subject")) ;
input.train   <- read.table(file=inputFile, header=FALSE) ;
target.train  <- read.table(file=targetFile, header=FALSE, col.names=c("Activity")) ;
data.train <- cbind(input.train, subject.train, target.train) ;

# Same with test data
subjectFile <- file.path(mydir, "test", "subject_test.txt") ;
inputFile   <- file.path(mydir, "test", "X_test.txt") ;
targetFile  <- file.path(mydir, "test", "y_test.txt") ;

subject.test <- read.table(file=subjectFile, header=FALSE, col.names=c("Subject")) ;
input.test   <- read.table(file=inputFile, header=FALSE) ;
target.test  <- read.table(file=targetFile, header=FALSE, col.names=c("Activity")) ;
data.test <- cbind(input.test, subject.test, target.test) ;

# Now put everything into same table by stacking train above test:
data.all <- rbind(data.train,data.test) ;

## Result of step 1 is a 10299x563 data frame with all data.

## 2. Extracts only the measurements on the mean and standard deviation
#     for each measurement. 

# "measurements [...] for each measurements"? Can you make this any more
# confusing? :) 
# Anyways: we get the variable names from the features.txt file at top level
featureFile <- file.path(mydir, "features.txt") ;
features <- read.table(featureFile, header=FALSE, row.names=1, col.names=c("Index", "Name"), stringsAsFactors=FALSE) ;

# We'll select the features that have "-mean()" or "-std()" in their names:
# presumably, we don't need the "meanFreq" or "angle()" features even though
# they involve means.
# There are 66 target features (8 3-axial, 9 single, times 2).
iKeep <- sort(c(grep("-mean()", features$Name, fixed=TRUE), grep("-std()", features$Name, fixed=TRUE))) ;

# We don't forget to keep the Subject and Activity columns.
data.extract <- data.all[,c(iKeep, 562, 563)]  ;

# We'll do step 4 here because it's a simple one-liner.
# We name the first 66 columns in the data frame with the appropriate feature names.
# That's as "descriptive" as the info we got on the features! :)
colnames(data.extract)[1:length(iKeep)] <- features$Name[iKeep] ;

## 3. Uses descriptive activity names to name the activities in the data set

# The activity names in the activity_labels.txt file are descriptive enough,
# we will use that to map IDs to "descriptive activity names".

activityFile <- file.path(mydir, "activity_labels.txt") ;
activities <- read.table(activityFile, header=FALSE, col.names=c("Index", "Name"), stringsAsFactors=FALSE) ;

# First we build a vector mapping activity index to labels, i.e. Map[6]="LAYING", etc. 
Map <- vector(mode="character") ;
Map[activities$Index] <- activities$Name ;

# Then we rename the "Activity" column using that map.
data.extract$Activity <- Map[data.extract$Activity] ;


## 4. Appropriately labels the data set with descriptive variable names.
# (Done between step 2 and step 3)

## 5. From the data set in step 4, creates a second, independent tidy data
#     set with the average of each variable for each activity and each subject.
