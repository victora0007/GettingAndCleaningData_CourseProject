# GET THE DATA
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

# READ THE DATA
# Read the labels files
training_lab <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
test_lab <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
activity_lab <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Read the subject files
training_sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
test_sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# Read the features files
training_fea <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
test_fea <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE)


# Merges the training and the test sets to create one data set
library(data.table)
training_data <- data.table(id = training_lab, training_set)
test_data <- data.table(id = test_lab, test_set)
data_merge <- merge(training_data, test_data)
