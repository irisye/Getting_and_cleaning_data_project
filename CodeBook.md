
## Getting and Cleaning Data Course Project

### Description
This file describes the variables

### Source Data
A full description of this dataset can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Dataset Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.


### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment

### Files used in project
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Step 1
Merge the training and test dataset into one using rbind and cbind, and then name the columns, use the corresponding feature names.

### Step 2
Extract only the measurements on the mean and standard deviation for each measurement. 

Use grep() function to match and select out the feature names, and then subset dataset in the last step to keep only the necessary columns.

### Step 3
Use the activity names to name the activities in the dataset.

read in the activity_lables and merge it with the updated dataset by activityID. So every activity ID got a name now.

### Step 4
Since I've already rename the columns, it now has been clear and descriptive

### Step 5
Create a second, independent tidy data with avarage of each variable for each activity and each subject

Disattach the activity type column first, and after aggregating the mean for each activity and subject, merge again to have the activity type description in the dataset

Then write out the new tidy data table.

