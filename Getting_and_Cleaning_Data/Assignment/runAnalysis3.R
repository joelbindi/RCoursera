# library(plyr)
# 
# if (!file.exists("data")) {
#   message("Creating data folder")
#   dir.create("data")
# }
# 
# #Merge training and tests
# trainingX <- read.table("train/X_train.txt")
# trainingY <- read.table("train/Y_train.txt")
# trainingSubject <- read.table("train/subject_train.txt")
# testX <- read.table("test/X_test.txt")
# testY <- read.table("test/Y_test.txt")
# testSubject <- read.table("test/subject_test.txt")
# 
# #Merge
# mergedX <- rbind(trainingX,testX)
# mergedY <- rbind(trainingY,testY)
# mergedSubject <- rbind(trainingSubject,testSubject)
# list(x=mergedX,y=mergedY,subject=mergedSubject)
# 
# features <- read.table("features.txt")
# # Find the mean and std columns
# mean.col <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
# std.col <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))
# # Extract them from the data
# edf <- df[, (mean.col | std.col)]
# colnames(edf) <- features[(mean.col | std.col), 2]
# edf




library(reshape2)

filename <- "getdata_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Load activity labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
featuresWanted <- grep(".*mean.*|.*std.*", features[,2])
featuresWanted.names <- features[featuresWanted,2]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)


# Load the datasets
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresWanted]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresWanted]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test)

# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)

# turn activities & subjects into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)