##This file creates the plot 2.


##If the processed dataset is not present then the script would call the process.R script that will download
# and then process the original dataset and create a processed dataset that can be used by this script.

if(!file.exists("data.csv"))
      source("process.R")

#Reading data that will be used to create the plot.
data<-read.csv("data.csv", stringsAsFactors=FALSE)
#Reading Date as POSIXct.
data$Date<-strptime(data$Date, format="%Y-%m-%d %H:%M:%S")

#Opening graphic device to draw the plot in a png file.
png(filename="plot2.png", width = 504, height = 504)

#Creating the plot.
with(data, plot(Date, Global_active_power, xlab="", ylab="Global Active Power (killowatts)", type="n"))
with(data, lines(Date, Global_active_power))

#Closing the png device.
dev.off()