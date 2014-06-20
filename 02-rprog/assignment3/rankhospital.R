library(R.utils)

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if (!state %in% data[,7]) stop('invalid state')
  else state_data <- data[data$State==state,]
  
  if (!outcome %in% c('heart attack', 'heart failure', 'pneumonia')) stop('invalid outcome')
  else {
    s <- strsplit(outcome, " ")[[1]]
    outcome <- paste(capitalize(s), collapse=".")
    outcome <- paste0("Hospital.30.Day.Death..Mortality..Rates.from.", outcome)
  }
  
  state_data[,outcome] <- as.numeric(state_data[,outcome])
  hospital <- state_data[!(is.na(state_data[,outcome])),]
  hospital <- hospital[order(hospital[,outcome], hospital[,2]),]
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  if (num == 'best') hospital$Hospital.Name[1]
  else if (num == 'worst') hospital$Hospital.Name[nrow(hospital)]
  else hospital$Hospital.Name[num]
}