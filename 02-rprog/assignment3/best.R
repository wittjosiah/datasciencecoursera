best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if (!state %in% data[,7]) stop('invalid state')
  else state_data <- data[data$State==state,]
  
  if (!outcome %in% c('heart attack', 'heart failure', 'pneumonia')) stop('invalid outcome')
  else if (outcome == "heart attack") {
    state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack <- as.numeric(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
    hospital <- state_data[state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, na.rm=T) & !(is.na(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)),]
  } else if (outcome == "heart failure") {
    state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure <- as.numeric(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
    hospital <- state_data[state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == min(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, na.rm=T) & !(is.na(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)),]
  } else if (outcome == "pneumonia") {
    state_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia <- as.numeric(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
    hospital <- state_data[state_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == min(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, na.rm=T) & !(is.na(state_data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)),]
  }
  hospital <- hospital[order(hospital$Hospital.Name),]
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  hospital$Hospital.Name[1]
}