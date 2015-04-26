# GCcourseProject
 Getting and cleaning data course project.

The script given below creates an independent tidy data set from the data provided for the course project assignment- 
-that can be found here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The tidy data set contains the average of each variable in the original data that measure the mean and standard deviation of each measurment, for each activity and each subject.
More information about the variables is given in CodeBokk.md file.
The script follows the following steps:

1.  Reads all the txt files (X_test, Y_test, subject_test, X_train, Y_train, subject_train, activity_labels,feature) into R.

2.  Puts togehter the test data by binding the columns of the subject_test, Y_test and X_test data in the same order.

3.  Puts togehter the train data by binding the columns of the subject_train, Y_train and X_train data in the same order.

4.  Assigns the column names to test and train data:
             First and second columns are named as 'subject' and 'activty' respectively.
             The names given in the 'feature.txt' file are assigned to the remaining columns in each test and train data as column names in the same order as given in the 'fature.txt' file.

5.  Combines the test and train data  by binding the rows of the two data. 

6.  Assigns discriptive names to the activitties  in the 'activity' column by replacing the number with the discriptive names given in the 'activity_labels' file.

7.  Extracts all the measurments on mean by selecting the column names that contain 'mean' word.

8.  Extracts all the measurments on standard deviation by selectng the column names that contain 'std' word.

9.  Combines the 'mean' and 'std' data extracted in steps 7 and 8.

10. Groups the combined data by subject and avtivity.

11. Finds the average of each column of the grouped data.

12. Assigns new names to the data obtained in step 11.

13. Writes the resulting data as a Tidy data to a txt file.   

##--------------run_analysis.R-----------------------------------
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
# activity and each subject------------------------------
IndpData<-groupdata%>%summarise_each(funs(mean))

##changing names-----------------------------------------
nam<-colnames(IndpData)
nam2<-str_replace(nam,"mean","Avg.mean")
nam3<-str_replace(nam2,"std","Avg.std")
colnames(IndpData)<-nam3

### save data to a text file--------------------------
write.table(IndpData, file=,"./Tidy_data.txt",row.names=FALSE,quote=F)
