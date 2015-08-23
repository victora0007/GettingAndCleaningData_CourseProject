# CodeBook

# Get the data
## 1. Set working directory


```r
pathwd <- "D:/Documentos/Training/Coursera/GettingandCleaningData/CourseProject"
old_wd <- getwd()
setwd(pathwd)
```

## 2. Download the file to the "data" folder and unzip the file


```r
if (!file.exists("./data/Dataset.zip")) {
        dir.create("./data")
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./data/Dataset.zip", mode = "wb")
        dateDownload <- date()
        unzip (zipfile = "./data/Dataset.zip", exdir = "./data")
}
```

# Read the data
## 1. Read the activity files


```r
training_act <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
test_act <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
```

## 2. Read the subject files


```r
training_sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
test_sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
```

## 3. Read the features files


```r
training_fea <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
test_fea <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
features <- read.table("./data/UCI HAR Dataset/features.txt", header = FALSE, colClasses = "character")
```

# Merges the training and the test sets to create one data set.
## 1. Merge the dataframes by rows


```r
dataFeatures <- rbind(training_fea, test_fea)
dataActivity <- rbind(training_act, test_act)
dataSubjects <- rbind(training_sub, test_sub)
```

## 2. Set column names to the dataframes


```r
names(dataFeatures) <- features$V2
names(dataActivity) <- "Activity"
names(dataSubjects) <- "Subjects"
```

## 3. Combine all dataframes to create the "dataFinal" dataframe


```r
dataFinal <- cbind(dataFeatures, dataSubjects, dataActivity)
```

## 4. Check the structures of the data frame


```r
str(dataFinal)
```

```
## 'data.frame':	10299 obs. of  563 variables:
##  $ tBodyAcc-mean()-X                   : num  0.289 0.278 0.28 0.279 0.277 ...
##  $ tBodyAcc-mean()-Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
##  $ tBodyAcc-mean()-Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
##  $ tBodyAcc-std()-X                    : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
##  $ tBodyAcc-std()-Y                    : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
##  $ tBodyAcc-std()-Z                    : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
##  $ tBodyAcc-mad()-X                    : num  -0.995 -0.999 -0.997 -0.997 -0.998 ...
##  $ tBodyAcc-mad()-Y                    : num  -0.983 -0.975 -0.964 -0.983 -0.98 ...
##  $ tBodyAcc-mad()-Z                    : num  -0.924 -0.958 -0.977 -0.989 -0.99 ...
##  $ tBodyAcc-max()-X                    : num  -0.935 -0.943 -0.939 -0.939 -0.942 ...
##  $ tBodyAcc-max()-Y                    : num  -0.567 -0.558 -0.558 -0.576 -0.569 ...
##  $ tBodyAcc-max()-Z                    : num  -0.744 -0.818 -0.818 -0.83 -0.825 ...
##  $ tBodyAcc-min()-X                    : num  0.853 0.849 0.844 0.844 0.849 ...
##  $ tBodyAcc-min()-Y                    : num  0.686 0.686 0.682 0.682 0.683 ...
##  $ tBodyAcc-min()-Z                    : num  0.814 0.823 0.839 0.838 0.838 ...
##  $ tBodyAcc-sma()                      : num  -0.966 -0.982 -0.983 -0.986 -0.993 ...
##  $ tBodyAcc-energy()-X                 : num  -1 -1 -1 -1 -1 ...
##  $ tBodyAcc-energy()-Y                 : num  -1 -1 -1 -1 -1 ...
##  $ tBodyAcc-energy()-Z                 : num  -0.995 -0.998 -0.999 -1 -1 ...
##  $ tBodyAcc-iqr()-X                    : num  -0.994 -0.999 -0.997 -0.997 -0.998 ...
##  $ tBodyAcc-iqr()-Y                    : num  -0.988 -0.978 -0.965 -0.984 -0.981 ...
##  $ tBodyAcc-iqr()-Z                    : num  -0.943 -0.948 -0.975 -0.986 -0.991 ...
##  $ tBodyAcc-entropy()-X                : num  -0.408 -0.715 -0.592 -0.627 -0.787 ...
##  $ tBodyAcc-entropy()-Y                : num  -0.679 -0.501 -0.486 -0.851 -0.559 ...
##  $ tBodyAcc-entropy()-Z                : num  -0.602 -0.571 -0.571 -0.912 -0.761 ...
##  $ tBodyAcc-arCoeff()-X,1              : num  0.9293 0.6116 0.273 0.0614 0.3133 ...
##  $ tBodyAcc-arCoeff()-X,2              : num  -0.853 -0.3295 -0.0863 0.0748 -0.1312 ...
##  $ tBodyAcc-arCoeff()-X,3              : num  0.36 0.284 0.337 0.198 0.191 ...
##  $ tBodyAcc-arCoeff()-X,4              : num  -0.0585 0.2846 -0.1647 -0.2643 0.0869 ...
##  $ tBodyAcc-arCoeff()-Y,1              : num  0.2569 0.1157 0.0172 0.0725 0.2576 ...
##  $ tBodyAcc-arCoeff()-Y,2              : num  -0.2248 -0.091 -0.0745 -0.1553 -0.2725 ...
##  $ tBodyAcc-arCoeff()-Y,3              : num  0.264 0.294 0.342 0.323 0.435 ...
##  $ tBodyAcc-arCoeff()-Y,4              : num  -0.0952 -0.2812 -0.3326 -0.1708 -0.3154 ...
##  $ tBodyAcc-arCoeff()-Z,1              : num  0.279 0.086 0.239 0.295 0.44 ...
##  $ tBodyAcc-arCoeff()-Z,2              : num  -0.4651 -0.0222 -0.1362 -0.3061 -0.2691 ...
##  $ tBodyAcc-arCoeff()-Z,3              : num  0.4919 -0.0167 0.1739 0.4821 0.1794 ...
##  $ tBodyAcc-arCoeff()-Z,4              : num  -0.191 -0.221 -0.299 -0.47 -0.089 ...
##  $ tBodyAcc-correlation()-X,Y          : num  0.3763 -0.0134 -0.1247 -0.3057 -0.1558 ...
##  $ tBodyAcc-correlation()-X,Z          : num  0.4351 -0.0727 -0.1811 -0.3627 -0.1898 ...
##  $ tBodyAcc-correlation()-Y,Z          : num  0.661 0.579 0.609 0.507 0.599 ...
##  $ tGravityAcc-mean()-X                : num  0.963 0.967 0.967 0.968 0.968 ...
##  $ tGravityAcc-mean()-Y                : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
##  $ tGravityAcc-mean()-Z                : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
##  $ tGravityAcc-std()-X                 : num  -0.985 -0.997 -1 -0.997 -0.998 ...
##  $ tGravityAcc-std()-Y                 : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...
##  $ tGravityAcc-std()-Z                 : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...
##  $ tGravityAcc-mad()-X                 : num  -0.985 -0.998 -1 -0.996 -0.998 ...
##  $ tGravityAcc-mad()-Y                 : num  -0.984 -0.99 -0.993 -0.981 -0.989 ...
##  $ tGravityAcc-mad()-Z                 : num  -0.895 -0.933 -0.993 -0.978 -0.979 ...
##  $ tGravityAcc-max()-X                 : num  0.892 0.892 0.892 0.894 0.894 ...
##  $ tGravityAcc-max()-Y                 : num  -0.161 -0.161 -0.164 -0.164 -0.167 ...
##  $ tGravityAcc-max()-Z                 : num  0.1247 0.1226 0.0946 0.0934 0.0917 ...
##  $ tGravityAcc-min()-X                 : num  0.977 0.985 0.987 0.987 0.987 ...
##  $ tGravityAcc-min()-Y                 : num  -0.123 -0.115 -0.115 -0.121 -0.122 ...
##  $ tGravityAcc-min()-Z                 : num  0.0565 0.1028 0.1028 0.0958 0.0941 ...
##  $ tGravityAcc-sma()                   : num  -0.375 -0.383 -0.402 -0.4 -0.4 ...
##  $ tGravityAcc-energy()-X              : num  0.899 0.908 0.909 0.911 0.912 ...
##  $ tGravityAcc-energy()-Y              : num  -0.971 -0.971 -0.97 -0.969 -0.967 ...
##  $ tGravityAcc-energy()-Z              : num  -0.976 -0.979 -0.982 -0.982 -0.984 ...
##  $ tGravityAcc-iqr()-X                 : num  -0.984 -0.999 -1 -0.996 -0.998 ...
##  $ tGravityAcc-iqr()-Y                 : num  -0.989 -0.99 -0.992 -0.981 -0.991 ...
##  $ tGravityAcc-iqr()-Z                 : num  -0.918 -0.942 -0.993 -0.98 -0.98 ...
##  $ tGravityAcc-entropy()-X             : num  -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 ...
##  $ tGravityAcc-entropy()-Y             : num  -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 ...
##  $ tGravityAcc-entropy()-Z             : num  0.114 -0.21 -0.927 -0.596 -0.617 ...
##  $ tGravityAcc-arCoeff()-X,1           : num  -0.59042 -0.41006 0.00223 -0.06493 -0.25727 ...
##  $ tGravityAcc-arCoeff()-X,2           : num  0.5911 0.4139 0.0275 0.0754 0.2689 ...
##  $ tGravityAcc-arCoeff()-X,3           : num  -0.5918 -0.4176 -0.0567 -0.0858 -0.2807 ...
##  $ tGravityAcc-arCoeff()-X,4           : num  0.5925 0.4213 0.0855 0.0962 0.2926 ...
##  $ tGravityAcc-arCoeff()-Y,1           : num  -0.745 -0.196 -0.329 -0.295 -0.167 ...
##  $ tGravityAcc-arCoeff()-Y,2           : num  0.7209 0.1253 0.2705 0.2283 0.0899 ...
##  $ tGravityAcc-arCoeff()-Y,3           : num  -0.7124 -0.1056 -0.2545 -0.2063 -0.0663 ...
##  $ tGravityAcc-arCoeff()-Y,4           : num  0.7113 0.1091 0.2576 0.2048 0.0671 ...
##  $ tGravityAcc-arCoeff()-Z,1           : num  -0.995 -0.834 -0.705 -0.385 -0.237 ...
##  $ tGravityAcc-arCoeff()-Z,2           : num  0.996 0.834 0.714 0.386 0.239 ...
##  $ tGravityAcc-arCoeff()-Z,3           : num  -0.996 -0.834 -0.723 -0.387 -0.241 ...
##  $ tGravityAcc-arCoeff()-Z,4           : num  0.992 0.83 0.729 0.385 0.241 ...
##  $ tGravityAcc-correlation()-X,Y       : num  0.57 -0.831 -0.181 -0.991 -0.408 ...
##  $ tGravityAcc-correlation()-X,Z       : num  0.439 -0.866 0.338 -0.969 -0.185 ...
##  $ tGravityAcc-correlation()-Y,Z       : num  0.987 0.974 0.643 0.984 0.965 ...
##  $ tBodyAccJerk-mean()-X               : num  0.078 0.074 0.0736 0.0773 0.0734 ...
##  $ tBodyAccJerk-mean()-Y               : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
##  $ tBodyAccJerk-mean()-Z               : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
##  $ tBodyAccJerk-std()-X                : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
##  $ tBodyAccJerk-std()-Y                : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
##  $ tBodyAccJerk-std()-Z                : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
##  $ tBodyAccJerk-mad()-X                : num  -0.994 -0.996 -0.991 -0.994 -0.997 ...
##  $ tBodyAccJerk-mad()-Y                : num  -0.986 -0.979 -0.979 -0.986 -0.987 ...
##  $ tBodyAccJerk-mad()-Z                : num  -0.993 -0.991 -0.987 -0.991 -0.991 ...
##  $ tBodyAccJerk-max()-X                : num  -0.985 -0.995 -0.987 -0.987 -0.997 ...
##  $ tBodyAccJerk-max()-Y                : num  -0.992 -0.979 -0.979 -0.992 -0.992 ...
##  $ tBodyAccJerk-max()-Z                : num  -0.993 -0.992 -0.992 -0.99 -0.99 ...
##  $ tBodyAccJerk-min()-X                : num  0.99 0.993 0.988 0.988 0.994 ...
##  $ tBodyAccJerk-min()-Y                : num  0.992 0.992 0.992 0.993 0.993 ...
##  $ tBodyAccJerk-min()-Z                : num  0.991 0.989 0.989 0.993 0.986 ...
##  $ tBodyAccJerk-sma()                  : num  -0.994 -0.991 -0.988 -0.993 -0.994 ...
##  $ tBodyAccJerk-energy()-X             : num  -1 -1 -1 -1 -1 ...
##  $ tBodyAccJerk-energy()-Y             : num  -1 -1 -1 -1 -1 ...
##  $ tBodyAccJerk-energy()-Z             : num  -1 -1 -1 -1 -1 ...
##   [list output truncated]
```

# Extracts only the measurements on the mean and standard deviation for each measurement
## 1. Use dplyr package to convert the dataframe to a tbl


```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
cran <- tbl_df(dataFinal)
rm("dataFinal")
valid_column_names <- make.names(names = names(cran), unique = TRUE, allow_ = TRUE)
names(cran) <- valid_column_names
```

## 2. Select only the columns that contains "mean" or "std" for each measurement


```r
cran2 <- select(cran, contains("mean"), contains("std"), Subjects, Activity)
rm("cran")
```

## 3. Check the structures of the tbl


```r
str(cran2)
```

```
## Classes 'tbl_df', 'tbl' and 'data.frame':	10299 obs. of  88 variables:
##  $ tBodyAcc.mean...X                   : num  0.289 0.278 0.28 0.279 0.277 ...
##  $ tBodyAcc.mean...Y                   : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
##  $ tBodyAcc.mean...Z                   : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
##  $ tGravityAcc.mean...X                : num  0.963 0.967 0.967 0.968 0.968 ...
##  $ tGravityAcc.mean...Y                : num  -0.141 -0.142 -0.142 -0.144 -0.149 ...
##  $ tGravityAcc.mean...Z                : num  0.1154 0.1094 0.1019 0.0999 0.0945 ...
##  $ tBodyAccJerk.mean...X               : num  0.078 0.074 0.0736 0.0773 0.0734 ...
##  $ tBodyAccJerk.mean...Y               : num  0.005 0.00577 0.0031 0.02006 0.01912 ...
##  $ tBodyAccJerk.mean...Z               : num  -0.06783 0.02938 -0.00905 -0.00986 0.01678 ...
##  $ tBodyGyro.mean...X                  : num  -0.0061 -0.0161 -0.0317 -0.0434 -0.034 ...
##  $ tBodyGyro.mean...Y                  : num  -0.0314 -0.0839 -0.1023 -0.0914 -0.0747 ...
##  $ tBodyGyro.mean...Z                  : num  0.1077 0.1006 0.0961 0.0855 0.0774 ...
##  $ tBodyGyroJerk.mean...X              : num  -0.0992 -0.1105 -0.1085 -0.0912 -0.0908 ...
##  $ tBodyGyroJerk.mean...Y              : num  -0.0555 -0.0448 -0.0424 -0.0363 -0.0376 ...
##  $ tBodyGyroJerk.mean...Z              : num  -0.062 -0.0592 -0.0558 -0.0605 -0.0583 ...
##  $ tBodyAccMag.mean..                  : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
##  $ tGravityAccMag.mean..               : num  -0.959 -0.979 -0.984 -0.987 -0.993 ...
##  $ tBodyAccJerkMag.mean..              : num  -0.993 -0.991 -0.989 -0.993 -0.993 ...
##  $ tBodyGyroMag.mean..                 : num  -0.969 -0.981 -0.976 -0.982 -0.985 ...
##  $ tBodyGyroJerkMag.mean..             : num  -0.994 -0.995 -0.993 -0.996 -0.996 ...
##  $ fBodyAcc.mean...X                   : num  -0.995 -0.997 -0.994 -0.995 -0.997 ...
##  $ fBodyAcc.mean...Y                   : num  -0.983 -0.977 -0.973 -0.984 -0.982 ...
##  $ fBodyAcc.mean...Z                   : num  -0.939 -0.974 -0.983 -0.991 -0.988 ...
##  $ fBodyAcc.meanFreq...X               : num  0.252 0.271 0.125 0.029 0.181 ...
##  $ fBodyAcc.meanFreq...Y               : num  0.1318 0.0429 -0.0646 0.0803 0.058 ...
##  $ fBodyAcc.meanFreq...Z               : num  -0.0521 -0.0143 0.0827 0.1857 0.5598 ...
##  $ fBodyAccJerk.mean...X               : num  -0.992 -0.995 -0.991 -0.994 -0.996 ...
##  $ fBodyAccJerk.mean...Y               : num  -0.987 -0.981 -0.982 -0.989 -0.989 ...
##  $ fBodyAccJerk.mean...Z               : num  -0.99 -0.99 -0.988 -0.991 -0.991 ...
##  $ fBodyAccJerk.meanFreq...X           : num  0.8704 0.6085 0.1154 0.0358 0.2734 ...
##  $ fBodyAccJerk.meanFreq...Y           : num  0.2107 -0.0537 -0.1934 -0.093 0.0791 ...
##  $ fBodyAccJerk.meanFreq...Z           : num  0.2637 0.0631 0.0383 0.1681 0.2924 ...
##  $ fBodyGyro.mean...X                  : num  -0.987 -0.977 -0.975 -0.987 -0.982 ...
##  $ fBodyGyro.mean...Y                  : num  -0.982 -0.993 -0.994 -0.994 -0.993 ...
##  $ fBodyGyro.mean...Z                  : num  -0.99 -0.99 -0.987 -0.987 -0.989 ...
##  $ fBodyGyro.meanFreq...X              : num  -0.2575 -0.0482 -0.2167 0.2169 -0.1533 ...
##  $ fBodyGyro.meanFreq...Y              : num  0.0979 -0.4016 -0.0173 -0.1352 -0.0884 ...
##  $ fBodyGyro.meanFreq...Z              : num  0.5472 -0.0682 -0.1107 -0.0497 -0.1622 ...
##  $ fBodyAccMag.mean..                  : num  -0.952 -0.981 -0.988 -0.988 -0.994 ...
##  $ fBodyAccMag.meanFreq..              : num  -0.0884 -0.0441 0.2579 0.0736 0.3943 ...
##  $ fBodyBodyAccJerkMag.mean..          : num  -0.994 -0.99 -0.989 -0.993 -0.996 ...
##  $ fBodyBodyAccJerkMag.meanFreq..      : num  0.347 0.532 0.661 0.679 0.559 ...
##  $ fBodyBodyGyroMag.mean..             : num  -0.98 -0.988 -0.989 -0.989 -0.991 ...
##  $ fBodyBodyGyroMag.meanFreq..         : num  -0.129 -0.272 -0.2127 -0.0357 -0.2736 ...
##  $ fBodyBodyGyroJerkMag.mean..         : num  -0.992 -0.996 -0.995 -0.995 -0.995 ...
##  $ fBodyBodyGyroJerkMag.meanFreq..     : num  -0.0743 0.1581 0.4145 0.4046 0.0878 ...
##  $ angle.tBodyAccMean.gravity.         : num  -0.1128 0.0535 -0.1186 -0.0368 0.1233 ...
##  $ angle.tBodyAccJerkMean..gravityMean.: num  0.0304 -0.00743 0.1779 -0.01289 0.12254 ...
##  $ angle.tBodyGyroMean.gravityMean.    : num  -0.465 -0.733 0.101 0.64 0.694 ...
##  $ angle.tBodyGyroJerkMean.gravityMean.: num  -0.0184 0.7035 0.8085 -0.4854 -0.616 ...
##  $ angle.X.gravityMean.                : num  -0.841 -0.845 -0.849 -0.849 -0.848 ...
##  $ angle.Y.gravityMean.                : num  0.18 0.18 0.181 0.182 0.185 ...
##  $ angle.Z.gravityMean.                : num  -0.0586 -0.0543 -0.0491 -0.0477 -0.0439 ...
##  $ tBodyAcc.std...X                    : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
##  $ tBodyAcc.std...Y                    : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
##  $ tBodyAcc.std...Z                    : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
##  $ tGravityAcc.std...X                 : num  -0.985 -0.997 -1 -0.997 -0.998 ...
##  $ tGravityAcc.std...Y                 : num  -0.982 -0.989 -0.993 -0.981 -0.988 ...
##  $ tGravityAcc.std...Z                 : num  -0.878 -0.932 -0.993 -0.978 -0.979 ...
##  $ tBodyAccJerk.std...X                : num  -0.994 -0.996 -0.991 -0.993 -0.996 ...
##  $ tBodyAccJerk.std...Y                : num  -0.988 -0.981 -0.981 -0.988 -0.988 ...
##  $ tBodyAccJerk.std...Z                : num  -0.994 -0.992 -0.99 -0.993 -0.992 ...
##  $ tBodyGyro.std...X                   : num  -0.985 -0.983 -0.976 -0.991 -0.985 ...
##  $ tBodyGyro.std...Y                   : num  -0.977 -0.989 -0.994 -0.992 -0.992 ...
##  $ tBodyGyro.std...Z                   : num  -0.992 -0.989 -0.986 -0.988 -0.987 ...
##  $ tBodyGyroJerk.std...X               : num  -0.992 -0.99 -0.988 -0.991 -0.991 ...
##  $ tBodyGyroJerk.std...Y               : num  -0.993 -0.997 -0.996 -0.997 -0.996 ...
##  $ tBodyGyroJerk.std...Z               : num  -0.992 -0.994 -0.992 -0.993 -0.995 ...
##  $ tBodyAccMag.std..                   : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
##  $ tGravityAccMag.std..                : num  -0.951 -0.976 -0.988 -0.986 -0.991 ...
##  $ tBodyAccJerkMag.std..               : num  -0.994 -0.992 -0.99 -0.993 -0.996 ...
##  $ tBodyGyroMag.std..                  : num  -0.964 -0.984 -0.986 -0.987 -0.989 ...
##  $ tBodyGyroJerkMag.std..              : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
##  $ fBodyAcc.std...X                    : num  -0.995 -0.999 -0.996 -0.996 -0.999 ...
##  $ fBodyAcc.std...Y                    : num  -0.983 -0.975 -0.966 -0.983 -0.98 ...
##  $ fBodyAcc.std...Z                    : num  -0.906 -0.955 -0.977 -0.99 -0.992 ...
##  $ fBodyAccJerk.std...X                : num  -0.996 -0.997 -0.991 -0.991 -0.997 ...
##  $ fBodyAccJerk.std...Y                : num  -0.991 -0.982 -0.981 -0.987 -0.989 ...
##  $ fBodyAccJerk.std...Z                : num  -0.997 -0.993 -0.99 -0.994 -0.993 ...
##  $ fBodyGyro.std...X                   : num  -0.985 -0.985 -0.977 -0.993 -0.986 ...
##  $ fBodyGyro.std...Y                   : num  -0.974 -0.987 -0.993 -0.992 -0.992 ...
##  $ fBodyGyro.std...Z                   : num  -0.994 -0.99 -0.987 -0.989 -0.988 ...
##  $ fBodyAccMag.std..                   : num  -0.956 -0.976 -0.989 -0.987 -0.99 ...
##  $ fBodyBodyAccJerkMag.std..           : num  -0.994 -0.992 -0.991 -0.992 -0.994 ...
##  $ fBodyBodyGyroMag.std..              : num  -0.961 -0.983 -0.986 -0.988 -0.989 ...
##  $ fBodyBodyGyroJerkMag.std..          : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
##  $ Subjects                            : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ Activity                            : int  5 5 5 5 5 5 5 5 5 5 ...
```

# Uses descriptive activity names to name the activities in the data set
## 1. Merges data frames


```r
mergedData <- merge(cran2, activity, by.x = "Activity", by.y = "V1")
rm("cran2")
```

## 2. Convert mergedData dataframe to tbl


```r
cran3 <-tbl_df(mergedData)
rm("mergedData")
cran3 <- rename(cran3, ActivityName = V2)
```

## 3. Check the structures of the tbl


```r
str(cran3)
```

```
## Classes 'tbl_df', 'tbl' and 'data.frame':	10299 obs. of  89 variables:
##  $ Activity                            : int  1 1 1 1 1 1 1 1 1 1 ...
##  $ tBodyAcc.mean...X                   : num  0.302 0.343 0.27 0.268 0.314 ...
##  $ tBodyAcc.mean...Y                   : num  -0.02688 -0.00343 0.01091 -0.01273 -0.0087 ...
##  $ tBodyAcc.mean...Z                   : num  -0.0958 -0.1015 -0.0749 -0.0937 -0.1246 ...
##  $ tGravityAcc.mean...X                : num  0.902 0.965 0.96 0.944 0.892 ...
##  $ tGravityAcc.mean...Y                : num  -0.137 -0.145 -0.214 -0.159 -0.147 ...
##  $ tGravityAcc.mean...Z                : num  -0.3428 0.0285 0.0505 -0.1425 -0.3414 ...
##  $ tBodyAccJerk.mean...X               : num  0.1505 -0.1351 0.1262 -0.0358 -0.2256 ...
##  $ tBodyAccJerk.mean...Y               : num  -0.2391 -0.0637 0.2083 -0.0136 -0.0699 ...
##  $ tBodyAccJerk.mean...Z               : num  -0.1533 -0.2631 0.0773 0.2511 -0.0937 ...
##  $ tBodyGyro.mean...X                  : num  0.2139 -0.0277 -0.0484 -0.0117 0.0334 ...
##  $ tBodyGyro.mean...Y                  : num  -0.049 -0.1253 -0.1036 -0.0135 -0.0969 ...
##  $ tBodyGyro.mean...Z                  : num  -0.24527 0.12289 0.08692 0.15683 -0.00968 ...
##  $ tBodyGyroJerk.mean...X              : num  -0.0634 0.0756 0.047 -0.1203 -0.203 ...
##  $ tBodyGyroJerk.mean...Y              : num  0.03158 -0.05686 -0.09651 -0.00423 -0.16378 ...
##  $ tBodyGyroJerk.mean...Z              : num  -0.0112 0.14377 0.00215 -0.18785 0.05743 ...
##  $ tBodyAccMag.mean..                  : num  -0.0919 -0.0604 -0.1786 -0.1654 -0.0508 ...
##  $ tGravityAccMag.mean..               : num  -0.0919 -0.0604 -0.1786 -0.1654 -0.0508 ...
##  $ tBodyAccJerkMag.mean..              : num  -0.221 -0.177 -0.154 -0.165 -0.167 ...
##  $ tBodyGyroMag.mean..                 : num  -0.2319 -0.2911 -0.2321 -0.0934 -0.3111 ...
##  $ tBodyGyroJerkMag.mean..             : num  -0.3526 -0.3462 -0.1846 -0.0862 -0.3425 ...
##  $ fBodyAcc.mean...X                   : num  -0.426 -0.18 -0.229 -0.337 -0.377 ...
##  $ fBodyAcc.mean...Y                   : num  -0.0972 0.0852 0.1118 -0.1718 -0.1915 ...
##  $ fBodyAcc.mean...Z                   : num  0.1846 -0.3 -0.4013 0.0634 0.1929 ...
##  $ fBodyAcc.meanFreq...X               : num  -0.474 -0.348 -0.247 -0.324 -0.249 ...
##  $ fBodyAcc.meanFreq...Y               : num  0.2648 -0.1593 -0.0343 -0.0378 0.1274 ...
##  $ fBodyAcc.meanFreq...Z               : num  0.10475 0.2059 0.33348 0.11459 -0.00943 ...
##  $ fBodyAccJerk.mean...X               : num  -0.49 -0.2 -0.174 -0.353 -0.466 ...
##  $ fBodyAccJerk.mean...Y               : num  -0.189 -0.1399 -0.0781 -0.2802 -0.2017 ...
##  $ fBodyAccJerk.mean...Z               : num  0.0147 -0.39925 -0.41452 -0.06667 0.00383 ...
##  $ fBodyAccJerk.meanFreq...X           : num  -0.325 -0.235 -0.283 -0.28 -0.426 ...
##  $ fBodyAccJerk.meanFreq...Y           : num  -0.263 -0.681 -0.593 -0.467 -0.171 ...
##  $ fBodyAccJerk.meanFreq...Z           : num  -0.25797 -0.25201 -0.00807 -0.45074 -0.32644 ...
##  $ fBodyGyro.mean...X                  : num  -0.321 -0.311 -0.164 -0.368 -0.347 ...
##  $ fBodyGyro.mean...Y                  : num  -0.201 -0.414 -0.185 0.127 -0.248 ...
##  $ fBodyGyro.mean...Z                  : num  -0.4485 -0.157 -0.0698 -0.2908 -0.4522 ...
##  $ fBodyGyro.meanFreq...X              : num  0.044 0.0085 0.0896 -0.2157 0.134 ...
##  $ fBodyGyro.meanFreq...Y              : num  0.105 0.0201 0.0239 0.0392 0.0229 ...
##  $ fBodyGyro.meanFreq...Z              : num  -0.2098 0.2922 0.2877 -0.0887 -0.1607 ...
##  $ fBodyAccMag.mean..                  : num  -0.224 -0.196 -0.213 -0.135 -0.168 ...
##  $ fBodyAccMag.meanFreq..              : num  0.199 0.21 0.246 0.289 0.222 ...
##  $ fBodyBodyAccJerkMag.mean..          : num  -0.1081 -0.1625 -0.0958 -0.0753 -0.081 ...
##  $ fBodyBodyAccJerkMag.meanFreq..      : num  0.03543 -0.00273 0.02406 0.05082 0.156 ...
##  $ fBodyBodyGyroMag.mean..             : num  -0.356 -0.414 -0.149 0.202 -0.255 ...
##  $ fBodyBodyGyroMag.meanFreq..         : num  0.1883 0.3676 0.2685 0.4571 0.0931 ...
##  $ fBodyBodyGyroJerkMag.mean..         : num  -0.2935 -0.5085 -0.2354 0.0615 -0.2945 ...
##  $ fBodyBodyGyroJerkMag.meanFreq..     : num  -0.112 0.2 0.215 0.293 -0.151 ...
##  $ angle.tBodyAccMean.gravity.         : num  -0.308 -0.603 0.143 0.349 -0.596 ...
##  $ angle.tBodyAccJerkMean..gravityMean.: num  -0.39 0.575 -0.107 0.493 0.631 ...
##  $ angle.tBodyGyroMean.gravityMean.    : num  -0.8442 -0.0722 0.5272 -0.1133 -0.8412 ...
##  $ angle.tBodyGyroJerkMean.gravityMean.: num  -0.123 -0.629 -0.847 0.1 0.412 ...
##  $ angle.X.gravityMean.                : num  -0.641 -0.875 -0.805 -0.801 -0.637 ...
##  $ angle.Y.gravityMean.                : num  0.176 0.183 0.23 0.193 0.184 ...
##  $ angle.Z.gravityMean.                : num  0.26263 0.00186 -0.0133 0.12184 0.263 ...
##  $ tBodyAcc.std...X                    : num  -0.38 -0.201 -0.337 -0.384 -0.356 ...
##  $ tBodyAcc.std...Y                    : num  -0.191 0.133 0.146 -0.204 -0.166 ...
##  $ tBodyAcc.std...Z                    : num  0.341 -0.318 -0.446 0.148 0.407 ...
##  $ tGravityAcc.std...X                 : num  -0.953 -0.984 -0.965 -0.981 -0.98 ...
##  $ tGravityAcc.std...Y                 : num  -0.937 -0.953 -0.939 -0.973 -0.961 ...
##  $ tGravityAcc.std...Z                 : num  -0.921 -0.99 -0.946 -0.966 -0.941 ...
##  $ tBodyAccJerk.std...X                : num  -0.472 -0.197 -0.159 -0.333 -0.453 ...
##  $ tBodyAccJerk.std...Y                : num  -0.1607 -0.0446 0.0551 -0.2088 -0.1215 ...
##  $ tBodyAccJerk.std...Z                : num  -0.06331 -0.44016 -0.47746 -0.05011 -0.00443 ...
##  $ tBodyGyro.std...X                   : num  -0.512 -0.448 -0.407 -0.501 -0.536 ...
##  $ tBodyGyro.std...Y                   : num  -0.254 -0.394 -0.208 0.178 -0.239 ...
##  $ tBodyGyro.std...Z                   : num  -0.404 -0.311 -0.288 -0.305 -0.362 ...
##  $ tBodyGyroJerk.std...X               : num  -0.228 -0.3 -0.148 -0.411 -0.235 ...
##  $ tBodyGyroJerk.std...Y               : num  -0.293 -0.454 -0.211 0.173 -0.279 ...
##  $ tBodyGyroJerk.std...Z               : num  -0.56075 -0.09672 -0.00331 -0.44637 -0.55917 ...
##  $ tBodyAccMag.std..                   : num  -0.219 -0.318 -0.331 -0.25 -0.193 ...
##  $ tGravityAccMag.std..                : num  -0.219 -0.318 -0.331 -0.25 -0.193 ...
##  $ tBodyAccJerkMag.std..               : num  -0.0879 -0.1895 -0.1146 -0.0714 -0.0674 ...
##  $ tBodyGyroMag.std..                  : num  -0.359 -0.457 -0.169 0.095 -0.26 ...
##  $ tBodyGyroJerkMag.std..              : num  -0.26 -0.432 -0.175 0.135 -0.255 ...
##  $ fBodyAcc.std...X                    : num  -0.363 -0.21 -0.384 -0.403 -0.347 ...
##  $ fBodyAcc.std...Y                    : num  -0.2983 0.0866 0.0919 -0.272 -0.2047 ...
##  $ fBodyAcc.std...Z                    : num  0.319 -0.385 -0.52 0.104 0.41 ...
##  $ fBodyAccJerk.std...X                : num  -0.5 -0.269 -0.219 -0.372 -0.489 ...
##  $ fBodyAccJerk.std...Y                : num  -0.18651 -0.00372 0.12855 -0.18274 -0.09159 ...
##  $ fBodyAccJerk.std...Z                : num  -0.1381 -0.4783 -0.5398 -0.0346 -0.011 ...
##  $ fBodyGyro.std...X                   : num  -0.574 -0.491 -0.487 -0.544 -0.598 ...
##  $ fBodyGyro.std...Y                   : num  -0.294 -0.387 -0.229 0.201 -0.239 ...
##  $ fBodyGyro.std...Z                   : num  -0.445 -0.433 -0.441 -0.373 -0.393 ...
##  $ fBodyAccMag.std..                   : num  -0.338 -0.505 -0.512 -0.44 -0.333 ...
##  $ fBodyBodyAccJerkMag.std..           : num  -0.0685 -0.2309 -0.139 -0.0728 -0.0562 ...
##  $ fBodyBodyGyroMag.std..              : num  -0.474 -0.589 -0.331 -0.192 -0.394 ...
##  $ fBodyBodyGyroJerkMag.std..          : num  -0.269 -0.382 -0.158 0.149 -0.256 ...
##  $ Subjects                            : int  7 5 6 23 7 7 11 6 10 11 ...
##  $ ActivityName                        : Factor w/ 6 levels "LAYING","SITTING",..: 4 4 4 4 4 4 4 4 4 4 ...
```

# Appropriately labels the data set with descriptive variable names

## 1. Names of Feteatures will labelled using descriptive variable names
 - prefix t is replaced by time
 - Acc is replaced by Accelerometer
 - Gyro is replaced by Gyroscope
 - prefix f is replaced by frequency
 - Mag is replaced by Magnitude
 - BodyBody is replaced by Body


```r
names(cran3) <- gsub("^t", "time", names(cran3))
names(cran3) <- gsub("^f", "frequency", names(cran3))
names(cran3) <- gsub("Acc", "Accelerometer", names(cran3))
names(cran3) <- gsub("Gyro", "Gyroscope", names(cran3))
names(cran3) <- gsub("Mag", "Magnitude", names(cran3))
names(cran3) <- gsub("BodyBody", "Body", names(cran3))
```

## 2. Check


```r
names(cran3)
```

```
##  [1] "Activity"                                          
##  [2] "timeBodyAccelerometer.mean...X"                    
##  [3] "timeBodyAccelerometer.mean...Y"                    
##  [4] "timeBodyAccelerometer.mean...Z"                    
##  [5] "timeGravityAccelerometer.mean...X"                 
##  [6] "timeGravityAccelerometer.mean...Y"                 
##  [7] "timeGravityAccelerometer.mean...Z"                 
##  [8] "timeBodyAccelerometerJerk.mean...X"                
##  [9] "timeBodyAccelerometerJerk.mean...Y"                
## [10] "timeBodyAccelerometerJerk.mean...Z"                
## [11] "timeBodyGyroscope.mean...X"                        
## [12] "timeBodyGyroscope.mean...Y"                        
## [13] "timeBodyGyroscope.mean...Z"                        
## [14] "timeBodyGyroscopeJerk.mean...X"                    
## [15] "timeBodyGyroscopeJerk.mean...Y"                    
## [16] "timeBodyGyroscopeJerk.mean...Z"                    
## [17] "timeBodyAccelerometerMagnitude.mean.."             
## [18] "timeGravityAccelerometerMagnitude.mean.."          
## [19] "timeBodyAccelerometerJerkMagnitude.mean.."         
## [20] "timeBodyGyroscopeMagnitude.mean.."                 
## [21] "timeBodyGyroscopeJerkMagnitude.mean.."             
## [22] "frequencyBodyAccelerometer.mean...X"               
## [23] "frequencyBodyAccelerometer.mean...Y"               
## [24] "frequencyBodyAccelerometer.mean...Z"               
## [25] "frequencyBodyAccelerometer.meanFreq...X"           
## [26] "frequencyBodyAccelerometer.meanFreq...Y"           
## [27] "frequencyBodyAccelerometer.meanFreq...Z"           
## [28] "frequencyBodyAccelerometerJerk.mean...X"           
## [29] "frequencyBodyAccelerometerJerk.mean...Y"           
## [30] "frequencyBodyAccelerometerJerk.mean...Z"           
## [31] "frequencyBodyAccelerometerJerk.meanFreq...X"       
## [32] "frequencyBodyAccelerometerJerk.meanFreq...Y"       
## [33] "frequencyBodyAccelerometerJerk.meanFreq...Z"       
## [34] "frequencyBodyGyroscope.mean...X"                   
## [35] "frequencyBodyGyroscope.mean...Y"                   
## [36] "frequencyBodyGyroscope.mean...Z"                   
## [37] "frequencyBodyGyroscope.meanFreq...X"               
## [38] "frequencyBodyGyroscope.meanFreq...Y"               
## [39] "frequencyBodyGyroscope.meanFreq...Z"               
## [40] "frequencyBodyAccelerometerMagnitude.mean.."        
## [41] "frequencyBodyAccelerometerMagnitude.meanFreq.."    
## [42] "frequencyBodyAccelerometerJerkMagnitude.mean.."    
## [43] "frequencyBodyAccelerometerJerkMagnitude.meanFreq.."
## [44] "frequencyBodyGyroscopeMagnitude.mean.."            
## [45] "frequencyBodyGyroscopeMagnitude.meanFreq.."        
## [46] "frequencyBodyGyroscopeJerkMagnitude.mean.."        
## [47] "frequencyBodyGyroscopeJerkMagnitude.meanFreq.."    
## [48] "angle.tBodyAccelerometerMean.gravity."             
## [49] "angle.tBodyAccelerometerJerkMean..gravityMean."    
## [50] "angle.tBodyGyroscopeMean.gravityMean."             
## [51] "angle.tBodyGyroscopeJerkMean.gravityMean."         
## [52] "angle.X.gravityMean."                              
## [53] "angle.Y.gravityMean."                              
## [54] "angle.Z.gravityMean."                              
## [55] "timeBodyAccelerometer.std...X"                     
## [56] "timeBodyAccelerometer.std...Y"                     
## [57] "timeBodyAccelerometer.std...Z"                     
## [58] "timeGravityAccelerometer.std...X"                  
## [59] "timeGravityAccelerometer.std...Y"                  
## [60] "timeGravityAccelerometer.std...Z"                  
## [61] "timeBodyAccelerometerJerk.std...X"                 
## [62] "timeBodyAccelerometerJerk.std...Y"                 
## [63] "timeBodyAccelerometerJerk.std...Z"                 
## [64] "timeBodyGyroscope.std...X"                         
## [65] "timeBodyGyroscope.std...Y"                         
## [66] "timeBodyGyroscope.std...Z"                         
## [67] "timeBodyGyroscopeJerk.std...X"                     
## [68] "timeBodyGyroscopeJerk.std...Y"                     
## [69] "timeBodyGyroscopeJerk.std...Z"                     
## [70] "timeBodyAccelerometerMagnitude.std.."              
## [71] "timeGravityAccelerometerMagnitude.std.."           
## [72] "timeBodyAccelerometerJerkMagnitude.std.."          
## [73] "timeBodyGyroscopeMagnitude.std.."                  
## [74] "timeBodyGyroscopeJerkMagnitude.std.."              
## [75] "frequencyBodyAccelerometer.std...X"                
## [76] "frequencyBodyAccelerometer.std...Y"                
## [77] "frequencyBodyAccelerometer.std...Z"                
## [78] "frequencyBodyAccelerometerJerk.std...X"            
## [79] "frequencyBodyAccelerometerJerk.std...Y"            
## [80] "frequencyBodyAccelerometerJerk.std...Z"            
## [81] "frequencyBodyGyroscope.std...X"                    
## [82] "frequencyBodyGyroscope.std...Y"                    
## [83] "frequencyBodyGyroscope.std...Z"                    
## [84] "frequencyBodyAccelerometerMagnitude.std.."         
## [85] "frequencyBodyAccelerometerJerkMagnitude.std.."     
## [86] "frequencyBodyGyroscopeMagnitude.std.."             
## [87] "frequencyBodyGyroscopeJerkMagnitude.std.."         
## [88] "Subjects"                                          
## [89] "ActivityName"
```

## 3. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


```r
cran4 <- aggregate(.~ Subjects + ActivityName, cran3, mean)
cran4 <- cran4[order(cran4$Subjects,cran4$ActivityName),]
head(cran4, 10)
```

```
##     Subjects       ActivityName Activity timeBodyAccelerometer.mean...X
## 1          1             LAYING        6                      0.2215982
## 31         1            SITTING        4                      0.2612376
## 61         1           STANDING        5                      0.2789176
## 91         1            WALKING        1                      0.2773308
## 121        1 WALKING_DOWNSTAIRS        3                      0.2891883
## 151        1   WALKING_UPSTAIRS        2                      0.2554617
## 2          2             LAYING        6                      0.2813734
## 32         2            SITTING        4                      0.2770874
## 62         2           STANDING        5                      0.2779115
## 92         2            WALKING        1                      0.2764266
##     timeBodyAccelerometer.mean...Y timeBodyAccelerometer.mean...Z
## 1                     -0.040513953                     -0.1132036
## 31                    -0.001308288                     -0.1045442
## 61                    -0.016137590                     -0.1106018
## 91                    -0.017383819                     -0.1111481
## 121                   -0.009918505                     -0.1075662
## 151                   -0.023953149                     -0.0973020
## 2                     -0.018158740                     -0.1072456
## 32                    -0.015687994                     -0.1092183
## 62                    -0.018420827                     -0.1059085
## 92                    -0.018594920                     -0.1055004
##     timeGravityAccelerometer.mean...X timeGravityAccelerometer.mean...Y
## 1                          -0.2488818                         0.7055498
## 31                          0.8315099                         0.2044116
## 61                          0.9429520                        -0.2729838
## 91                          0.9352232                        -0.2821650
## 121                         0.9318744                        -0.2666103
## 151                         0.8933511                        -0.3621534
## 2                          -0.5097542                         0.7525366
## 32                          0.9404773                        -0.1056300
## 62                          0.8969286                        -0.3700627
## 92                          0.9130173                        -0.3466071
##     timeGravityAccelerometer.mean...Z timeBodyAccelerometerJerk.mean...X
## 1                          0.44581772                         0.08108653
## 31                         0.33204370                         0.07748252
## 61                         0.01349058                         0.07537665
## 91                        -0.06810286                         0.07404163
## 121                       -0.06211996                         0.05415532
## 151                       -0.07540294                         0.10137273
## 2                          0.64683488                         0.08259725
## 32                         0.19872677                         0.07225644
## 62                         0.12974716                         0.07475886
## 92                         0.08472709                         0.06180807
##     timeBodyAccelerometerJerk.mean...Y timeBodyAccelerometerJerk.mean...Z
## 1                         0.0038382040                        0.010834236
## 31                       -0.0006191028                       -0.003367792
## 61                        0.0079757309                       -0.003685250
## 91                        0.0282721096                       -0.004168406
## 121                       0.0296504490                       -0.010971973
## 151                       0.0194863076                       -0.045562545
## 2                         0.0122547885                       -0.001802649
## 32                        0.0116954511                        0.007605469
## 62                        0.0103291775                       -0.008371588
## 92                        0.0182492679                        0.007895337
##     timeBodyGyroscope.mean...X timeBodyGyroscope.mean...Y
## 1                  -0.01655309                -0.06448612
## 31                 -0.04535006                -0.09192415
## 61                 -0.02398773                -0.05939722
## 91                 -0.04183096                -0.06953005
## 121                -0.03507819                -0.09093713
## 151                 0.05054938                -0.16617002
## 2                  -0.01847661                -0.11180082
## 32                 -0.04547066                -0.05992868
## 62                 -0.02386239                -0.08203966
## 92                 -0.05302582                -0.04823823
##     timeBodyGyroscope.mean...Z timeBodyGyroscopeJerk.mean...X
## 1                   0.14868944                    -0.10727095
## 31                  0.06293138                    -0.09367938
## 61                  0.07480075                    -0.09960921
## 91                  0.08494482                    -0.08999754
## 121                 0.09008501                    -0.07395920
## 151                 0.05835955                    -0.12223277
## 2                   0.14488285                    -0.10197413
## 32                  0.04122775                    -0.09363284
## 62                  0.08783517                    -0.10556216
## 92                  0.08283366                    -0.08188334
##     timeBodyGyroscopeJerk.mean...Y timeBodyGyroscopeJerk.mean...Z
## 1                      -0.04151729                    -0.07405012
## 31                     -0.04021181                    -0.04670263
## 61                     -0.04406279                    -0.04895055
## 91                     -0.03984287                    -0.04613093
## 121                    -0.04399028                    -0.02704611
## 151                    -0.04214859                    -0.04071255
## 2                      -0.03585902                    -0.07017830
## 32                     -0.04156020                    -0.04358510
## 62                     -0.04224195                    -0.05465395
## 92                     -0.05382994                    -0.05149392
##     timeBodyAccelerometerMagnitude.mean..
## 1                             -0.84192915
## 31                            -0.94853679
## 61                            -0.98427821
## 91                            -0.13697118
## 121                            0.02718829
## 151                           -0.12992763
## 2                             -0.97743549
## 32                            -0.96789362
## 62                            -0.96587518
## 92                            -0.29040759
##     timeGravityAccelerometerMagnitude.mean..
## 1                                -0.84192915
## 31                               -0.94853679
## 61                               -0.98427821
## 91                               -0.13697118
## 121                               0.02718829
## 151                              -0.12992763
## 2                                -0.97743549
## 32                               -0.96789362
## 62                               -0.96587518
## 92                               -0.29040759
##     timeBodyAccelerometerJerkMagnitude.mean..
## 1                                 -0.95439626
## 31                                -0.98736420
## 61                                -0.99236779
## 91                                -0.14142881
## 121                               -0.08944748
## 151                               -0.46650345
## 2                                 -0.98774170
## 32                                -0.98677471
## 62                                -0.98048908
## 92                                -0.28142415
##     timeBodyGyroscopeMagnitude.mean..
## 1                         -0.87475955
## 31                        -0.93089249
## 61                        -0.97649379
## 91                        -0.16097955
## 121                       -0.07574125
## 151                       -0.12673559
## 2                         -0.95001157
## 32                        -0.94603509
## 62                        -0.96346634
## 92                        -0.44654909
##     timeBodyGyroscopeJerkMagnitude.mean..
## 1                              -0.9634610
## 31                             -0.9919763
## 61                             -0.9949668
## 91                             -0.2987037
## 121                            -0.2954638
## 151                            -0.5948829
## 2                              -0.9917671
## 32                             -0.9910815
## 62                             -0.9839519
## 92                             -0.5479120
##     frequencyBodyAccelerometer.mean...X
## 1                           -0.93909905
## 31                          -0.97964124
## 61                          -0.99524993
## 91                          -0.20279431
## 121                          0.03822918
## 151                         -0.40432178
## 2                           -0.97672506
## 32                          -0.98580384
## 62                          -0.98394674
## 92                          -0.34604816
##     frequencyBodyAccelerometer.mean...Y
## 1                          -0.867065205
## 31                         -0.944084550
## 61                         -0.977070848
## 91                          0.089712726
## 121                         0.001549908
## 151                        -0.190976721
## 2                          -0.979800878
## 32                         -0.957343498
## 62                         -0.959871697
## 92                         -0.021904810
##     frequencyBodyAccelerometer.mean...Z
## 1                            -0.8826669
## 31                           -0.9591849
## 61                           -0.9852971
## 91                           -0.3315601
## 121                          -0.2255745
## 151                          -0.4333497
## 2                            -0.9843810
## 32                           -0.9701622
## 62                           -0.9624712
## 92                           -0.4538064
##     frequencyBodyAccelerometer.meanFreq...X
## 1                               -0.15879267
## 31                              -0.04951360
## 61                               0.08651536
## 91                              -0.20754837
## 121                             -0.30739520
## 151                             -0.41873500
## 2                               -0.14648279
## 32                               0.08519282
## 62                               0.10851918
## 92                              -0.14579549
##     frequencyBodyAccelerometer.meanFreq...Y
## 1                                0.09753484
## 31                               0.07594608
## 61                               0.11747895
## 91                               0.11309365
## 121                              0.06322008
## 151                             -0.16069721
## 2                                0.25728947
## 32                               0.15019396
## 62                               0.06233781
## 92                               0.19858647
##     frequencyBodyAccelerometer.meanFreq...Z
## 1                                0.08943766
## 31                               0.23882987
## 61                               0.24485859
## 91                               0.04972652
## 121                              0.29432270
## 151                             -0.52011479
## 2                                0.40253255
## 32                               0.09606468
## 62                               0.10446250
## 92                               0.06889952
##     frequencyBodyAccelerometerJerk.mean...X
## 1                               -0.95707388
## 31                              -0.98659702
## 61                              -0.99463080
## 91                              -0.17054696
## 121                             -0.02766387
## 151                             -0.47987525
## 2                               -0.98581363
## 32                              -0.98784879
## 62                              -0.98097324
## 92                              -0.30461532
##     frequencyBodyAccelerometerJerk.mean...Y
## 1                               -0.92246261
## 31                              -0.98157947
## 61                              -0.98541870
## 91                              -0.03522552
## 121                             -0.12866716
## 151                             -0.41344459
## 2                               -0.98276825
## 32                              -0.97713970
## 62                              -0.97085134
## 92                              -0.07876408
##     frequencyBodyAccelerometerJerk.mean...Z
## 1                                -0.9480609
## 31                               -0.9860531
## 61                               -0.9907522
## 91                               -0.4689992
## 121                              -0.2883347
## 151                              -0.6854744
## 2                                -0.9861971
## 32                               -0.9851291
## 62                               -0.9797752
## 92                               -0.5549567
##     frequencyBodyAccelerometerJerk.meanFreq...X
## 1                                    0.13241909
## 31                                   0.25661082
## 61                                   0.31418294
## 91                                  -0.20926197
## 121                                 -0.25316434
## 151                                 -0.37702313
## 2                                    0.15980833
## 32                                   0.30554682
## 62                                   0.33144928
## 92                                  -0.07271016
##     frequencyBodyAccelerometerJerk.meanFreq...Y
## 1                                    0.02451362
## 31                                   0.04754378
## 61                                   0.03916190
## 91                                  -0.38623714
## 121                                 -0.33758970
## 151                                 -0.50949553
## 2                                    0.12120642
## 32                                   0.02624486
## 62                                  -0.05693683
## 92                                  -0.26357402
##     frequencyBodyAccelerometerJerk.meanFreq...Z
## 1                                   0.024387945
## 31                                  0.092392003
## 61                                  0.138581479
## 91                                 -0.185530281
## 121                                 0.009372239
## 151                                -0.551104284
## 2                                   0.190558218
## 32                                  0.092903063
## 62                                  0.039649818
## 92                                 -0.254846439
##     frequencyBodyGyroscope.mean...X frequencyBodyGyroscope.mean...Y
## 1                        -0.8502492                     -0.95219149
## 31                       -0.9761615                     -0.97583859
## 61                       -0.9863868                     -0.98898446
## 91                       -0.3390322                     -0.10305942
## 121                      -0.3524496                     -0.05570225
## 151                      -0.4926117                     -0.31947461
## 2                        -0.9864311                     -0.98332164
## 32                       -0.9826214                     -0.98210092
## 62                       -0.9670371                     -0.97257615
## 92                       -0.4297135                     -0.55477211
##     frequencyBodyGyroscope.mean...Z frequencyBodyGyroscope.meanFreq...X
## 1                       -0.90930272                        -0.003546796
## 31                      -0.95131554                         0.189153021
## 61                      -0.98077312                        -0.120293021
## 91                      -0.25594094                         0.014784499
## 121                     -0.03186943                        -0.100453729
## 151                     -0.45359721                        -0.187450248
## 2                       -0.96267189                         0.102611319
## 32                      -0.95981482                         0.130523121
## 62                      -0.96062770                        -0.107416045
## 92                      -0.39665991                         0.007279680
##     frequencyBodyGyroscope.meanFreq...Y
## 1                           -0.09152913
## 31                           0.06312707
## 61                          -0.04471920
## 91                          -0.06577462
## 121                          0.08255115
## 151                         -0.47357479
## 2                            0.04228067
## 32                          -0.19214274
## 62                          -0.17116037
## 92                          -0.04270093
##     frequencyBodyGyroscope.meanFreq...Z
## 1                          0.0104581257
## 31                        -0.0297839207
## 61                         0.1006076351
## 91                         0.0007733216
## 121                       -0.0756762068
## 151                       -0.1333739043
## 2                          0.0552985986
## 32                         0.0409472349
## 62                         0.0002268106
## 92                         0.1397521153
##     frequencyBodyAccelerometerMagnitude.mean..
## 1                                  -0.86176765
## 31                                 -0.94778292
## 61                                 -0.98535636
## 91                                 -0.12862345
## 121                                 0.09658453
## 151                                -0.35239594
## 2                                  -0.97511020
## 32                                 -0.96127375
## 62                                 -0.96405217
## 92                                 -0.32428943
##     frequencyBodyAccelerometerMagnitude.meanFreq..
## 1                                       0.08640856
## 31                                      0.23665501
## 61                                      0.28455529
## 91                                      0.19064372
## 121                                     0.11918714
## 151                                    -0.09774335
## 2                                       0.26629821
## 32                                      0.13093420
## 62                                      0.11964996
## 92                                      0.39320621
##     frequencyBodyAccelerometerJerkMagnitude.mean..
## 1                                      -0.93330036
## 31                                     -0.98526213
## 61                                     -0.99254248
## 91                                     -0.05711940
## 121                                     0.02621849
## 151                                    -0.44265216
## 2                                      -0.98537411
## 32                                     -0.98387470
## 62                                     -0.97706530
## 92                                     -0.16906435
##     frequencyBodyAccelerometerJerkMagnitude.meanFreq..
## 1                                           0.26639115
## 31                                          0.35185220
## 61                                          0.42222010
## 91                                          0.09382218
## 121                                         0.07649155
## 151                                         0.08535241
## 2                                           0.34175857
## 32                                          0.28006242
## 62                                          0.30487187
## 92                                          0.20750093
##     frequencyBodyGyroscopeMagnitude.mean..
## 1                               -0.8621902
## 31                              -0.9584356
## 61                              -0.9846176
## 91                              -0.1992526
## 121                             -0.1857203
## 151                             -0.3259615
## 2                               -0.9721130
## 32                              -0.9718406
## 62                              -0.9617759
## 92                              -0.5307048
##     frequencyBodyGyroscopeMagnitude.meanFreq..
## 1                                -0.1397750127
## 31                               -0.0002621867
## 61                               -0.0286057725
## 91                                0.2688443675
## 121                               0.3496138955
## 151                              -0.2193033761
## 2                                 0.0185644722
## 32                               -0.1063589092
## 62                               -0.0661266046
## 92                                0.3052838253
##     frequencyBodyGyroscopeJerkMagnitude.mean..
## 1                                   -0.9423669
## 31                                  -0.9897975
## 61                                  -0.9948154
## 91                                  -0.3193086
## 121                                 -0.2819634
## 151                                 -0.6346651
## 2                                   -0.9902487
## 32                                  -0.9898620
## 62                                  -0.9778498
## 92                                  -0.5832493
##     frequencyBodyGyroscopeJerkMagnitude.meanFreq..
## 1                                        0.1764859
## 31                                       0.1847759
## 61                                       0.3344987
## 91                                       0.1906634
## 121                                      0.1900007
## 151                                      0.1142773
## 2                                        0.2648015
## 32                                       0.1947221
## 62                                       0.1606628
## 92                                       0.1263446
##     angle.tBodyAccelerometerMean.gravity.
## 1                            0.0213659656
## 31                           0.0274415479
## 61                          -0.0002223407
## 91                           0.0604537474
## 121                         -0.0026951252
## 151                          0.0960860762
## 2                            0.0057918096
## 32                           0.0395284311
## 62                          -0.0136819153
## 92                          -0.0301017379
##     angle.tBodyAccelerometerJerkMean..gravityMean.
## 1                                      0.003060407
## 31                                     0.029709788
## 61                                     0.021963783
## 91                                    -0.007930378
## 121                                    0.089931687
## 151                                   -0.061083841
## 2                                     -0.006355576
## 32                                    -0.003392867
## 62                                     0.041182224
## 92                                     0.053400580
##     angle.tBodyGyroscopeMean.gravityMean.
## 1                            -0.001666985
## 31                            0.067698134
## 61                           -0.033793838
## 91                            0.013059491
## 121                           0.063338285
## 151                          -0.194699963
## 2                             0.065286011
## 32                            0.020973170
## 62                           -0.015103516
## 92                            0.021619677
##     angle.tBodyGyroscopeJerkMean.gravityMean. angle.X.gravityMean.
## 1                                  0.08443716            0.4267062
## 31                                -0.06488162           -0.5912475
## 61                                -0.02792293           -0.7434079
## 91                                -0.01874319           -0.7292472
## 121                               -0.03997685           -0.7444838
## 151                                0.06568357           -0.6471957
## 2                                 -0.02937101            0.6174234
## 32                                -0.07620420           -0.7744361
## 62                                 0.11232465           -0.6271801
## 92                                -0.08584708           -0.6619600
##     angle.Y.gravityMean. angle.Z.gravityMean.
## 1            -0.52034382          -0.35241311
## 31           -0.06046603          -0.21801723
## 61            0.27017503           0.01225285
## 91            0.27695302           0.06885891
## 121           0.26724578           0.06500471
## 151           0.33476328           0.07416637
## 2            -0.51973255          -0.47892823
## 32            0.15585728          -0.11822440
## 62            0.33793791          -0.06789598
## 92            0.32144301          -0.03688928
##     timeBodyAccelerometer.std...X timeBodyAccelerometer.std...Y
## 1                     -0.92805647                  -0.836827406
## 31                    -0.97722901                  -0.922618642
## 61                    -0.99575990                  -0.973190056
## 91                    -0.28374026                   0.114461337
## 121                    0.03003534                  -0.031935943
## 151                   -0.35470803                  -0.002320265
## 2                     -0.97405946                  -0.980277399
## 32                    -0.98682228                  -0.950704499
## 62                    -0.98727189                  -0.957304989
## 92                    -0.42364284                  -0.078091253
##     timeBodyAccelerometer.std...Z timeGravityAccelerometer.std...X
## 1                     -0.82606140                       -0.8968300
## 31                    -0.93958629                       -0.9684571
## 61                    -0.97977588                       -0.9937630
## 91                    -0.26002790                       -0.9766096
## 121                   -0.23043421                       -0.9505598
## 151                   -0.01947924                       -0.9563670
## 2                     -0.98423330                       -0.9590144
## 32                    -0.95982817                       -0.9799888
## 62                    -0.94974185                       -0.9866858
## 92                    -0.42525752                       -0.9726932
##     timeGravityAccelerometer.std...Y timeGravityAccelerometer.std...Z
## 1                         -0.9077200                       -0.8523663
## 31                        -0.9355171                       -0.9490409
## 61                        -0.9812260                       -0.9763241
## 91                        -0.9713060                       -0.9477172
## 121                       -0.9370187                       -0.8959397
## 151                       -0.9528492                       -0.9123794
## 2                         -0.9882119                       -0.9842304
## 32                        -0.9567503                       -0.9544159
## 62                        -0.9741944                       -0.9459271
## 92                        -0.9721169                       -0.9720728
##     timeBodyAccelerometerJerk.std...X timeBodyAccelerometerJerk.std...Y
## 1                         -0.95848211                       -0.92414927
## 31                        -0.98643071                       -0.98137197
## 61                        -0.99460454                       -0.98564873
## 91                        -0.11361560                        0.06700250
## 121                       -0.01228386                       -0.10160139
## 151                       -0.44684389                       -0.37827443
## 2                         -0.98587217                       -0.98317254
## 32                        -0.98805585                       -0.97798396
## 62                        -0.98108572                       -0.97105944
## 92                        -0.27753046                       -0.01660224
##     timeBodyAccelerometerJerk.std...Z timeBodyGyroscope.std...X
## 1                          -0.9548551                -0.8735439
## 31                         -0.9879108                -0.9772113
## 61                         -0.9922512                -0.9871919
## 91                         -0.5026998                -0.4735355
## 121                        -0.3457350                -0.4580305
## 151                        -0.7065935                -0.5448711
## 2                          -0.9884420                -0.9882752
## 32                         -0.9875182                -0.9857420
## 62                         -0.9828414                -0.9729986
## 92                         -0.5860904                -0.5615503
##     timeBodyGyroscope.std...Y timeBodyGyroscope.std...Z
## 1                -0.951090440                -0.9082847
## 31               -0.966473895                -0.9414259
## 61               -0.987734440                -0.9806456
## 91               -0.054607769                -0.3442666
## 121              -0.126349195                -0.1247025
## 151               0.004105184                -0.5071687
## 2                -0.982291609                -0.9603066
## 32               -0.978919527                -0.9598037
## 62               -0.971441996                -0.9648567
## 92               -0.538453668                -0.4810855
##     timeBodyGyroscopeJerk.std...X timeBodyGyroscopeJerk.std...Y
## 1                      -0.9186085                    -0.9679072
## 31                     -0.9917316                    -0.9895181
## 61                     -0.9929451                    -0.9951379
## 91                     -0.2074219                    -0.3044685
## 121                    -0.4870273                    -0.2388248
## 151                    -0.6147865                    -0.6016967
## 2                      -0.9932358                    -0.9895675
## 32                     -0.9897090                    -0.9908896
## 62                     -0.9793240                    -0.9834473
## 92                     -0.3895498                    -0.6341404
##     timeBodyGyroscopeJerk.std...Z timeBodyAccelerometerMagnitude.std..
## 1                      -0.9577902                          -0.79514486
## 31                     -0.9879358                          -0.92707842
## 61                     -0.9921085                          -0.98194293
## 91                     -0.4042555                          -0.21968865
## 121                    -0.2687615                           0.01988435
## 151                    -0.6063320                          -0.32497093
## 2                      -0.9880358                          -0.97287391
## 32                     -0.9855423                          -0.95308144
## 62                     -0.9736101                          -0.95787497
## 92                     -0.4354927                          -0.42254417
##     timeGravityAccelerometerMagnitude.std..
## 1                               -0.79514486
## 31                              -0.92707842
## 61                              -0.98194293
## 91                              -0.21968865
## 121                              0.01988435
## 151                             -0.32497093
## 2                               -0.97287391
## 32                              -0.95308144
## 62                              -0.95787497
## 92                              -0.42254417
##     timeBodyAccelerometerJerkMagnitude.std..
## 1                                -0.92824563
## 31                               -0.98412002
## 61                               -0.99309621
## 91                               -0.07447175
## 121                              -0.02578772
## 151                              -0.47899162
## 2                                -0.98551808
## 32                               -0.98447587
## 62                               -0.97667528
## 92                               -0.16415099
##     timeBodyGyroscopeMagnitude.std.. timeBodyGyroscopeJerkMagnitude.std..
## 1                         -0.8190102                           -0.9358410
## 31                        -0.9345318                           -0.9883087
## 61                        -0.9786900                           -0.9947332
## 91                        -0.1869784                           -0.3253249
## 121                       -0.2257244                           -0.3065106
## 151                       -0.1486193                           -0.6485530
## 2                         -0.9611641                           -0.9897181
## 32                        -0.9613136                           -0.9895949
## 62                        -0.9539434                           -0.9772044
## 92                        -0.5530199                           -0.5577982
##     frequencyBodyAccelerometer.std...X frequencyBodyAccelerometer.std...Y
## 1                          -0.92443743                        -0.83362556
## 31                         -0.97641231                        -0.91727501
## 61                         -0.99602835                        -0.97229310
## 91                         -0.31913472                         0.05604001
## 121                         0.02433084                        -0.11296374
## 151                        -0.33742819                         0.02176951
## 2                          -0.97324648                        -0.98102511
## 32                         -0.98736209                        -0.95007375
## 62                         -0.98905647                        -0.95790884
## 92                         -0.45765138                        -0.16921969
##     frequencyBodyAccelerometer.std...Z
## 1                          -0.81289156
## 31                         -0.93446956
## 61                         -0.97793726
## 91                         -0.27968675
## 121                        -0.29792789
## 151                         0.08595655
## 2                          -0.98479218
## 32                         -0.95686286
## 62                         -0.94643358
## 92                         -0.45522215
##     frequencyBodyAccelerometerJerk.std...X
## 1                               -0.9641607
## 31                              -0.9874930
## 61                              -0.9950738
## 91                              -0.1335866
## 121                             -0.0863279
## 151                             -0.4619070
## 2                               -0.9872503
## 32                              -0.9894591
## 62                              -0.9830079
## 92                              -0.3143131
##     frequencyBodyAccelerometerJerk.std...Y
## 1                              -0.93221787
## 31                             -0.98251391
## 61                             -0.98701823
## 91                              0.10673986
## 121                            -0.13458001
## 151                            -0.38177707
## 2                              -0.98498739
## 32                             -0.98080423
## 62                             -0.97352024
## 92                             -0.01533295
##     frequencyBodyAccelerometerJerk.std...Z frequencyBodyGyroscope.std...X
## 1                               -0.9605870                     -0.8822965
## 31                              -0.9883392                     -0.9779042
## 61                              -0.9923498                     -0.9874971
## 91                              -0.5347134                     -0.5166919
## 121                             -0.4017215                     -0.4954225
## 151                             -0.7260402                     -0.5658925
## 2                               -0.9893454                     -0.9888607
## 32                              -0.9885708                     -0.9868085
## 62                              -0.9845999                     -0.9749881
## 92                              -0.6158982                     -0.6040530
##     frequencyBodyGyroscope.std...Y frequencyBodyGyroscope.std...Z
## 1                      -0.95123205                     -0.9165825
## 31                     -0.96234504                     -0.9439178
## 61                     -0.98710773                     -0.9823453
## 91                     -0.03350816                     -0.4365622
## 121                    -0.18141473                     -0.2384436
## 151                     0.15153891                     -0.5717078
## 2                      -0.98191062                     -0.9631742
## 32                     -0.97735619                     -0.9635227
## 62                     -0.97103605                     -0.9697543
## 92                     -0.53304695                     -0.5598566
##     frequencyBodyAccelerometerMagnitude.std..
## 1                                  -0.7983009
## 31                                 -0.9284448
## 61                                 -0.9823138
## 91                                 -0.3980326
## 121                                -0.1865303
## 151                                -0.4162601
## 2                                  -0.9751214
## 32                                 -0.9555756
## 62                                 -0.9605194
## 92                                 -0.5771052
##     frequencyBodyAccelerometerJerkMagnitude.std..
## 1                                      -0.9218040
## 31                                     -0.9816062
## 61                                     -0.9925360
## 91                                     -0.1034924
## 121                                    -0.1040523
## 151                                    -0.5330599
## 2                                      -0.9845685
## 32                                     -0.9841242
## 62                                     -0.9751605
## 92                                     -0.1640920
##     frequencyBodyGyroscopeMagnitude.std..
## 1                              -0.8243194
## 31                             -0.9321984
## 61                             -0.9784661
## 91                             -0.3210180
## 121                            -0.3983504
## 151                            -0.1829855
## 2                              -0.9610984
## 32                             -0.9613857
## 62                             -0.9567887
## 92                             -0.6517928
##     frequencyBodyGyroscopeJerkMagnitude.std..
## 1                                  -0.9326607
## 31                                 -0.9870496
## 61                                 -0.9946711
## 91                                 -0.3816019
## 121                                -0.3919199
## 151                                -0.6939305
## 2                                  -0.9894927
## 32                                 -0.9896329
## 62                                 -0.9777543
## 92                                 -0.5581046
```

## 4. Data set as a txt file created with write.table() using row.name=FALSE


```r
write.table(cran4, file = "./data/tidydata.txt",row.name=FALSE)
```
