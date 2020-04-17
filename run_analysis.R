#read files
xtest<- read.table("G:/Course/R/Clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
ytest<- read.table("G:/Course/R/Clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subjecttest<- read.table("G:/Course/R/Clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
xtrain<- read.table("G:/Course/R/Clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt") 
ytrain<- read.table("G:/Course/R/Clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt") 
subjecttrain<- read.table("G:/Course/R/Clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt") 

#combine test and train sets
xdata<- rbind(xtest, xtrain)
ydata<- rbind(ytest, ytrain)
subjectdata<- rbind(subjecttest, subjecttrain)
df<-cbind(subjectdata, ydata, xdata)

#give name to the activity
activity<- read.table("G:/Course/R/Clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")
activindex<- as.character(activity$V2)
df[,2]<- activindex[df[,2]]

#give variable names
feature.name<- as.character(feature[,2])
varname<- vector(length = length(feature.name)+2) 
varname[1:2]<- c("subject", "activity")
varname[3:(length(feature.name)+2)]<- feature.name
varname<- sub(varname, pattern = "\\()", replacement = "")
varname<- sub(varname, pattern = "-", replacement = "\\.")
colnames(df)<- varname

#extract mean and standard deviation of each measurements
feature<- read.table("G:/Course/R/Clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
meanstdcols<- grep("mean|std", feature$V2)
dfmeanstd<- df[, c(1, 2, meanstdcols+2)]

#tidy data set with average of variable, grouped by activity and subject
library(dplyr)
subject.activity.group<- group_by(dfmeanstd, subject, activity)
summary<- summarise_each(subject.activity.group, mean)
write.table(summary, "output.txt", row.names = FALSE)
