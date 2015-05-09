##This script downloads the dataset and create a new dataset by filtering only the required rows.
# It provides data.csv as the output containing filtered dataset.

library(dplyr)
#Downloading the dataset required for the project.
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
#Unzipping the downloaded file.
unzip("data.zip")
#Read sample data from the dataset to find out the classes of the different variables in dataset.
temp <- read.table("household_power_consumption.txt", nrows=10, header=TRUE, sep=";",na.strings = "?", stringsAsFactors=FALSE)
classes<-sapply(temp, class)
#Reading whole dataset.(This dataset requires about 1 GB of memory)
data <- read.table("household_power_consumption.txt", nrows=2075259, header=TRUE, colClasses=classes,sep=";", na.strings = "?")

#Filtering dataset and combining date and time field into one and then converting it into POSIXct format.
data<-filter(data, (Date == "1/2/2007")|(Date == "2/2/2007"))
data<-mutate(data, Date=paste(Date,Time))
data<-select(data, -Time)
data$Date=strptime(data$Date, format="%d/%m/%Y %H:%M:%S")

#Writing the filtered data to a csv file.
write.csv(data, file="data.csv", row.names = FALSE)