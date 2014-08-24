
print ("Please wait a moment for the files to load")

#read test and train data
#read test and train subject IDs data  (ranging from 1 to 30)
#read test and train activity IDs data(ranging from 1 to 6)
testdata <-read.table("UCI HAR Dataset/test/X_test.txt", sep="")
traindata<-read.table("UCI HAR Dataset/train/X_train.txt", sep="")
subjectidtest <-read.table("UCI HAR Dataset/test/subject_test.txt", sep="")
subjectidtrain <-read.table("UCI HAR Dataset/train/subject_train.txt", sep="")
activitytest<-read.table("UCI HAR Dataset/test/y_test.txt", sep="")
activitytrain<-read.table("UCI HAR Dataset/train/y_train.txt", sep="")

#read features (561 labels - in the 2nd column seem useful)
#read activity labels(6 labels - in the 2nd column seem useful)
features<-read.table("UCI HAR Dataset/features.txt", sep="")
activitylabels<-read.table("UCI HAR Dataset/activity_labels.txt", sep="")

# adding activity,subject cols to the test & train data and merging the sets
#--->PROJECT:PART 1(Merges the training and the test sets to create one data set.)  
testdata<-cbind(activitytest,subjectidtest,testdata)
traindata<-cbind(activitytrain,subjectidtrain,traindata)
alldata<-rbind(testdata,traindata)

# column labels; ran into a huge problem here! colnames did not work rightaway
# figured that one could either force colnames or change to a workable format 
# removed  "(" , ")" and " _ " from the column names (could have used "make.names" instead)
features$V2 = gsub('[-)(]', '', features$V2)
#accounting for 2 additional cols in "alldata" 
colhead<-c("activity","subject",features$V2)

#obtaining wanted columns by pattern searching and then subsetting alldata
#--->PROJECT:PART 2 (Extracts only the measurements on the mean and standard deviation for each measurement.)
wantedcols<-grep("activity|subject|.*mean.*|.*std.*|.*Mean.*|.*Std.*", colhead)
firsttidydata<-alldata[,wantedcols]

#change activity iD to activity labels in test and train activity ID data
#--->PROJECT:PART3(Uses descriptive activity names to name the activities in the data set)
firsttidydata$V1<-factor(firsttidydata$V1,levels = c(1,2,3,4,5,6),labels=activitylabels$V2)

#adding column names
#--->PROJECT:PART(Appropriately labels the data set with descriptive variable names.)
colnames(firsttidydata)<-colhead[wantedcols]

#calculating averages 
#--->PROJECT:PART5(Creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject)
second_tidydata<-aggregate(firsttidydata[3:88],firsttidydata[1:2],mean)

#write
write.table(second_tidydata,file="second_tidydata.txt",sep="\t",row.name=FALSE)

print("....DONE. Output in second_tidydata.txt")

