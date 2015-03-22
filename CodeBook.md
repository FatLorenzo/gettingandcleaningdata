# CodeBook

## Preface
This CodeBook contains the description of the data set produced for the course project of Cloudera's "Getting and Cleaning Data" course.

## Data
The data were taken as provided by the course project's zip file. In the text file features_info.txt you'll find the description of the different features. 

Those features (test and training) were read and merged into a data frame. The subjects and activities were also added as the first and second column to the data set. Before adding the activities the numeric data were mapped to the descriptions so that they now conatin meaningful names.

As there were only the features containing the measurements on the mean and standard deviation values requested all other values were omitted.

In the end the data structure looks as follows:

- "subject"
- "activity"                   
- "tBodyAcc-mean()-X"
- "tBodyAcc-mean()-Y"          
- "tBodyAcc-mean()-Z"
- "tBodyAcc-std()-X"           
- "tBodyAcc-std()-Y"
- "tBodyAcc-std()-Z"           
- "tGravityAcc-mean()-X"
- "tGravityAcc-mean()-Y"
- "tGravityAcc-mean()-Z"        
- "tGravityAcc-std()-X"
- "tGravityAcc-std()-Y"
- "tGravityAcc-std()-Z"        
- "tBodyAccJerk-mean()-X"
- "tBodyAccJerk-mean()-Y"
- "tBodyAccJerk-mean()-Z"
- "tBodyAccJerk-std()-X"       
- "tBodyAccJerk-std()-Y"
- "tBodyAccJerk-std()-Z"       
- "tBodyGyro-mean()-X"
- "tBodyGyro-mean()-Y"
- "tBodyGyro-mean()-Z"
- "tBodyGyro-std()-X"          
- "tBodyGyro-std()-Y" 
- "tBodyGyro-std()-Z"          
- "tBodyGyroJerk-mean()-X" 
- "tBodyGyroJerk-mean()-Y"     
- "tBodyGyroJerk-mean()-Z" 
- "tBodyGyroJerk-std()-X"      
- "tBodyGyroJerk-std()-Y" 
- "tBodyGyroJerk-std()-Z"      
- "tBodyAccMag-mean()"     
- "tBodyAccMag-std()"          
- "tGravityAccMag-mean()"
- "tGravityAccMag-std()"       
- "tBodyAccJerkMag-mean()" 
- "tBodyAccJerkMag-std()"      
- "tBodyGyroMag-mean()"    
- "tBodyGyroMag-std()"         
- "tBodyGyroJerkMag-mean()" 
- "tBodyGyroJerkMag-std()"     
- "fBodyAcc-mean()-X"       
- "fBodyAcc-mean()-Y"          
- "fBodyAcc-mean()-Z" 
- "fBodyAcc-std()-X"           
- "fBodyAcc-std()-Y"     
- "fBodyAcc-std()-Z"           
- "fBodyAccJerk-mean()-X"   
- "fBodyAccJerk-mean()-Y"      
- "fBodyAccJerk-mean()-Z" 
- "fBodyAccJerk-std()-X"       
- "fBodyAccJerk-std()-Y"   
- "fBodyAccJerk-std()-Z"       
- "fBodyGyro-mean()-X"    
- "fBodyGyro-mean()-Y"         
- "fBodyGyro-mean()-Z"   
- "fBodyGyro-std()-X"          
- "fBodyGyro-std()-Y"   
- "fBodyGyro-std()-Z"          
- "fBodyAccMag-mean()"    
- "fBodyAccMag-std()"          
- "fBodyBodyAccJerkMag-mean()" 
- "fBodyBodyAccJerkMag-std()"  
- "fBodyBodyGyroMag-mean()"  
- "fBodyBodyGyroMag-std()"     
- "fBodyBodyGyroJerkMag-mean()"
- "fBodyBodyGyroJerkMag-std()" 

subject: group of 30 volunteers within an age bracket of 19-48 year, numbered 1..30
activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
all others: as described in feature_info.txt

## Processing

The script run_analysis.R takes the following steps in analysing the data:

1. Reading **activity_labels** and **features** from file
2. Reading test and training data an merges both in a data frame
3. Filtering for required measurements by doing a simple string compare. Only those measurements containing **str()** or **mean()** in their names will be regared.
4. Naming the columns with the respective measurements names
5. Reading activities and mapping those activities to their respective labels
6. Adding the activieties to the data set and also give a meaningful column name to the column
7. Reading subjects and adding them to the data set with a meaningful column name
8. Grouping data set by subject and activity column
9. Calculating average values for remaining columns
10. Writing result to disk