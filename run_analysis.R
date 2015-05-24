## step 1
## read training data
trainingDataX <- read.table("F:/R/courseproject/UCI HAR Dataset/train/X_train.txt", 
                            quote="\"", stringsAsFactors=FALSE)
trainingDataY <- read.table("F:/R/courseproject/UCI HAR Dataset/train/y_train.txt", 
                            quote="\"", stringsAsFactors=FALSE)
trainingDataSubject <- read.table("F:/R/courseproject/UCI HAR Dataset/train/subject_train.txt", 
                                  quote="\"", stringsAsFactors=FALSE)
trainingX<- tbl_df(trainingDataX)
trainingY<- tbl_df(trainingDataY)
trainingS<- tbl_df(trainingDataSubject)

## read test data
testX <- read.table("F:/R/courseproject/UCI HAR Dataset/test/X_test.txt", 
                    quote="\"", stringsAsFactors=FALSE)
testY <- read.table("F:/R/courseproject/UCI HAR Dataset/test/y_test.txt", 
                    quote="\"", stringsAsFactors=FALSE)
testS <- read.table("F:/R/courseproject/UCI HAR Dataset/test/subject_test.txt", 
                    quote="\"", stringsAsFactors=FALSE)

##combined training data and test data
combinedData<- rbind(trainingX, testX)

## combined label
combinedLabel<- rbind(trainingY, testY)

## combined the subject who performed the activity for each sample group
combinedSubject<- rbind(trainingS, testS)

## combined into one dataset
cleanset<- cbind(combinedLabel,combinedSubject, combinedData)

## read in the feature dataset
features <- read.table("F:/R/courseproject/UCI HAR Dataset/features.txt", quote="\"", 
                       stringsAsFactors=FALSE)

## name the columns
colnames(cleanset) <- c("activityID", "subjectID", features[,2])

## step 2
## create a charactor vector that contains the feature names
featurenames<- names(cleanset)

## get only columns with mean or std in their names
meanstd<- grep("-(mean|std)\\(\\)", featurenames)

## subset the required columns
subsetdata <- cleanset[, c(1,2,meanstd)]

## step 3 use the activity names to name the activities in the dataset
## Merge the final combined data with activity_lable dataset to name activities
activity_labels <- read.table("F:/R/courseproject/UCI HAR Dataset/activity_labels.txt", 
                              quote="\"", stringsAsFactors=FALSE)

colnames(activity_labels)=c("activityID","activityType")

finalcombined<- merge(subsetdata, activity_labels, by="activityID", all.x=TRUE)

## step4 appropriately label the dataset with descriptive variable names
## already descriptive

write.table(finalcombined, "firstdata.txt")

## create a second, independent tidy data with avarage of each variable for each
## activity and each subject

## create a dataset without activityType column
datasetwttype<- finalcombined[,names(finalcombined)!="activityType"]

## include the mean for each activity and each subject
tidydata<- aggregate(datasetwttype[, names(datasetwttype)!=c("activityID", "subjectID")], 
                     by=list(activityID=datasetwttype$activityID, 
                             subjectID= datasetwttype$subjectID),mean)
## merge with activity type description dataset
tidydata2<- merge(tidydata, activity_labels, by="activityID", all.x=TRUE)

## write out the tidy dataset
write.table(tidydata2, "TidyData.txt", row.names=FALSE, sep='\t')
