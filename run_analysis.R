### Getting & Cleaning Data
### Course Project

## Part 1: Preparation Stage
# The necessary libraries will be loaded first.
# This script will be making use of dplyr.
library(dplyr)

# Downloading the data set
dataurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
datafile <- "dataset.zip"
download.file(dataurl, datafile, method = "curl")

# The data set is in a zip file and thus must be unzipped
unzip(datafile)
# Note: the data set should be in the directory "./UCI HAR Dataset"

## Part 2: Loading the Data into R!
# The text files will be read as tables and I will be assigning column names
# to make the subsequent steps easier
variables <- read.table("./UCI HAR Dataset/features.txt",
                        col.names = c("n", "functions"))
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",
                         col.names = c("code", "activity"))
subjectID_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                             col.names = "SubjectID")
subjectID_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                              col.names = "SubjectID")
activity_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",
                            col.names = "ActivityCode")
activity_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",
                             col.names = "ActivityCode")
values_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                          col.names = variables$functions,
                          check.names = FALSE)
values_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
                           col.names = variables$functions,
                           check.names = FALSE)

# Part 3: Merging the data into one big data set
fullvalues <- rbind(values_test, values_train)
fullactivity <- rbind(activity_test, activity_train)
fullsubjects <- rbind(subjectID_test, subjectID_train)
merged_data <- cbind(fullsubjects, fullactivity, fullvalues)

# Part 4: Extracting the relevant variables
# We will only be extracting the Means and Standard Deviations for each variable
# To exclude the columns with duplicate names: (we don't need these)
extdata <- merged_data[,-(463:504)]
extdata <- select(extdata,
                  SubjectID,
                  ActivityCode,
                  contains("mean"),
                  contains("std"))

# Removing the 'angle' columns
extdata <- select(extdata, -(49:55))

# Part 5: Put a label on it
# This is to label the Activities
extdata$ActivityCode <- activities[extdata$ActivityCode, 2]

# And this is to clean up the columns
# Removing special characters
names(extdata) <- gsub("[\\(\\)-]", "", names(extdata))

# Adding the labels
names(extdata)[2] <- "Activity"
names(extdata) <- gsub("Acc", "Accelerometer", names(extdata))
names(extdata) <-gsub("Gyro", "Gyroscope", names(extdata))
names(extdata) <-gsub("BodyBody", "Body", names(extdata))
names(extdata) <-gsub("Mag", "Magnitude", names(extdata))
names(extdata) <-gsub("^t", "Time", names(extdata))
names(extdata) <-gsub("^f", "Frequency", names(extdata))
names(extdata) <-gsub("mean", "Mean", names(extdata))
names(extdata) <-gsub("std", "STD", names(extdata))
names(extdata) <-gsub("Freq", "Frequency", names(extdata))

# Rearranging the columns
extdata <- select(extdata,
                  SubjectID,
                  Activity,
                  contains("Time"),
                  contains("Frequency"))

# Part 6: Creating the second data set
# Grouping by Subject ID & Activity and calculating the mean for each variable
finaldata <- extdata %>%
        group_by(SubjectID, Activity) %>%
        summarise_all(mean)

# Exporting the second data set into a txt file
write.table(finaldata, 
            "tidy_data.txt", 
            row.names = FALSE)