UCI-HAR
=======

Getting and Cleaning Data project 2


1.Merges the training and the test sets to create one data set. 
  
  Read the training dataset and test dataset from download files. Merge training data and its activity column & subject column into one file. Do the same thing for test data. Then combine these two file into one file using row bind.
  
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
  
  use regex function to select only mean() and standard() columns, exclude the columns which contain only mean.
  
3.Uses descriptive activity names to name the activities in the data set
  
  Replace the activity number with its related activity name. Then add them to the dataset.
  
4.Appropriately labels the data set with descriptive variable names. 
  
  Delete () from the variable names.

5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  
  Use aggregate function based on activity and subject using mean method.
