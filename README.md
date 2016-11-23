# getting-and-cleaning-data-cousera

1. Please download the original data from this link: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
for more information, please go to the following link for the decription:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are some code description:
Explanation of each file

features.txt: Names of the 561 features.
activity_labels.txt: Names and IDs for each of the 6 activities.

X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.

subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.
More information about the files is available in README.txt. More information about the features is available in features_info.txt.


2. After you download the data, you may need to unzip and put all txt format files into the same directory.

3. Please run run_analysis.R in the R program/ R studio. 

4. Please check the tidydata.txt for the final result.
