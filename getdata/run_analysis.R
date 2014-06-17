library(plyr)

#download datasets
if(!file.exists("activity_dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="activity_dataset.zip", method="curl")
}
unzip("activity_dataset.zip")
setwd("UCI HAR Dataset/")

#read features, keep those with "mean" or "std"
features <- read.table("features.txt", col.names=c("ID","Name"), header=F)
data_cols <- grepl("mean|std",features$Name)
#read activities
activity_labels <- read.table("activity_labels.txt", col.names=c("ID","Activity"), header=F)

#read training data
X_train <- read.table("train/X_train.txt")
#select features
X_train <- X_train[,data_cols]
#label features
colnames(X_train) <- features$Name[data_cols]
#read activity data
y_train <- read.table("train/y_train.txt")
#read subject data
subject_train <- read.table("train/subject_train.txt", col.names=c("ID"), header=F)
#add activity data to training data
X_train$Activity <- activity_labels[y_train$V1,2]
#add subject data to training data
X_train$ID <- subject_train$ID

#do the same for test data
X_test <- read.table("test/X_test.txt")
X_test <- X_test[,data_cols]
colnames(X_test) <- features$Name[data_cols]
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
colnames(subject_test) <- c("ID")
X_test$Activity <- activity_labels[y_test$V1,2]
X_test$ID <- subject_test$ID

#combine the datasets
merged <- rbind(X_train, X_test)
#find variable means by subject ID and Activity
tidy <- ddply(merged, c("ID", "Activity"), colwise(mean))
#save clean dataset
write.csv(tidy, "tidy.csv")