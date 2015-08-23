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
# 1. Read the activity files
training_act <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
test_act <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# 2. Read the subject files
training_sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
test_sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)

# 3. Read the features files
training_fea <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
test_fea <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE, 
                       colClasses = "character")

# Merges the training and the test sets to create one data set.
# 1. Merge the dataframes by rows
dataFeatures <- rbind(training_fea, test_fea)
dataActivity <- rbind(training_act, test_act)
dataSubjects <- rbind(training_sub, test_sub)

# 2. Set column names to the dataframes
names(dataFeatures) <- features$V2
names(dataActivity) <- "Activity"
names(dataSubjects) <- "Subjects"

# 3. Combine all dataframes to create the "dataFinal" dataframe
dataFinal <- cbind(dataFeatures, dataSubjects, dataActivity)

# 4. Check the structures of the data frame
str(dataFinal)

# Extracts only the measurements on the mean and standard deviation for each measurement
# 1. Use dplyr package to convert the dataframe to a tbl
library(dplyr)
cran <- tbl_df(dataFinal)
rm("dataFinal")
valid_column_names <- make.names(names = names(cran), unique = TRUE, allow_ = TRUE)
names(cran) <- valid_column_names

# 2. Select only the columns that contains "mean" or "std" for each measurement
cran2 <- select(cran, contains("mean"), contains("std"), Subjects, Activity)
rm("cran")

# 3. Check the structures of the tbl
str(cran2)

# Uses descriptive activity names to name the activities in the data set
# 1. Merges data frames
mergedData <- merge(cran2, activity, by.x = "Activity", by.y = "V1")
rm("cran2")

# 2. Convert mergedData dataframe to tbl
cran3 <-tbl_df(mergedData)
rm("mergedData")
cran3 <- rename(cran3, ActivityName = V2)
# 3. Check the structures of the tbl
str(cran3)

# Appropriately labels the data set with descriptive variable names

# 1. Names of Feteatures will labelled using descriptive variable names
# - prefix t is replaced by time
# - Acc is replaced by Accelerometer
# - Gyro is replaced by Gyroscope
# - prefix f is replaced by frequency
# - Mag is replaced by Magnitude
# - BodyBody is replaced by Body

names(cran3) <- gsub("^t", "time", names(cran3))
names(cran3) <- gsub("^f", "frequency", names(cran3))
names(cran3) <- gsub("Acc", "Accelerometer", names(cran3))
names(cran3) <- gsub("Gyro", "Gyroscope", names(cran3))
names(cran3) <- gsub("Mag", "Magnitude", names(cran3))
names(cran3) <- gsub("BodyBody", "Body", names(cran3))

# 2. Check
names(cran3)

# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
cran4 <- aggregate(.~ Subjects + ActivityName, cran3, mean)
cran4 <- cran4[order(cran4$Subjects,cran4$ActivityName),]
head(cran4, 30)

# Data set as a txt file created with write.table() using row.name=FALSE
write.table(cran4, file = "./data/tidydata.txt",row.name=FALSE)
