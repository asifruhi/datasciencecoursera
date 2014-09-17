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