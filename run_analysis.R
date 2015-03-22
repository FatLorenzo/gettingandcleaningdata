###
# script: run_analysis.R
#
# solving course project for 'Getting and cleaning data' 
# see. README.md for further information
##
library(dplyr)

## read activity_labels and features from disk
activity_labels <- read.table("./gettingandcleaningdata/activity_labels.txt")
features <- read.table("./gettingandcleaningdata/features.txt")

## read test data from disk and adding training data to same dataset (also read from disk)
data <- read.table("./gettingandcleaningdata/test/X_test.txt")
data <- rbind(data, read.table("./gettingandcleaningdata/train/X_train.txt"))

## filter for needed features (only regard those with mean() or std() in name)
features$regarded <-   (features$V1 %in% grep(glob2rx("*std()*"), features$V2)) | (features$V1 %in% grep(glob2rx("*mean()*"), features$V2))
data <- data[,features$regarded == TRUE]
## set column names to feature names
colnames(data) <- features[features$regarded == TRUE,2]

## read test activities from disk and add traing activities (also read from disk)
activities <- read.table("./gettingandcleaningdata/test/Y_test.txt")
activities <- rbind(activities,read.table("./gettingandcleaningdata/train/Y_train.txt"))

## map activity names to activities an add it to data frame, column will be named with activity
data <- cbind(apply(activities,2,function(x) activity_labels[x,]$V2),data)
colnames(data)[1] = "activity"

## create a data set of test and training subjects (both read from disk)
subjects <- read.table("./gettingandcleaningdata/test/subject_test.txt")
subjects <- rbind(subjects,read.table("./gettingandcleaningdata/train/subject_train.txt"))

## add subject data to data frame
data <- cbind(subjects,data)
colnames(data)[1] = "subject"

## first data will be grouped by subject and activity, using dplyr library
result <- group_by(data,subject,activity)
## calculate average for remaining colums
result <- summarise_each(result,funs(mean))
## write result to disk
write.table(result,"./gettingandcleaningdata/result.txt",row.name=FALSE)
