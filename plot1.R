##This file creates the plot 1.


##If the processed dataset is not present then the script would call the process.R script that will download
# and then process the original dataset and create a processed dataset that can be used by this script.
if(!file.exists("data.csv"))
      source("process.R")

#Reading data that will be used to create the plot.
data<-read.csv("data.csv")
#Opening graphic device to draw the plot in a png file.
png(filename="plot1.png")
#Creating the plot.
with(data, hist(Global_active_power, xlab="Global Active Power (killowatts)", col="red", main="Global Active Power"))

#Closing the png device.
dev.off()