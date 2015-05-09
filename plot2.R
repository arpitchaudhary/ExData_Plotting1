if(!file.exists("data.csv"))
      source("process.R")

data<-read.csv("data.csv", stringsAsFactors=FALSE)
data$Date<-strptime(data$Date, format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png")
with(data, plot(Date, Global_active_power, xlab="", ylab="Global Active Power (killowatts)", type="n"))
with(data, lines(Date, Global_active_power))

dev.off()