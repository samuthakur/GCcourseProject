Feature Selection of the original (The data provided for the course project) data.
===================================================================================
According to the given information, the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

==========================================
Feature selection of the tidy data:
==========================================
The Tidy data contains the average values of only the 'mean' and 'std' measurments variables of the above given signals for each subject and each activity.

There are total 88 columns in the Tidy data.
1.subject

  Subject ID from 1:30

2. activity
     The names of  6 activities:
      1 WALKING
      2 WALKING_UPSTAIRS
      3 WALKING_DOWNSTAIRS
      4 SITTING
      5 STANDING
      6 LAYING

3 tBodyAcc-Avg.mean()-X	
4 tBodyAcc-Avg.mean()-Y	
5 tBodyAcc-Avg.mean()-Z	
6 tBodyAcc-Avg.std()-X	
7 tBodyAcc-Avg.std()-Y	
8 tBodyAcc-Avg.std()-Z	
9 tGravityAcc-Avg.mean()-X	
10 tGravityAcc-Avg.mean()-Y	
11 tGravityAcc-Avg.mean()-Z	
12 tGravityAcc-Avg.std()-X	
13 tGravityAcc-Avg.std()-Y	
14 tGravityAcc-Avg.std()-Z	
15 tBodyAccJerk-Avg.mean()-X	
16 tBodyAccJerk-Avg.mean()-Y	
17 tBodyAccJerk-Avg.mean()-Z	
18 tBodyAccJerk-Avg.std()-X	
19 tBodyAccJerk-Avg.std()-Y	
20 tBodyAccJerk-Avg.std()-Z	
21 tBodyGyro-Avg.mean()-X	
22 tBodyGyro-Avg.mean()-Y	
23 tBodyGyro-Avg.mean()-Z	
24 tBodyGyro-Avg.std()-X	
25 tBodyGyro-Avg.std()-Y	
26 tBodyGyro-Avg.std()-Z	
27 tBodyGyroJerk-Avg.mean()-X	
28 tBodyGyroJerk-Avg.mean()-Y	
29 tBodyGyroJerk-Avg.mean()-Z	
30 tBodyGyroJerk-Avg.std()-X	
31 tBodyGyroJerk-Avg.std()-Y	
32 tBodyGyroJerk-Avg.std()-Z	
33 tBodyAccMag-Avg.mean()	
34 tBodyAccMag-Avg.std()	
35 tGravityAccMag-Avg.mean()	
36 tGravityAccMag-Avg.std()	
37 tBodyAccJerkMag-Avg.mean()	
38 tBodyAccJerkMag-Avg.std()	
39 tBodyGyroMag-Avg.mean()	
40 tBodyGyroMag-Avg.std()	
41 tBodyGyroJerkMag-Avg.mean()	
42 tBodyGyroJerkMag-Avg.std()	
43 fBodyAcc-Avg.mean()-X	
44 fBodyAcc-Avg.mean()-Y	
45 fBodyAcc-Avg.mean()-Z	
46 fBodyAcc-Avg.std()-X	
47 fBodyAcc-Avg.std()-Y	
48 fBodyAcc-Avg.std()-Z	
49 fBodyAcc-Avg.meanFreq()-X	
50 fBodyAcc-Avg.meanFreq()-Y	
51 fBodyAcc-Avg.meanFreq()-Z	
52 fBodyAccJerk-Avg.mean()-X	
53 fBodyAccJerk-Avg.mean()-Y	
54 fBodyAccJerk-Avg.mean()-Z	
55 fBodyAccJerk-Avg.std()-X	
56 fBodyAccJerk-Avg.std()-Y	
57 fBodyAccJerk-Avg.std()-Z	
58 fBodyAccJerk-Avg.meanFreq()-X	
59 fBodyAccJerk-Avg.meanFreq()-Y	
60 fBodyAccJerk-Avg.meanFreq()-Z	
61 fBodyGyro-Avg.mean()-X	
62 fBodyGyro-Avg.mean()-Y	
63 fBodyGyro-Avg.mean()-Z	
64 fBodyGyro-Avg.std()-X	
65 fBodyGyro-Avg.std()-Y	
66 fBodyGyro-Avg.std()-Z	
67 fBodyGyro-Avg.meanFreq()-X	
68 fBodyGyro-Avg.meanFreq()-Y	
69 fBodyGyro-Avg.meanFreq()-Z	
70 fBodyAccMag-Avg.mean()	
71 fBodyAccMag-Avg.std()	
72 fBodyAccMag-Avg.meanFreq()	
73 fBodyBodyAccJerkMag-Avg.mean()	
74 fBodyBodyAccJerkMag-Avg.std()	
75 fBodyBodyAccJerkMag-Avg.meanFreq()	
76 fBodyBodyGyroMag-Avg.mean()	
77 fBodyBodyGyroMag-Avg.std()	
78 fBodyBodyGyroMag-Avg.meanFreq()	
79 fBodyBodyGyroJerkMag-Avg.mean()	
80 fBodyBodyGyroJerkMag-Avg.std()	
81 fBodyBodyGyroJerkMag-Avg.meanFreq()	
82 angle(tBodyAccAvg.mean,gravity)	
83 angle(tBodyAccJerkAvg.mean),gravityAvg.mean)	
84 angle(tBodyGyroAvg.mean,gravityAvg.mean)	
85 angle(tBodyGyroJerkAvg.mean,gravityAvg.mean)	
86 angle(X,gravityAvg.mean)	
87 angle(Y,gravityAvg.mean)	
88 angle(Z,gravityAvg.mean)	

The column names containing Avg.mean() or Avg.mean contain the average values of the means given in the original data for each subject and each activity.
The column names ending with Avg.mean()-X contain the average values of the means in the X direction.
The column names ending with Avg.mean()-Y contain the average values of the means in the Y direction.
The column names ending with Avg.mean()-Z contain the average values of the means in the Z direction.
The column names ending with Avg.std() contain the average values of the standard deviation given in the original data for each subject and each activity.
The column names ending with Avg.std()-X contain the average values of the standard deviation in the X direction.
The column names ending with Avg.std()-Y contain the average values of the standard deviation in the Y direction.
The column names ending with Avg.std()-Z contain the average values of the standard deviation in the Z direction.