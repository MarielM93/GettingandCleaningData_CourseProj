# Getting & Cleaning Data: Course Project

In this project, data collected from the accelerometer and gyroscope of the Samsung
Galaxy S smartphone was retrieved and subsequently prepared to create a tidy data
set that can be used for later analysis.

## What's in this Repository?

- `README.md`: this file, providing an overview of the data set

- `tidy_data.txt`: the resulting tidied up data set

- `CodeBook.md`: the code book, describing the contents of the raw and tidy data set, and the transformations used to generate the data

- `run_analysis.R`: the R script used to create the data set

## How to create the data set?

All the necessary code required to build the tidy data set is within the `run_analysis.R`
script. Note that you will need to have the `dplyr` package installed in R as it
will be required in order for the script to work.

The `run_analysis.R` script essentially does the following:

1. Downloads and unzips the source data
2. Reads and loads data into R
3. Merges the data into one data frame
4. Extracts the measurements on the mean and standard deviation for each measurement.
5. Uses descriptive activity names to name the activities in the data set
6. Assigns descriptive variable names on the data set
7. Creates a second, independent tidy data set with the mean of each variable for each activity and each subject
8. Writes the second data set to the `tidy_data.txt` file

The `tidy_data.txt` in this repository was created by running the `run_analysis.R` 
script using `R version 3.6.1 (2019-07-05)` with the `dplyr` v0.8.3 package on
Windows 10 64-bit edition.

