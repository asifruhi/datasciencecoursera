---
title: "README"
output: html_document
---

###merge_util.R

The merge_util.R script defines a function, mergeDirs, that merges file and directories iteratively under given directories. It simply appends the contents of two files with same name in a directory and saves it under destination directory. This script is used by run_analysis.R to merge test and train directories to generate one data set


```{r}
mergeDirs <- function(dir1, suffix1, dir2, suffix2, destDir) {
  # Error out if the directories do not exist. It means both the source dirs are not of the same structure
  if (!file.exists(dir1)) {
    stop(dir1, ' does not exists')
  }
  
  if (!file.exists(dir2)) {
    stop(dir2, ' does not exists')
  }
  
  # Create the dest directory
  if (!file.exists(destDir)) {
    dir.create(destDir, recursive=T)
  }
  
  # Now list the files in directory 1
  l1 <- list.files(dir1)
  
  lapply(l1, function(f) {
    f1 <- paste(dir1, f, sep="/")
    
    f2 <- paste(dir2, f, sep="/")
    f2 <- sub(suffix1, suffix2, f2)
    
    df <- paste(destDir, f, sep="/")
    df <- sub(suffix1, "", df)
    
    info <- file.info(f1)
    
    if (info$isdir) {
      # Recurse if the file is infact a directory
      mergeDirs(f1, suffix1, f2, suffix2, df)
    } else {
      # Error out if files within the source directories do not match
      if (!file.exists(f2)) {
        stop (f2, ' does not exists')
      }
      file.copy(f1, df)
      file.append(df, f2)
    }
  });
}
```

### meanstdcols.txt

A text file with space delimited rows representing columns in the original data set for measurements on the mean and standard deviation for each measurement. Below are some sample rows. Each row include the column number, the feature detail and a descriptive name. This file is used by the script run_analysis.R to extract the measurements of interest.


```
1 tBodyAcc-mean()-X Time.BodyAcceleration.Mean.X
2 tBodyAcc-mean()-Y Time.BodyAcceleration.Mean.Y
3 tBodyAcc-mean()-Z Time.BodyAcceleration.Mean.Z
4 tBodyAcc-std()-X Time.BodyAcceleration.StdDev.X
5 tBodyAcc-std()-Y Time.BodyAcceleration.StdDev.Y
6 tBodyAcc-std()-Z Time.BodyAcceleration.StdDev.Z
....

```

### run_analysis.R

The run_analysis.R script defines the main function, runAnalysis, which performs the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


```{r}
# The function runAnalysis run the logic as outlined in the course project. It expects two optional parameters:
#   - rawDataSetDir: The directory with unzipped data set (with train and test data sets) 
#   - mergedDataSetDir: The directory where the meged data set is stored
runAnalysis <- function(rawDataSetDir='UCI HAR Dataset', mergedDataSetDir = 'UCI HAR Dataset Merged') {
  # ------- 1. Merges the training and the test sets to create one data set. --------
  # Import utils to help merge the directories
  source('merge_util.R')
  mergeDirs(paste(rawDataSetDir, 'train', sep='/'), "_train",
              paste(rawDataSetDir, 'test', sep='/'), "_test",
              mergedDataSetDir)
  
  
  # ------- 2. Extracts only the measurements on the mean and standard deviation for each measurement. -------
  
  # meanstdcols.txt file has column numbers and descriptive names of mean & std dev columns
  cols <- read.table('meanstdcols.txt', sep=' ')
  
  # V1 has column numbers of interest
  colsnum <- as.numeric(cols$V1)
  widths <- vector()
  for (i in 1:561) {
    widths <- append(widths, 16)
  }
  X <- read.fwf(paste(mergedDataSetDir, 'X.txt', sep='/'), widths=widths,  sep='')
  Xfiltered <- X[,colsnum]
  remove(X)
  
  # ------- 3. Uses descriptive activity names to name the activities in the data set -------
  # The descriptive activity names are already defined in column V3 in meanstdcols.txt file
  
  # ------- 4. Appropriately labels the data set with descriptive variable names. -------
  # V3 has descriptive names for columns of interest
  names(Xfiltered) <- as.vector(cols$V3)
  
  # ------- 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. -------
  # Load subjects
  sub <- read.table(paste(mergedDataSetDir, 'subject.txt', sep='/'))
  # Load activities
  act <- read.table(paste(mergedDataSetDir, 'y.txt', sep='/'))
  
  # Append both subject and activities to data set
  Xfiltered$Activity <- act$V1
  Xfiltered$Subject <- sub$V1
  
  # Create a second, independent tidy data set with averages by activity and subject
  library(plyr)
  XAvgTidy <- ddply(Xfiltered, .(Activity, Subject), function(ds) {
    # the function recieves a subset for each combination of activity and subject
    # create mean for each column
    apply(ds, 2, mean)
  })

  write.table(XAvgTidy, file="XAvgTidy.txt", row.names=FALSE)
}

# Base directory of all source and data files
baseDir <- '~/projects/datasciencecoursera/getdata/project'
setwd(baseDir)
zipFilePath <- paste(baseDir, 'getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', sep='/')

# Download the data set zip fies
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', 
              destfile=zipFilePath,
              method='curl')

# Unzip to current directory
unzip(zipFilePath)

# Run analysis
runAnalysis()
```


