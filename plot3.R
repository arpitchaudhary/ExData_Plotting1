if(!file.exists("data.csv"))
      source("process.R")

data<-read.csv("data.csv", stringsAsFactors=FALSE)
data$Date<-strptime(data$Date, format="%Y-%m-%d %H:%M:%S")
png(filename="plot3.png")
with(data, plot(Date, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(data, lines(Date, Sub_metering_1, col="black"))
with(data, lines(Date, Sub_metering_2, col="red"))
with(data, lines(Date, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1))

dev.off()