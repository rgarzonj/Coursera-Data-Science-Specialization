# First download and unzip the dataset
target_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
target_localfile = "dataset.zip"
if (!file.exists(target_localfile)) {
        # We wave also metadata, thanks to David Hood for his contribution on this useful piece of code.
        download.file(target_url, method="curl", target_localfile)
        library(tools)       # for md5 checksum
        sink("download_metadata.txt")
        print("Download date:")
        print(Sys.time() )
        print("Download URL:")
        print(target_url)
        print("Downloaded file Information")
        print(file.info(target_localfile))
        print("Downloaded file md5 Checksum")
        print(md5sum(target_localfile))
        sink()
}

library(data.table)
unzip("dataset.zip")

#Load all the relevant files into variables
train_rdata <- read.table("./UCI HAR Dataset/train/X_train.txt")
test_rdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("number","activity_name")
feature_names <- read.table("./UCI HAR Dataset/features.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#We assign the names of the columns obtained from the features.txt file.
names(train_rdata) <- feature_names$V2
names(test_rdata) <- feature_names$V2

#Extracts only the measurements on the mean and standard deviation for each measurement. 
relevant_cols <- grepl("mean",feature_names$V2) | grepl("std",feature_names$V2)

#Merges the training and the test sets to create one data set.

#We will first use cbind to add the columns with the activity id and the subject id to both datasets
tidy_train <- cbind(train_rdata[,relevant_cols],y_train,subject_train)
tidy_test <- cbind(test_rdata[,relevant_cols],y_test,subject_test)

#Then we bind both datasets
mergedDataset <- rbind(tidy_test,tidy_train)
#After the completed dataset, we complete the name of the 2 last columns, activity and subject
descriptive_names <- c(names(test_rdata[,relevant_cols]))
names(mergedDataset) <- c(descriptive_names,"Activity","Subject")

#We use aggregate to compute the means and structure by Activity and Subject
tidy <-  aggregate(. ~ Activity + Subject, data=mergedDataset,mean)

#Uses descriptive activity names to name the activities in the data set
tidy <-within(tidy, Activity <- factor(Activity, labels = activity_labels$activity_name))

#Appropriately labels the data set with descriptive variable names. 
descriptive_names <- sub("^fBody","Freq Domain Signals for",descriptive_names)
descriptive_names <- sub("^tBody","Time Signals for",descriptive_names)
descriptive_names <- sub("^tGravity","Time Signals Gravity for",descriptive_names)
descriptive_names <- sub("Acc"," Accelerator",descriptive_names)
descriptive_names <- sub("Gyro"," Gyroscope",descriptive_names)
descriptive_names <- sub("-X"," X axis",descriptive_names)
descriptive_names <- sub("-Y"," Y axis",descriptive_names)
descriptive_names <- sub("-Z"," Z axis",descriptive_names)
descriptive_names <- sub("Mag"," Magnitude",descriptive_names)
descriptive_names <- sub("Jerk"," Jerk",descriptive_names)
names(tidy) <- c("Activity","Subject",descriptive_names)
          
#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#We will remove the line number so it is easier to load the .txt later with read.table
write.table(tidy,"tidyDataSet.txt",row.names=FALSE)

