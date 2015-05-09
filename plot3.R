##This file creates the plot 3.


##If the processed dataset is not present then the script would call the process.R script that will download
# and then process the original dataset and create a processed dataset that can be used by this script.

if(!file.exists("data.csv"))
      source("process.R")

#Reading data that will be used to create the plot.
data<-read.csv("data.csv", stringsAsFactors=FALSE)
#Reading Date as POSIXct.
data$Date<-strptime(data$Date, format="%Y-%m-%d %H:%M:%S")

#Opening graphic device to draw the plot in a png file.
png(filename="plot3.png")

#Creating the plot.
with(data, plot(Date, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(data, lines(Date, Sub_metering_1, col="black"))
with(data, lines(Date, Sub_metering_2, col="red"))
with(data, lines(Date, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1))

#Closing the png device.
dev.off()