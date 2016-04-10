#Load the dplyr  
library(dplyr)

#  dataset is avilable is working directory.Constructing Path Based on OS. 
#  ON Mac it wiil be UCI HAR Dataset/train and On Win it will be UCI HAR Dataset\train, using File.path to construct the path

TrainDataDir <- file.path("UCI HAR Dataset", "train")
TestDataDir <- file.path("UCI HAR Dataset", "test")

# Merging the training and the test sets for Subjct, X(activity Value), Y(Activity)
XTrain <- read.table(file.path( TrainDataDir,"X_train.txt"))
XTest <- read.table(file.path(TestDataDir, "X_test.txt"))
XMerge <- rbind(XTrain, XTest)

YTrain <- read.table(file.path(TrainDataDir, "y_train.txt"))
YTest <- read.table(file.path(TestDataDir, "y_test.txt"))
YMerge <- rbind(YTrain, YTest)

SubjectTrain <- read.table(file.path(TrainDataDir, "subject_train.txt"))
SubjectTest <- read.table(file.path(TestDataDir, "subject_test.txt"))
SubjectMerge <- rbind(SubjectTrain, SubjectTest)

#extract only the measurements on the mean and standard deviation

features <- read.table(file.path("UCI HAR Dataset", "features.txt"), 
                       col.names=c("featureid", "featurename"))

# Get features with 'mean' or 'std' and get required column
RegCol <- grep("(mean|std)\\(\\)", features$featurename)

# Select the Columns in X that has mean or std in it.
XMerge <- XMerge[, RegCol]
names(XMerge) <- features[RegCol, 2]

# Get the Activity Name
activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"), 
                             col.names=c("activityid", "activity"))

#Replace Y with actual activity name instead of numbered index.
names(YMerge) <- "activity"
YMerge[,1] <- activityLabels[YMerge[,1], 2]

# label subject
names(SubjectMerge) <- "subject"

# Merge all data together into one 
FinalMerge <- cbind(SubjectMerge, YMerge, XMerge)

# Creates independent tidy data set 
GroupBy <- group_by(FinalMerge, subject, activity)
# Then apply the mean function to each variable
tidydataset <- summarise_each(GroupBy, funs(mean))

#Create a new DataSet
write.table(tidydataset, "tinydata.txt", row.name=FALSE)

