if(!file.exists("data.csv"))
      source("process.R")

data<-read.csv("data.csv")
png(filename="plot1.png")
with(data, hist(Global_active_power, xlab="Global Active Power (killowatts)", col="red", main="Global Active Power"))
dev.off()