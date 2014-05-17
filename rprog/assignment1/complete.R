complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files <- list.files(directory)
  files <- files[id]
  total <- data.frame(id=id, nobs=id)
  x = 1
  for (file in files) {
    data <- read.csv(paste(directory, file, sep="/"))
    count <- 0
    for (y in 1:length(data[[1]])) {
      increment <- TRUE
      for (value in is.na(data[y,])) {
        if (value == TRUE) increment <- FALSE
      }
      if (increment == TRUE) count <- count + 1
    }
    total$nobs[x] <- count
    x <- x + 1
  }
  total
}