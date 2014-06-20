corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  correlations = numeric()
  files <- list.files(directory)
  for (file in files) {
    data <- read.csv(paste(directory, file, sep="/"))
    rows <- nrow(data[complete.cases(data),])
    if (rows > threshold) {
      correlations = c(correlations, cor(data$nitrate, data$sulfate, use="complete.obs"))
    }
  }
  correlations
}