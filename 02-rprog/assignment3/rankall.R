source("rankhospital.R")

rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  
  ## Check that state and outcome are valid
  proper.outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!(outcome %in% proper.outcomes)) {
    stop("invalid outcome")
  }
  
  ## For each state, find the hospital of the given rank
  rankings<-data.frame()
  for (state in unique(data$State)) {
    rankings<-rbind(rankings, data.frame(hospital=rankhospital(state, outcome, num), state=state))
  }  
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  rankings[order(as.character(rankings$state)),]
}