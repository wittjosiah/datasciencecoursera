get_data <- function() {
  if(file.exists("data.csv")) {
    data <- read.csv("data.csv")
    data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
  } else {
    if(!file.exists("household_power_consumption.zip")) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
    }
    unzip <- unz("household_power_consumption.zip", "household_power_consumption.txt")
    data <- read.table(unzip, header=TRUE, sep=";", na.strings="?", colClasses=c("character","character",rep("numeric",times=7)))
    data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    write.csv(data, "data.csv")
  }
  data
}