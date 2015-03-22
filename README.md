# README

## Prerequisite
As a prerequisite to run the R script properly, there must be a directory **gettingandcleaningdata** inside the working directory. This directory contains the data provided in the zip file for the course project. The structure looks as follows:
- activity_labels.txt
- features_info.txt
- features.txt
- README.txt
- test (folder containing test data)
- train (folder containing training data)

## Script
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

also see comments within the script for further details
