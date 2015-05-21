# Read in the training data
xtrain = read.table("./train/X_train.txt", quote = "\"")
ytrain = read.table("./train/y_train.txt", quote = "\"")
subjtrain = read.table("./train/subject_train.txt", quote = "\"")

# Read in the test data
xtest = read.table("./test/X_test.txt", quote = "\"")
ytest = read.table("./test/y_test.txt", quote = "\"")
subjtest = read.table("./test/subject_test.txt", quote = "\"")

# Read in the features, convert to character class
feat = read.table("./features.txt", quote = "\"")
feat[,2] = as.character(feat[,2])

# Merge the subject, activity, and features for training and test data
# Merge the training and test data
# Corresponds to step (1) on assignment
data1 = cbind(subjtrain, ytrain, xtrain)
data2 = cbind(subjtest, ytest, xtest)
data = rbind(data1, data2)

# Name the columns
# Corresponds to step (4) on assignment
names(data) = c("subject", "activity", feat[,2])

# create a vector containing the first two columns and any column whose names contains "mean" or "std"
keep = c(1, 2, grep("mean", names(data)), grep("std", names(data)))

# Keep only the columns from the above filter
# Corresponds to step (2) on assignment
data = data[,keep]

# Update the "activity" variable with descriptions rather than numbers
# Corresponds to step (3) on assignment
data$activity[data$activity == 1] = "walking"
data$activity[data$activity == 2] = "walking upstairs"
data$activity[data$activity == 3] = "walking downstairs"
data$activity[data$activity == 4] = "sitting"
data$activity[data$activity == 5] = "standing"
data$activity[data$activity == 6] = "laying"

#### Create new dataset with average for each activity for each subject ####
# The rest of the code corresponds to step (5) on the assignment
data[,2] = factor(data[,2])
data[,1] = factor(data[,1])

### Making a table of averages

# Pre-allocate a matrix and convert to a dataframe
averages = matrix(0, length(levels(data$subject))*length(levels(data$activity)), dim(data)[2])
averages = as.data.frame(averages)
iter = 1

# Loop through for each subject
for (i in 1:length(levels(data$subject))){
  
  # Loop through each activity for each subject
  for (j in 1:length(levels(data$activity))){
    
    # Take the column-wise averages of all the measurements for a given activity for a given subject
    averages[iter,3:81] = colMeans(data[(data$subject == levels(data$subject)[i]) & (data$activity == levels(data$activity)[j]), 3:81])
    
    # Label which subject and which activity
    averages[iter, 1:2] = c(levels(data$subject)[i], levels(data$activity)[j])
    iter = iter + 1
    
  }
}

# Give the columns names
names(averages) = names(data)

# Write to text file
tidyData = write.table(averages, "tidyData.txt", row.names = F)
