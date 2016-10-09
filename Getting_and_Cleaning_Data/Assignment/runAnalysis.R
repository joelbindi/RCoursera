library(plyr)

if (!file.exists("data")) {
  message("Creating data folder")
  dir.create("data")
}

#Merge training and tests
trainingX <- read.table("train/X_train.txt")
trainingY <- read.table("train/Y_train.txt")
trainingSubject <- read.table("train/subject_train.txt")
testX <- read.table("test/X_test.txt")
testY <- read.table("test/X_test.txt")
testSubject <- read.table("test/subject_test.txt")

#Merge
mergedX <- rbind(trainingX,testX)
mergedY <- rbind(trainingY,testY)
mergedSubject <- rbind(trainingSubject,testSubject)



