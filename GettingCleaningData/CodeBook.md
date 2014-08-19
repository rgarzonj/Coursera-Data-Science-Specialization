# Getting and Cleaning Data

## Course Project

### Human Activity Recognition using Smartphones

The dataset has been obtained from the study "Human Activity Recognition using Smartphones". More detailed information about the study and the dataset may be obtained in the following link.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset may be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data Processing

We first downloaded the dataset and unzipped the different files. Then, we loaded the different files into R variables.

The first step identifies the names of the features so we can assign them to the columns. We use the "grepl" function to identify the columns providing information around mean or standard deviation. Once we have those columns identified, we add two columns for each train and test datasets: the type of activity and the subject id. 

Once we have the two datasets ready, we will bind them using "rbind" and set the names for all the columns. We use "aggregate" on this dataset to compute means and group by Activity and Subject. 

The latest steps are assigning the labels to the activity types, setting more descriptive names to the different columns and finally saving the tidy dataset to a txt file.

# Variables in the tidyDataSet.txt file

The resulting tidy dataset is written to a file called "tidyDataSet.txt", which may be easily loaded again into R with the code:
```R
tidyDataSet <- read.table("tidyDataSet.txt",header=TRUE)
```

The names of the columns can be found in the following list. The column names are self-describing. The values (except Activity and Subject) correspond to the mean of the measures obtained per Activity and Subject. For detailed information on each of the measures, please review the article information (see link above in this same page).

[1] "Activity"                                                         
[2] "Subject"                                                          
[3] "Time Signals for Accelerator-mean() X axis"                       
[4] "Time Signals for Accelerator-mean() Y axis"                       
[5] "Time Signals for Accelerator-mean() Z axis"                       
[6] "Time Signals for Accelerator-std() X axis"                        
[7] "Time Signals for Accelerator-std() Y axis"                        
[8] "Time Signals for Accelerator-std() Z axis"                        
[9] "Time Signals Gravity for Accelerator-mean() X axis"               
[10] "Time Signals Gravity for Accelerator-mean() Y axis"               
[11] "Time Signals Gravity for Accelerator-mean() Z axis"               
[12] "Time Signals Gravity for Accelerator-std() X axis"                
[13] "Time Signals Gravity for Accelerator-std() Y axis"                
[14] "Time Signals Gravity for Accelerator-std() Z axis"                
[15] "Time Signals for Accelerator Jerk-mean() X axis"                  
[16] "Time Signals for Accelerator Jerk-mean() Y axis"                  
[17] "Time Signals for Accelerator Jerk-mean() Z axis"                  
[18] "Time Signals for Accelerator Jerk-std() X axis"                   
[19] "Time Signals for Accelerator Jerk-std() Y axis"                   
[20] "Time Signals for Accelerator Jerk-std() Z axis"                   
[21] "Time Signals for Gyroscope-mean() X axis"                         
[22] "Time Signals for Gyroscope-mean() Y axis"                         
[23] "Time Signals for Gyroscope-mean() Z axis"                         
[24] "Time Signals for Gyroscope-std() X axis"                          
[25] "Time Signals for Gyroscope-std() Y axis"                          
[26] "Time Signals for Gyroscope-std() Z axis"                          
[27] "Time Signals for Gyroscope Jerk-mean() X axis"                    
[28] "Time Signals for Gyroscope Jerk-mean() Y axis"                    
[29] "Time Signals for Gyroscope Jerk-mean() Z axis"                    
[30] "Time Signals for Gyroscope Jerk-std() X axis"                     
[31] "Time Signals for Gyroscope Jerk-std() Y axis"                     
[32] "Time Signals for Gyroscope Jerk-std() Z axis"                     
[33] "Time Signals for Accelerator Magnitude-mean()"                    
[34] "Time Signals for Accelerator Magnitude-std()"                     
[35] "Time Signals Gravity for Accelerator Magnitude-mean()"            
[36] "Time Signals Gravity for Accelerator Magnitude-std()"             
[37] "Time Signals for Accelerator Jerk Magnitude-mean()"               
[38] "Time Signals for Accelerator Jerk Magnitude-std()"                
[39] "Time Signals for Gyroscope Magnitude-mean()"                      
[40] "Time Signals for Gyroscope Magnitude-std()"                       
[41] "Time Signals for Gyroscope Jerk Magnitude-mean()"                 
[42] "Time Signals for Gyroscope Jerk Magnitude-std()"                  
[43] "Freq Domain Signals for Accelerator-mean() X axis"                
[44] "Freq Domain Signals for Accelerator-mean() Y axis"                
[45] "Freq Domain Signals for Accelerator-mean() Z axis"                
[46] "Freq Domain Signals for Accelerator-std() X axis"                 
[47] "Freq Domain Signals for Accelerator-std() Y axis"                 
[48] "Freq Domain Signals for Accelerator-std() Z axis"                 
[49] "Freq Domain Signals for Accelerator-meanFreq() X axis"            
[50] "Freq Domain Signals for Accelerator-meanFreq() Y axis"            
[51] "Freq Domain Signals for Accelerator-meanFreq() Z axis"            
[52] "Freq Domain Signals for Accelerator Jerk-mean() X axis"           
[53] "Freq Domain Signals for Accelerator Jerk-mean() Y axis"           
[54] "Freq Domain Signals for Accelerator Jerk-mean() Z axis"           
[55] "Freq Domain Signals for Accelerator Jerk-std() X axis"            
[56] "Freq Domain Signals for Accelerator Jerk-std() Y axis"            
[57] "Freq Domain Signals for Accelerator Jerk-std() Z axis"            
[58] "Freq Domain Signals for Accelerator Jerk-meanFreq() X axis"       
[59] "Freq Domain Signals for Accelerator Jerk-meanFreq() Y axis"       
[60] "Freq Domain Signals for Accelerator Jerk-meanFreq() Z axis"       
[61] "Freq Domain Signals for Gyroscope-mean() X axis"                  
[62] "Freq Domain Signals for Gyroscope-mean() Y axis"                  
[63] "Freq Domain Signals for Gyroscope-mean() Z axis"                  
[64] "Freq Domain Signals for Gyroscope-std() X axis"                   
[65] "Freq Domain Signals for Gyroscope-std() Y axis"                   
[66] "Freq Domain Signals for Gyroscope-std() Z axis"                   
[67] "Freq Domain Signals for Gyroscope-meanFreq() X axis"              
[68] "Freq Domain Signals for Gyroscope-meanFreq() Y axis"              
[69] "Freq Domain Signals for Gyroscope-meanFreq() Z axis"              
[70] "Freq Domain Signals for Accelerator Magnitude-mean()"             
[71] "Freq Domain Signals for Accelerator Magnitude-std()"              
[72] "Freq Domain Signals for Accelerator Magnitude-meanFreq()"         
[73] "Freq Domain Signals forBody Accelerator Jerk Magnitude-mean()"    
[74] "Freq Domain Signals forBody Accelerator Jerk Magnitude-std()"     
[75] "Freq Domain Signals forBody Accelerator Jerk Magnitude-meanFreq()"

[76] "Freq Domain Signals forBody Gyroscope Magnitude-mean()"           
[77] "Freq Domain Signals forBody Gyroscope Magnitude-std()"            
[78] "Freq Domain Signals forBody Gyroscope Magnitude-meanFreq()"       
[79] "Freq Domain Signals forBody Gyroscope Jerk Magnitude-mean()"      
[80] "Freq Domain Signals forBody Gyroscope Jerk Magnitude-std()"       
[81] "Freq Domain Signals forBody Gyroscope Jerk Magnitude-meanFreq()"  

