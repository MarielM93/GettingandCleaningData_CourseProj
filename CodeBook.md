# Code Book for Getting & Cleaning Data: Course Project

## The Raw Data

The original data was derived from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

A description of the data set is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Data Files

The raw data included the following files:

File name | Description
--- | ---
 `README.txt` | A description of the data set
`features.txt` | The list of measured variables in the data set
`features_info.txt` | Provides a description of the features listed in `features.txt`
`activity_labels.txt` | Activity class labels and the associated activity name

The following files are available for the train and test data. Their descriptions
are equivalent.

File name | Description
--- | ---
`train/subject_train.txt` | Each row identifies the subject who performed the activity for each window sample
`train/X_train.txt` | Contains records for the features measured for each subject and activity
`train/Y_train.txt` | Contains the activity done by the subject that was measured for that particular instance

The following files were included in the raw data set, but were not used in the tidy data:

File name | Description
--- | ---
`train/Inertial Signals/total_acc_x_train.txt` | The acceleration signal from the smartphone accelerometer X axis in standard gravity units `g`. Every row shows a 128 element vector. The same description applies for the `total_acc_x_train.txt` and `total_acc_z_train.txt` files for the Y and Z axis.
`train/Inertial Signals/body_acc_x_train.txt` | The body acceleration signal obtained by subtracting the gravity from the total acceleration.
`train/Inertial Signals/body_gyro_x_train.txt` | The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

*Why were these data not used?*

We only needed the means and standard deviations in our tidy data set, all of which
one can easily find within the `X_train.txt` (and equivalent) records.

## Transformation of the Raw Data
These are the steps taken to transform the Raw Data into a singular tidy data set:

1. Merged the training and data sets to create one set

2. Extracted the measurements on the mean and standard deviation for each measurement

3. Convert the activity codes derived from the `Y_train.txt` (and test equivalent)
data set to their corresponding activity label

4. Give the data set appropriate and descriptive label names

5. Group the data by subject and activity type and summarise the values by the mean.

These transformations can be executed with the script `run_analysis.R`

## The Tidy Data

The tidy data set is located in the `tidy_data.txt` file in this repository.

### Data
The `tidy_data.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, listed and described in the
Variables section. The rows contain the values of these variables.

### Variables

Each row contains, for a given subject and activity, 79 averaged signal measurements.

#### Identifiers

- `SubjectID`

   Subject identifier, ranges from 1 to 30.

- `Activity`

   Activity identifier, with 6 possible values:
   
   1. `WALKING`: subject was walking
   2. `WALKING_UPSTAIRS`: subject was walking upstairs
   3. `WALKING_DOWNSTAIRS`: subject was walking downstairs
   4. `SITTING`: subject was sitting
   5. `STANDING`: subject was standing
   6. `LAYING`: subject was lying down
   
#### Average of measurements

##### Overview of measurements

- Acceleration measurements (variables containing `Accelerometer`) were measured
in standard gravity units 'g'.

- Gyroscope measurements (variables containing `Gyroscope`) were measured in
radians/second. 

- Jerk measurements (variables containing `Jerk`) were derived from the body linear 
acceleration and angular velocity in time

- Magnitudes of the three-dimensional signals (variables containing `Magnitude`)
were calculated using the Euclidean norm

- The measurements are classified into two domains:

   - **Time-domain signals**
      
      Variables prefixed by `Time`, these variables resulted from the capture of accelerometer and gyroscope raw signals
      
   - **Frequency-domain signals**
      
      Variables prefixed by `Frequency`, these variables resulted from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals
      
##### Time-domain signals

- Mean body acceleration in the X, Y and Z axes
   - `TimeBodyAccelerometerMeanX`
   - `TimeBodyAccelerometerMeanY`
   - `TimeBodyAccelerometerMeanZ`
   
- Mean gravity acceleration in the X, Y and Z axes
   - `TimeGravityAccelerometerMeanX`
   - `TimeGravityAccelerometerMeanY`
   - `TimeGravityAccelerometerMeanZ`

- Mean body acceleration jerk in the X, Y and Z axes
   - `TimeBodyAccelerometerJerkMeanX`
   - `TimeBodyAccelerometerJerkMeanY`
   - `TimeBodyAccelerometerJerkMeanZ`
   
- Mean body angular velocity in the X, Y and Z axes
   - `TimeBodyGyroscopeMeanX`
   - `TimeBodyGyroscopeMeanY`
   - `TimeBodyGyroscopeMeanZ`
   
- Mean body angular velocity jerk in the X, Y, and Z axes
   - `TimeBodyGyroscopeJerkMeanX`
   - `TimeBodyGyroscopeJerkMeanY`
   - `TimeBodyGyroscopeJerkMeanZ`
   
- Mean magnitudes for the aforementioned values
   - `TimeBodyAccelerometerMagnitudeMean`
   - `TimeGravityAccelerometerMagnitudeMean`
   - `TimeBodyAccelerometerJerkMagnitudeMean`
   - `TimeBodyGyroscopeMagnitudeMean`
   - `TimeBodyGyroscopeJerkMagnitudeMean`
   
- Standard deviation for body acceleration in the X, Y and Z axes
   - `TimeBodyAccelerometerSTDX`
   - `TimeBodyAccelerometerSTDY`
   - `TimeBodyAccelerometerSTDZ`

- Standard deviation of gravity acceleration in the X, Y and Z 
   - `TimeGravityAccelerometerSTDX`
   - `TimeGravityAccelerometerSTDY`
   - `TimeGravityAccelerometerSTDZ`

- Standard deviation of body acceleration jerk in the X, Y, and Z axes
   - `TimeBodyAccelerometerJerkSTDX`
   - `TimeBodyAccelerometerJerkSTDY`
   - `TimeBodyAccelerometerJerkSTDZ`

- Standard deviation of body angular velocity in the X, Y and Z axes
   - `TimeBodyGyroscopeSTDX`
   - `TimeBodyGyroscopeSTDY`
   - `TimeBodyGyroscopeSTDZ`

- Standard deviation of body angular velocity jerk in the X, Y, and Z axes
   - `TimeBodyGyroscopeJerkSTDX`
   - `TimeBodyGyroscopeJerkSTDY`
   - `TimeBodyGyroscopeJerkSTDZ`
   
- Standard deviation of magnitudes for the aforementioned values
   - `TimeBodyAccelerometerMagnitudeSTD`
   - `TimeGravityAccelerometerMagnitudeSTD`
   - `TimeBodyAccelerometerJerkMagnitudeSTD`
   - `TimeBodyGyroscopeMagnitudeSTD`
   - `TimeBodyGyroscopeJerkMagnitudeSTD`
   
##### Frequency-domain signals

- Mean frequency of body acceleration in the X, Y and Z axes
   - `FrequencyuencyBodyAccelerometerMeanX`
   - `FrequencyuencyBodyAccelerometerMeanY`
   - `FrequencyuencyBodyAccelerometerMeanZ`

- Weighted average of the frequency of body acceleration in the X, Y and Z axes
   - `FrequencyuencyBodyAccelerometerMeanFrequencyX`
   - `FrequencyuencyBodyAccelerometerMeanFrequencyY`
   - `FrequencyuencyBodyAccelerometerMeanFrequencyZ`
   
- Mean frequency of body acceleration jerk in the X, Y and Z axes
   - `FrequencyuencyBodyAccelerometerJerkMeanX`
   - `FrequencyuencyBodyAccelerometerJerkMeanY`
   - `FrequencyuencyBodyAccelerometerJerkMeanZ`

- Weighted average of the frequency of body acceleration jerk in the X, Y and Z axes
   - `FrequencyuencyBodyAccelerometerJerkMeanFrequencyX`
   - `FrequencyuencyBodyAccelerometerJerkMeanFrequencyY`
   - `FrequencyuencyBodyAccelerometerJerkMeanFrequencyZ`
   
- Mean frequency of body angular velocity in the X, Y and Z axes
   - `FrequencyuencyBodyGyroscopeMeanX`
   - `FrequencyuencyBodyGyroscopeMeanY`
   - `FrequencyuencyBodyGyroscopeMeanZ`
   
- Weighted average of the frequency of body angular velocity in the X, Y, and Z axes
   - `FrequencyuencyBodyGyroscopeMeanFrequencyX`
   - `FrequencyuencyBodyGyroscopeMeanFrequencyY`
   - `FrequencyuencyBodyGyroscopeMeanFrequencyZ`
   
- Mean magnitudes for the aforementioned values
   - `FrequencyuencyBodyAccelerometerMagnitudeMean`
   - `FrequencyuencyBodyAccelerometerMagnitudeMeanFrequency`
   - `FrequencyuencyBodyAccelerometerJerkMagnitudeMean`
   - `FrequencyuencyBodyAccelerometerJerkMagnitudeMeanFrequency`
   - `FrequencyuencyBodyGyroscopeMagnitudeMean`
   - `FrequencyuencyBodyGyroscopeMagnitudeMeanFrequency`
   - `FrequencyuencyBodyGyroscopeJerkMagnitudeMean`
   - `FrequencyuencyBodyGyroscopeJerkMagnitudeMeanFrequency`
   
- Standard deviation of body acceleration in the X, Y and Z axes
   - `FrequencyuencyBodyAccelerometerSTDX`
   - `FrequencyuencyBodyAccelerometerSTDY`
   - `FrequencyuencyBodyAccelerometerSTDZ`
   
- Standard deviation of body acceleration jerk in the X, Y and Z axes
   - `FrequencyuencyBodyAccelerometerJerkSTDX`
   - `FrequencyuencyBodyAccelerometerJerkSTDY`
   - `FrequencyuencyBodyAccelerometerJerkSTDZ`
   
- Standard deviation of body angular velocity in the X, Y and Z axes
   - `FrequencyuencyBodyGyroscopeSTDX`
   - `FrequencyuencyBodyGyroscopeSTDY`
   - `FrequencyuencyBodyGyroscopeSTDZ`
   
- Standard deviation of the magnitudes for the aforementioned values
   - `FrequencyuencyBodyAccelerometerMagnitudeSTD`
   - `FrequencyuencyBodyAccelerometerJerkMagnitudeSTD`
   - `FrequencyuencyBodyGyroscopeMagnitudeSTD`
   - `FrequencyuencyBodyGyroscopeJerkMagnitudeSTD`