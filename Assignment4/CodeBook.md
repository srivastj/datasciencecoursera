## Reading and merging the sensor data collected ##
1. We read "UCI HAR Dataset/X_train.txt" and "UCI HAR Dataset/X_test.txt" and merge them and store it in XMerge.

## Reading and merging the Activity data collected ##
1. We read "UCI HAR Dataset/y_train.txt" and "UCI HAR Dataset/y_test.txt" and merge them and store it in YMerge.

## Reading and merging the Subject data collected ##
1. We read "UCI HAR Dataset/subject_train.txt" and "UCI HAR Dataset/subject_test.txt" and merge them and store it in SubjectMerge.

## Extracting Feature with only mean and Std ##
1. We read the list of features from features.txt into features, First columns is feature Id and second column is feature name.
2. We then include only those feature name that has std() or mean() in it and store it in RegCol.

## Transforming X to only include std() and mean() feature ##
1. Based on Regcol we only extract those feature that have mean and std in it and transform X only to include colums that have std() and mean().

## Tansforming YMerge ## 
1. Converting YMerge number data to Actual Activity Value using activity.txt file. 

## Making FinalMerge Data ##
1.Doing cbind of XMerge, YMerge and SubjectMerge.

## Creating tidydataset for mean of each variable for each activity for each subject ##
1. Doing GroupBy on subject and activity. 
2. And then taking mean of each observation using summarise_each
3. Writing the Data to tinydataset.txt

## Reading from tiddydataset.txt ##
1. Use read.table("tidydataset.txt", header = TRUE) to read tidydataset

## contents of tidydataset ##
1. "subject" 
2. "activity" 
3. "tBodyAcc-mean()-X" 
4. "tBodyAcc-mean()-Y" 
5. "tBodyAcc-mean()-Z" 
6. "tBodyAcc-std()-X" 
7. "tBodyAcc-std()-Y" 
8. "tBodyAcc-std()-Z" 
9. "tGravityAcc-mean()-X" 
10. "tGravityAcc-mean()-Y" 
11. "tGravityAcc-mean()-Z" 
......
.....
66. "fBodyBodyGyroMag-std()" 
67. "fBodyBodyGyroJerkMag-mean()" 
68. "fBodyBodyGyroJerkMag-std()"