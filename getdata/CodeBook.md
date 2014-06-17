#CodeBook

##Original Data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##Variables
*ID*
- Subject ID
- Factor
- Levels: 1-30

*Activity*
- Activity the subject was doing
- Factor
- Levels: "walking", "walking _ upstairs", "walking _ downstairs", "sitting", "standing", "laying"

*Features*
- average of features for each subject/activity
- average of mean if contains mean()
- average of standard deviation if contains std()
- numeric

tBodyAcc-mean()-X: Body acceleration, x-axis
tBodyAcc-mean()-Y: Body acceleration, y-axis
tBodyAcc-mean()-Z: Body acceleration, z-axis
tBodyAcc-std()-X: Body acceleration, x-axis
tBodyAcc-std()-Y: Body acceleration, y-axis
tBodyAcc-std()-X: Body acceleration, z-axis
tGravityAcc-mean()-X: Gravity acceleration, x-axis
tGravityAcc-mean()-Y: Gravity acceleration, y-axis
tGravityAcc-mean()-Z: Gravity acceleration, z-axis
tGravityAcc-std()-X: Gravity acceleration, x-axis
tGravityAcc-std()-Y: Gravity acceleration, y-axis
tGravityAcc-std()-Z: Gravity acceleration, z-axis
tBodyAccJerk-mean()-X: Jerk signals from the accelerometer, x-axis
tBodyAccJerk-mean()-Y: Jerk signals from the accelerometer, y-axis
tBodyAccJerk-mean()-Z: Jerk signals from the accelerometer, z-axis
tBodyAccJerk-std()-X: Jerk signals from the accelerometer, x-axis
tBodyAccJerk-std()-Y: Jerk signals from the accelerometer, y-axis
tBodyAccJerk-std()-Z: Jerk signals from the accelerometer, z-axis
tBodyGyro-mean()-X: Signals from the gyroscope, x-axis
tBodyGyro-mean()-Y: Signals from the gyroscope, y-axis
tBodyGyro-mean()-Z: Signals from the gyroscope, z-axis
tBodyGyro-std()-X: Signals from the gyroscope, x-axis
tBodyGyro-std()-Y: Signals from the gyroscope, y-axis
tBodyGyro-std()-Z: Signals from the gyroscope, z-axis
tBodyGyroJerk-mean()-X: Jerk signals from the gyroscope, x-axis
tBodyGyroJerk-mean()-Y: Jerk signals from the gyroscope, y-axis
tBodyGyroJerk-mean()-Z: Jerk signals from the gyroscope, z-axis
tBodyGyroJerk-std()-X: Jerk signals from the gyroscope, x-axis
tBodyGyroJerk-std()-Y: Jerk signals from the gyroscope, y-axis
tBodyGyroJerk-std()-Z: Jerk signals from the gyroscope, z-axis
tBodyAccMag-mean(): Magnitude of body acceleration
tBodyAccMag-std(): Magnitude of body acceleration
tGravityAccMag-mean(): Magnitude of gravity acceleration
tGravityAccMag-std(): Magnitude of gravity acceleration
tBodyAccJerkMag-mean(): Magnitude of jerk signals from the accelerometer
tBodyAccJerkMag-std(): Magnitude of jerk signals from the accelerometer
tBodyGyroMag-mean(): Magnitude of signals from the gyroscope
tBodyGyroMag-std(): Magnitude of signals from the gyroscope
tBodyGyroJerkMag-mean(): Magnitude of jerk signals from the gyroscope
tBodyGyroJerkMag-std(): Magnitude of jerk signals from the gyroscope
fBodyAcc-mean()-X: Fast Fourier Transform of body acceleration, x-axis
fBodyAcc-mean()-Y: Fast Fourier Transform of body acceleration, y-axis
fBodyAcc-mean()-Z: Fast Fourier Transform of body acceleration, z-axis
fBodyAcc-std()-X: Fast Fourier Transform of body acceleration, x-axis
fBodyAcc-std()-Y: Fast Fourier Transform of body acceleration, y-axis
fBodyAcc-std()-X: Fast Fourier Transform of body acceleration, z-axis
fBodyAccJerk-mean()-X: Fast Fourier Transform of jerk signals from the accelerometer, x-axis
fBodyAccJerk-mean()-Y: Fast Fourier Transform of jerk signals from the accelerometer, y-axis
fBodyAccJerk-mean()-Z: Fast Fourier Transform of jerk signals from the accelerometer, z-axis
fBodyAccJerk-std()-X: Fast Fourier Transform of jerk signals from the accelerometer, x-axis
fBodyAccJerk-std()-Y: Fast Fourier Transform of jerk signals from the accelerometer, y-axis
fBodyAccJerk-std()-Z: Fast Fourier Transform of jerk signals from the accelerometer, z-axis
fBodyGyro-mean()-X: Fast Fourier Transform of signals from the gyroscope, x-axis
fBodyGyro-mean()-Y: Fast Fourier Transform of signals from the gyroscope, y-axis
fBodyGyro-mean()-Z: Fast Fourier Transform of signals from the gyroscope, z-axis
fBodyGyro-std()-X: Fast Fourier Transform of signals from the gyroscope, x-axis
fBodyGyro-std()-Y: Fast Fourier Transform of signals from the gyroscope, y-axis
fBodyGyro-std()-Z: Fast Fourier Transform of signals from the gyroscope, z-axis
fBodyAccMag-mean(): Fast Fourier Transform of magnitude of body acceleration
fBodyAccMag-std(): Fast Fourier Transform of magnitude of body acceleration
fBodyAccJerkMag-mean(): Fast Fourier Transform of magnitude of jerk signals from the accelerometer
fBodyAccJerkMag-std(): Fast Fourier Transform of magnitude of jerk signals from the accelerometer
fBodyGyroMag-mean(): Fast Fourier Transform of magnitude of signals from the gyroscope
fBodyGyroMag-std(): Fast Fourier Transform of magnitude of signals from the gyroscope
fBodyGyroJerkMag-mean(): Fast Fourier Transform of magnitude of jerk signals from the gyroscope
fBodyGyroJerkMag-std(): Fast Fourier Transform of magnitude of jerk signals from the gyroscope