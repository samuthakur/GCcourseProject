library(dplyr)
## read all the data files---------------------------------------
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/Y_test.txt")
subjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/Y_train.txt")
subjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

## put together the test data--------------------------------------
testdata<-cbind(subjectTest,ytest,xtest)

## put together the train data------------------------------------
traindata<-cbind(subjectTrain,ytrain,xtrain)

## assign column names to test and train data----------------------
colnames(testdata)<-c("subject","activity",as.vector(features[,2]))
colnames(traindata)<-c("subject","activity",as.vector(features[,2]))

## put together the test and train data-----------------------------
data<-rbind(testdata,traindata)

## assign discriptive names to activities in activity column of the data----
activity.code<-c(WALKING=1,WALKING_UPSTAIRS=2,WALKING_DOWNSTAIRS=3,SITTING=4,STANDING=5,LAYING=6)
data$activity<-names(activity.code)[match(data$activity,activity.code)]

## extract measurment on the mean only for each measurment------------------------------------
subdata_mean<-data[,1:563]%>%select(contains("mean")) 

## extract measurment on the standard deviation only for each measurment---------------------
subdata_std<-data[,1:563]%>%select(contains("std"))

##combine the mean and std data together-----------------------------------
subdata<-cbind(data[,1:2],subdata_mean,subdata_std)

## gruop the subdata by subject and activity-------------
groupdata<-subdata%>%group_by(subject,activity)

## creat an independent tidy data set with average of each variable for each 
# activity and each subject--------------------------
IndpData<-groupdata%>%summarise_each(funs(mean))

## change column names-------------------------------
nam<-colnames(IndpData)
nam2<-str_replace(nam,"mean",'Avg.mean')
nam3<-str_replace(nam2,"std","Avg.std")
colnames(IndpData)<-nam3

### save data to a text file--------------------------
write.table(IndpData, file=,"./Tidy_data.txt",row.names=FALSE,quote=F)
