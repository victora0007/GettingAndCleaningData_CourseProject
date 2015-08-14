# Get the data
# 1. Set working directory
pathwd <- "D:/Documentos/Training/Coursera/GettingandCleaningData/CourseProject"
old_wd <- getwd()
setwd(pathwd)

# 2. Download the file to the "data" folder and unzip the file
if (!file.exists("./data/Dataset.zip")) {
        dir.create("./data")
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./data/Dataset.zip", mode = "wb")
        dateDownload <- date()
        unzip (zipfile = "./data/Dataset.zip", exdir = "./data")
}

# Read the data
# 1. Read the labels files
training_lab <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
test_lab <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
activity_lab <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# 2. Read the subject files
training_sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
test_sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# 3. Read the features files
training_fea <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
test_fea <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE)

# Merges the training and the test sets to create one data set.
# 1. Merge the dataframes by rows
dataFeatures <- rbind(training_fea, test_fea)
dataLabels <- rbind(training_lab, test_lab)
dataSubjects <- rbind(training_sub, test_sub)

# 2. Set column names to the dataframes
names(dataFeatures) <- features$V2
names(dataLabels) <- "Labels"
names(dataSubjects) <- "Subjects"

# 3. Combine all dataframes to create the "dataFinal" dataframe
dataFinal <- cbind(dataFeatures, dataSubjects, dataLabels)

# Extracts only the measurements on the mean and standard deviation for each measurement
library(dplyr)
cran <- tbl_df(dataFinal)
