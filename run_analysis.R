url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- file.path(getwd(),"dataset.zip")
download <- download.file(url,f)
#unzip files
unzip(zipfile = "dataset.zip")
#read y_test file in test folder
dataactivitytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
#read y_train file in train folder
dataactivitytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
#read subject_train file in train folder
datasubjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#read subject_test file in the test folder
datasubjecttest<-read.table("./UCI HAR Dataset/test/subject_test.txt")

datafeaturestest <- read.table("./UCI HAR Dataset/test/X_test.txt")

datafeaturestrain <- read.table("./UCI HAR Dataset/train/X_train.txt")

#rbind all subject txt
datasubject <- rbind(datasubjecttrain, datasubjecttest)

# rbind all activity  txt
dataactivity <- rbind (dataactivitytrain, dataactivitytest)

#rbind all features txt
datafeatures <- rbind(datafeaturestrain, datafeaturestest)

names(datasubject) <- c("subject")
names(dataactivity)<- c("activity")
datafeaturesnames <- read.table ("./UCI HAR Dataset/features.txt")
names(datafeatures) <- datafeaturesnames$V2
combine <- cbind(datasubject, dataactivity)
#get all the training and test data merged in data.txt file.
data <- cbind(datafeatures,combine)


#extract all keywords of mean or std from 2nd column of datafeaturesnames
names <- grepl("mean|std",datafeaturesnames$V2)
subdatafeaturesnames<- datafeaturesnames$V2[names]

#from subdatafeaturesnames files, extract all column that has keywords subject, activity.
#notice: be careful about the class of subdatafeaturesnames, which is the factor
#so need to switch to as.character. Otherwise, keywords will not be detected.
selectnames <- c (as.character(subdatafeaturesnames),"subject","activity")
data <- subset(data,select=selectnames)

#read context from activitylables.txt
activitylables <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activitylables) <- c("id","activity")
data <- merge(data, activitylables, by.x="activity", by.y="id")
data$activity<- factor(data$activity,labels=as.character(activitylables$activity))

names(data)<-gsub("^t", "time", colnames(data))
names(data) <- gsub("^f", "frequency", colnames(data))
names(data)<-gsub("Acc", "Accelerometer", colnames(data))
names(data)<-gsub("Gyro", "Gyroscope", colnames(data))
names(data)<-gsub("Mag", "Magnitude", colnames(data))
names(data)<-gsub("BodyBody", "Body", colnames(data))

# check the subject class and then transfer to factor class
library(reshape2)
class(data$subject)
data$subject <- as.factor(data$subject)
reshape <- melt(data, id=c("subject","activity"))
tidy <- dcast(reshape, suject+activity~variable,mean)
write.table(tidydata,"tidydata.txt",row.names=FALSE)


