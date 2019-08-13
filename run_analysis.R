### Getting & Cleaning Data
### Course Project

# this script will be making use of dplyr.
library(dplyr)

# this block of code downloads the data set
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
datafile <- "dataset.zip"
download.file(dataurl, datafile, method = "curl")

# this block of code unzips the data set
unzip(datafile)
# the data set should be in the directory "./UCI HAR Dataset"

# time to load the data into r!
# these are lists, so readLines() should suffice
subjectID_test <- readLines("./UCI HAR Dataset/test/subject_test.txt")
activity_test <- readLines("./UCI HAR Dataset/test/Y_test.txt")
subjectID_train <- readLines("./UCI HAR Dataset/train/subject_train.txt")
activity_train <- readLines("./UCI HAR Dataset/train/Y_train.txt")

# these are tables, and hence read.table() must be used
values_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
values_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# for variables, an additional tweak is required
variables <- readLines("./UCI HAR Dataset/features.txt")

# changing the tables to tbl_df
values_test <- tbl_df(values_test)
values_train <- tbl_df(values_train)

# adding the variable names onto both tables
colnames(values_test) <- variables
colnames(values_train) <- variables

# adding the subject ids and activity column
fulltest <- mutate(values_test,
                   subjectID = subjectID_test,
                   activity = activity_test)
fulltrain <- mutate(values_train,
                   subjectID = subjectID_train,
                   activity = activity_train)

# merge train and test into one data set
fulldata <- bind_rows(fulltest, fulltrain)

# extracting the mean and sd for each measurement
extdata <- select(fulldata,
                  subjectID,
                  activity,
                  contains("mean"),
                  contains("std"))

# replace activity column values with activity names

