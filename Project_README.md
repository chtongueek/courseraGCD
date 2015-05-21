This README steps through the run_analysis script file.

The script begins by loading in 7 data files:

X_train.txt
y_train.txt
subject_train.txt
X_test.txt
y_test.txt
subject_test.txt
features.txt

The script then merges the x, y, and subject training data, and then does the same for the test data. It then merges the test and training data into one data set. The script then labels the columns with the features provided in the "features.txt" file.

The script proceeds to keep only those features which are a measurement of mean (mean()) or standard deviation (std()). Then the activity labels are updated to their corresponding descriptive labels.

The final step is to average the measurments by subject and activity. 
This is accomplished by first breaking the data by subject.
For each subject data subset, that subset is further broken down by activity, and the average of each feature is calculated.
