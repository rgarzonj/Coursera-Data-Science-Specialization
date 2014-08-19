# Getting and Cleaning Data-

## Course Project

### Human Activity Recognition using Smartphones

The dataset has been obtained from the study "Human Activity Recognition using Smartphones". More detailed information about the study and the dataset may be obtained in the following link.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset may be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data Processing

We first downloaded the dataset and unzipped the different files. Then, we loaded the different files into R variables.

The first step identifies the names of the features so we can assign them to the columns. We use the grepl function to identify the columns providing information around mean or standard deviation. Once we have those columns identified, we add two columns for each train and test datasets: the type of activity and the subject id. 

Once we have the two datasets ready, we will bind them using rbind and set the names for all the columns. We use aggregate on this dataset to compute means and group by Activity and Subject. 

The last steps are assigning the labels to the activity types, setting more descriptive names to the different columns and finally saving the tidy dataset to a txt file.

# Variables in the tidyDataSet.txt file

The resulting tidy dataset is written to a file called "tidyDataSet.txt", which may be easily loaded again into R with the line:
```R
tidyDataSet <- read.table("tidyDataSet.txt",header=TRUE)
```

The names of the columns can be found in the following list. The column names are self-describing and except Activity and Subject, the values correspond to the mean of the measures obtained per Activity and Subject. For detailed information on each of the measures, please review the article information (see link above in this same page).

"Activity"
"Subject"
"Time Signals for Accelerator-mean() X axis"
"Time Signals for Accelerator-mean() Y axis"
"Time Signals for Accelerator-mean() Z axis"
"Time Signals for Accelerator-std() X axis"
"Time Signals for Accelerator-std() Y axis"
"Time Signals for Accelerator-std() Z axis"
"Time Signals Gravity for Accelerator-mean() X axis"
"Time Signals Gravity for Accelerator-mean() Y axis"
"Time Signals Gravity for Accelerator-mean() Z axis"
"Time Signals Gravity for Accelerator-std() X axis"
"Time Signals Gravity for Accelerator-std() Y axis"
"Time Signals Gravity for Accelerator-std() Z axis"
"Time Signals for Accelerator Jerk-mean() X axis"
"Time Signals for Accelerator Jerk-mean() Y axis"
"Time Signals for Accelerator Jerk-mean() Z axis"
"Time Signals for Accelerator Jerk-std() X axis"
"Time Signals for Accelerator Jerk-std() Y axis"
"Time Signals for Accelerator Jerk-std() Z axis"
"Time Signals for Gyroscope-mean() X axis"
"Time Signals for Gyroscope-mean() Y axis"
"Time Signals for Gyroscope-mean() Z axis"
"Time Signals for Gyroscope-std() X axis"
"Time Signals for Gyroscope-std() Y axis"
"Time Signals for Gyroscope-std() Z axis"
"Time Signals for Gyroscope Jerk-mean() X axis"
"Time Signals for Gyroscope Jerk-mean() Y axis"
"Time Signals for Gyroscope Jerk-mean() Z axis"
"Time Signals for Gyroscope Jerk-std() X axis"
"Time Signals for Gyroscope Jerk-std() Y axis"
"Time Signals for Gyroscope Jerk-std() Z axis"
"Time Signals for Accelerator Magnitude-mean()"
"Time Signals for Accelerator Magnitude-std()"
"Time Signals Gravity for Accelerator Magnitude-mean()"
"Time Signals Gravity for Accelerator Magnitude-std()"
"Time Signals for Accelerator Jerk Magnitude-mean()"
"Time Signals for Accelerator Jerk Magnitude-std()"
"Time Signals for Gyroscope Magnitude-mean()"
"Time Signals for Gyroscope Magnitude-std()"
"Time Signals for Gyroscope Jerk Magnitude-mean()"
"Time Signals for Gyroscope Jerk Magnitude-std()"
"Freq Domain Signals for Accelerator-mean() X axis"
"Freq Domain Signals for Accelerator-mean() Y axis"
"Freq Domain Signals for Accelerator-mean() Z axis"
"Freq Domain Signals for Accelerator-std() X axis"
"Freq Domain Signals for Accelerator-std() Y axis"
"Freq Domain Signals for Accelerator-std() Z axis"
"Freq Domain Signals for Accelerator-meanFreq() X axis"
"Freq Domain Signals for Accelerator-meanFreq() Y axis"
"Freq Domain Signals for Accelerator-meanFreq() Z axis"
"Freq Domain Signals for Accelerator Jerk-mean() X axis"
"Freq Domain Signals for Accelerator Jerk-mean() Y axis"
"Freq Domain Signals for Accelerator Jerk-mean() Z axis"
"Freq Domain Signals for Accelerator Jerk-std() X axis"
"Freq Domain Signals for Accelerator Jerk-std() Y axis"
"Freq Domain Signals for Accelerator Jerk-std() Z axis"
"Freq Domain Signals for Accelerator Jerk-meanFreq() X axis"
"Freq Domain Signals for Accelerator Jerk-meanFreq() Y axis"
"Freq Domain Signals for Accelerator Jerk-meanFreq() Z axis"
"Freq Domain Signals for Gyroscope-mean() X axis"
"Freq Domain Signals for Gyroscope-mean() Y axis"
"Freq Domain Signals for Gyroscope-mean() Z axis"
"Freq Domain Signals for Gyroscope-std() X axis"
"Freq Domain Signals for Gyroscope-std() Y axis"
"Freq Domain Signals for Gyroscope-std() Z axis"
"Freq Domain Signals for Gyroscope-meanFreq() X axis"
"Freq Domain Signals for Gyroscope-meanFreq() Y axis"
"Freq Domain Signals for Gyroscope-meanFreq() Z axis"
"Freq Domain Signals for Accelerator Magnitude-mean()"
"Freq Domain Signals for Accelerator Magnitude-std()"
"Freq Domain Signals for Accelerator Magnitude-meanFreq()"
"Freq Domain Signals forBody Accelerator Jerk Magnitude-mean()"
"Freq Domain Signals forBody Accelerator Jerk Magnitude-std()"
"Freq Domain Signals forBody Accelerator Jerk Magnitude-meanFreq()"
"Freq Domain Signals forBody Gyroscope Magnitude-mean()"
"Freq Domain Signals forBody Gyroscope Magnitude-std()"
"Freq Domain Signals forBody Gyroscope Magnitude-meanFreq()"
"Freq Domain Signals forBody Gyroscope Jerk Magnitude-mean()"
"Freq Domain Signals forBody Gyroscope Jerk Magnitude-std()"
"Freq Domain Signals forBody Gyroscope Jerk Magnitude-meanFreq()"

