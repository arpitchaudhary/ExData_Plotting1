library(dplyr)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip")
unzip("data.zip")
temp <- read.table("household_power_consumption.txt", nrows=10, header=TRUE, sep=";",na.strings = "?", stringsAsFactors=FALSE)
classes<-sapply(temp, class)
data <- read.table("household_power_consumption.txt", nrows=2075259, header=TRUE, colClasses=classes,sep=";", na.strings = "?")
data<-filter(data, (Date == "1/2/2007")|(Date == "2/2/2007"))
data<-mutate(data, Date=paste(Date,Time))
data<-select(data, -Time)
data$Date=strptime(data$Date, format="%d/%m/%Y %H:%M:%S")
write.csv(data, file="data.csv", row.names = FALSE)