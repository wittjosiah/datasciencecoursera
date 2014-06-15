if(!file.exists("activity_dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="activity_dataset.zip", method="curl")
}
unzip("activity_dataset.zip")