---
title: "CodeBook.md"
output: html_document
---

### Data Description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. This data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

### Transformations

With the above dateset as input, the script run_analysis.R does the following transformations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

### Variables

From the above transformations, the resultant tidy data set has the following variables

- Time.BodyAcceleration.Mean.X: Average of Body Acceleration - Mean on X axis in the time domain
- Time.BodyAcceleration.Mean.Y: Average of Body Acceleration - Mean on Y axis in the time domain
- Time.BodyAcceleration.Mean.Z: Average of Body Acceleration - Mean on Z axis in the time domain
- Time.BodyAcceleration.StdDev.X: Average of Body Acceleration - Standard Deviation on X axis in the time domain
- Time.BodyAcceleration.StdDev.Y: Average of Body Acceleration - Standard Deviation on Y axis in the time domain
- Time.BodyAcceleration.StdDev.Z: Average of Body Acceleration - Standard Deviation on Z axis in the time domain
- Time.GravityAcceleration.Mean.X: Average of Gravity Acceleration - Mean on X axis in the time domain
- Time.GravityAcceleration.Mean.Y: Average of Gravity Acceleration - Mean on Y axis in the time domain
- Time.GravityAcceleration.Mean.Z: Average of Gravity Acceleration - Mean on Z axis in the time domain
- Time.GravityAcceleration.StdDev.X: Average of Gravity Acceleration - Standard Deviation on X axis in the time domain
- Time.GravityAcceleration.StdDev.Y: Average of Gravity Acceleration - Standard Deviation on Y axis in the time domain
- Time.GravityAcceleration.StdDev.Z: Average of Gravity Acceleration - Standard Deviation on Z axis in the time domain
- Time.BodyAccelerationJerk.Mean.X: Average of Body Acceleration Jerk Signal - Mean on X axis in the time domain
- Time.BodyAccelerationJerk.Mean.Y: Average of Body Acceleration Jerk Signal - Mean on Y axis in the time domain
- Time.BodyAccelerationJerk.Mean.Z: Average of Body Acceleration Jerk Signal - Mean on Z axis in the time domain
- Time.BodyAccelerationJerk.StdDev.X: Average of Body Acceleration Jerk Signal - Standard Deviation on X axis in the time domain
- Time.BodyAccelerationJerk.StdDev.Y: Average of Body Acceleration Jerk Signal - Standard Deviation on Y axis in the time domain
- Time.BodyAccelerationJerk.StdDev.Z: Average of Body Acceleration Jerk Signal - Standard Deviation on Z axis in the time domain
- Time.BodyGyro.Mean.X: Average of Body Angular Velocity - Mean on X axis in the time domain
- Time.BodyGyro.Mean.Y: Average of Body Angular Velocity - Mean on Y axis in the time domain
- Time.BodyGyro.Mean.Z: Average of Body Angular Velocity - Mean on Z axis in the time domain
- Time.BodyGyro.StdDev.X: Average of Body Angular Velocity - Standard Deviation on X axis in the time domain
- Time.BodyGyro.StdDev.Y: Average of Body Angular Velocity - Standard Deviation on Y axis in the time domain
- Time.BodyGyro.StdDev.Z: Average of Body Angular Velocity - Standard Deviation on Z axis in the time domain
- Time.BodyGyroJerk.Mean.X: Average of Body Angular Velocity Jerk Signal - Mean on X axis in the time domain
- Time.BodyGyroJerk.Mean.Y: Average of Body Angular Velocity Jerk Signal - Mean on Y axis in the time domain
- Time.BodyGyroJerk.Mean.Z: Average of Body Angular Velocity Jerk Signal - Mean on Z axis in the time domain
- Time.BodyGyroJerk.StdDev.X: Average of Body Angular Velocity Jerk Signal - Standard Deviation on X axis in the time domain
- Time.BodyGyroJerk.StdDev.Y: Average of Body Angular Velocity Jerk Signal - Standard Deviation on Y axis in the time domain
- Time.BodyGyroJerk.StdDev.Z: Average of Body Angular Velocity Jerk Signal - Standard Deviation on Z axis in the time domain
- Time.BodyAccelerationMagnitude.Mean: Average of Body Acceleration Magniture - Mean in the time domain
- Time.BodyAccelerationMagnitude.StdDev: Average of Body Acceleration Magniture - Standard Deviation in the time domain
- Time.GravityAccelerationMagnitude.Mean: Average of Gravity Acceleration Magniture - Mean in the time domain
- Time.GravityAccelerationMagnitude.StdDev: Average of Gravity Acceleration Magniture - Standard Deviation in the time domain
- Time.BodyAccelerationJerkMagnitude.Mean: Average of Body Acceleration Jerk Signal Magniture - Mean in the time domain
- Time.BodyAccelerationJerkMagnitude.StdDev: Average of Body Acceleration Jerk Signal Magniture - Standard Deviation in the time domain
- Time.BodyGyroscopeMagnitude.Mean: Average of Body Angular Velocity Magniture - Mean in the time domain
- Time.BodyGyroscopeMagnitude.StdDev: Average of Body Angular Velocity Magniture - Standard Deviation in the time domain
- Time.BodyGyroscopeJerkMagnitude.Mean: Average of Body Angular Velocity Jerk Signal Magniture - Mean in the time domain
- Time.BodyGyroscopeJerkMagnitude.StdDev: Average of Body Angular Velocity Jerk Signal Magniture - Standard Deviation in the time domain
- Frequency.BodyAcceleration.Mean.X: Average of Body Acceleration - Mean on X axis in the frequency domain
- Frequency.BodyAcceleration.Mean.Y: Average of Body Acceleration - Mean on Y axis in the frequency domain
- Frequency.BodyAcceleration.Mean.Z: Average of Body Acceleration - Mean on Z axis in the frequency domain
- Frequency.BodyAcceleration.StdDev.X: Average of Body Acceleration - Standard Deviation on X axis in the frequency domain
- Frequency.BodyAcceleration.StdDev.Y: Average of Body Acceleration - Standard Deviation on X axis in the frequency domain
- Frequency.BodyAcceleration.StdDev.Z: Average of Body Acceleration - Standard Deviation on X axis in the frequency domain
- Frequency.BodyAccelerationJerk.Mean.X: Average of Body Acceleration Jerk Signal - Mean on X axis in the frequency domain
- Frequency.BodyAccelerationJerk.Mean.Y: Average of Body Acceleration Jerk Signal - Mean on Y axis in the frequency domain
- Frequency.BodyAccelerationJerk.Mean.Z: Average of Body Acceleration Jerk Signal - Mean on Z axis in the frequency domain
- Frequency.BodyAccelerationJerk.StdDev.X: Average of Body Acceleration Jerk Signal - Standard Deviation on X axis in the frequency domain
- Frequency.BodyAccelerationJerk.StdDev.Y: Average of Body Acceleration Jerk Signal - Standard Deviation on Y axis in the frequency domain
- Frequency.BodyAccelerationJerk.StdDev.Z: Average of Body Acceleration Jerk Signal - Standard Deviation on Z axis in the frequency domain
- Frequency.BodyGyro.Mean.X: Average of Body Angular Velocity - Mean on X axis in the frequency domain
- Frequency.BodyGyro.Mean.Y: Average of Body Angular Velocity - Mean on Y axis in the frequency domain
- Frequency.BodyGyro.Mean.Z: Average of Body Angular Velocity - Mean on Z axis in the frequency domain
- Frequency.BodyGyro.StdDev.X: Average of Body Angular Velocity - Standard Deviation on X axis in the frequency domain
- Frequency.BodyGyro.StdDev.Y: Average of Body Angular Velocity - Standard Deviation on Y axis in the frequency domain
- Frequency.BodyGyro.StdDev.Z: Average of Body Angular Velocity - Standard Deviation on Z axis in the frequency domain
- Frequency.BodyAccelerationMagnitude.Mean: Average of Body Acceleration Magniture - Mean in the frequency domain
- Frequency.BodyAccelerationMagnitude.StdDev: Average of Body Acceleration Magniture - Standard Deviation in the frequency domain
- Frequency.BodyAccelerationJerkMagnitude.Mean: Average of Body Acceleration Jerk Signal Magniture - Mean in the frequency domain
- Frequency.BodyAccelerationJerkMagnitude.StdDev: Average of Body Acceleration Jerk Signal Magniture - Standard Deviation in the frequency domain
- Frequency.BodyGyroscopeMagnitude.Mean: Average of Body Angular Velocity Magniture - Mean in the frequency domain
- Frequency.BodyGyroscopeMagnitude.StdDev: Average of Body Angular Velocity Magniture - Standard Deviation in the frequency domain
- Frequency.BodyGyroscopeJerkMagnitude.Mean: Average of Body Angular Velocity Jerk Signal Magniture - Mean in the frequency domain
- Frequency.BodyGyroscopeJerkMagnitude.StdDev: Average of Body Angular Velocity Jerk Signal Magniture - Standard Deviation in the frequency domain
- Activity: One of the six activities performed by the volunteer (1: WALKING, 2: WALKING_UPSTAIRS, 3: WALKING_DOWNSTAIRS, 4: SITTING, 5: STANDING, 6: LAYING)
- Subject: Represents the volunteer performing the activity
