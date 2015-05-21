---- Variables -----
There are 2 identifying variables in the data set:

Subject - An integer from 1 to 30 identifying the person performing the acticity
Activity - A description of the activity being measured. This variable has 6 values:

walking, 
walking upstairs,
walking downstairs,
sitting,
standing, 
laying [sic]


There are 81 measured variables in the tidy data set, which follow a descriptive code.
t - time domain variable
f - frequency domain variable

Body - refers to the subject's body movement
Grav - refers to the acceleration due to gravity

Acc - refers to measurements from an accelerometer
Gyro - refers to measurements taken from a gyroscope

Jerk - refers to calculations of the time change of acceleration

Mag - refers to magnitude of combining three-dimensional calculations

X,Y,Z - refer to the respective axis along which the measurement was taken

mean() - the measurement is a mean of measurements
std() - the measurement is the standard deviation of measurements

These are put together to form a variable name, e.g. tBodyAccX-mean() would be the time-domain body measurement from an accelerometer
in the x-direction, averaged across the time span.

The original data provided are normalized between [-1, 1], thus the data have no units.

----- Data -----
There are 30 subjects and six activities for each subject.
Each subject contains data for each of the six activities, for a total of 180 observations of the 81 features.
Each row represents the average of the features for that activity and subject.
Do not confuse this average with the "mean()" designation for the variable names. The mean() and std() designations
are calculations done on the measurements before they were aggregated for each activity. Thus, a feature containing "mean()" is
actually an average of already averaged measurements.

----- Data Cleaning Procedure -----
The first step was to merge the training and test measurements, and also the training and test subject designatons.
The subject designations and activity labels were then merged with the measurements.
The feature names were placed to name the columns of their respective measurements, and the activity numbers were replaced with their
respective descriptions.
Only features which were measurements of mean and standard deviation were kept (81 of 561 original features).
The data was split according to subject number, and from there split by activity.
For each of these subsets, the average of the features was calculated, and the data reintegrated.
