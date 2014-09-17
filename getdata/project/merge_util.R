# This function merges file and directories iteratively under given directories.
#  It simply appends the contents of two files with same name in a directory and saves it under destination directory
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
