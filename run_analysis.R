#1.Merges the training and the test sets to create one data set.
#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# 
traindata<-read.csv("./UCI HAR Dataset/train/X_train.txt",header=FALSE, sep="",stringsAsFactors=FALSE)
trainy<-read.csv("./UCI HAR Dataset/train/y_train.txt",header=FALSE, sep="",stringsAsFactors=FALSE)
trains<-read.csv("./UCI HAR Dataset/train/subject_train.txt",header=FALSE, sep="",stringsAsFactors=FALSE)
trainm<-cbind(traindata,trainy,trains)

testdata<-read.csv("./UCI HAR Dataset/test/X_test.txt",header=FALSE, sep="",stringsAsFactors=FALSE)
testy<-read.csv("./UCI HAR Dataset/test/y_test.txt",header=FALSE, sep="",stringsAsFactors=FALSE)
tests<-read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE, sep="",stringsAsFactors=FALSE)
testm<-cbind(testdata,testy,tests)

initialdata<-rbind(trainm,testm)

feature<-read.csv("./UCI HAR Dataset/features.txt",sep=" ",header=FALSE,stringsAsFactor=FALSE)
feature<-rbind(feature,c(562,'y'),c(563,'subject'))
names(initialdata)<-feature[,2]

toMatch<-c("mean\\(\\)","std\\(\\)")
matches<-unique(grep(paste(toMatch,collapse="|"),names(initialdata),value=TRUE))

measurementdata<-initialdata[,matches]
measurementdata<-cbind(measurementdata,initialdata[,562:563])
names(measurementdata)[67]<-"activity"

activity<-read.csv("./UCI HAR Dataset/activity_labels.txt",sep="", header=FALSE,stringsAsFactor=FALSE)
names(activity)<-c("an","activity")
measurementdata$activity<-activity[measurementdata$activity,2]
temp<-names(measurementdata)
temp<-gsub("\\(\\)","",temp)
names(measurementdata)<-temp

write.csv(measurementdata,file="./UCI HAR Dataset/measuredata.txt")

names(measurementdata)[68]<-"sub"
aveR<-aggregate(. ~sub+activity,data=measurementdata,FUN=mean)
write.csv(aveR,file="./UCI HAR Dataset/average.txt")


