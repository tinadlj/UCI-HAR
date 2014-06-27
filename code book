
Variables & data:

traindata is X_train.txt file
trainy is y_train.txt file
trains is y_train.txt file
trainm = merge of traindata +trainy +trains

testdata is X_test.txt file
testy is y_test.txt file
tests is y_test.txt file
testm = merge of testdata +testy +tests

initialdata is the merge raw data of both training and test
measurementdata is the data which only contain the features we need
activity is activity_labels.txt file

Transformations:

Use grep function to extract festures containing mean() and std()
use this statement to change activity number to activity name:
measurementdata$activity<-activity[measurementdata$activity,2]
use gsub method to delete () from feature names

use aggregate method to group measurementdata based on activity and subject,
then calculate each group's mean using mean function


