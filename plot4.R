if(!file.exists("data.csv"))
      source("process.R")

data<-read.csv("data.csv", stringsAsFactors=FALSE)
data$Date<-strptime(data$Date, format="%Y-%m-%d %H:%M:%S")
png(filename="plot4.png")

par(mfrow=c(2,2))

#Plot1
with(data, plot(Date, Global_active_power, xlab="", ylab="Global Active Power", type="n"))
with(data, lines(Date, Global_active_power))

#Plot2
with(data, plot(Date, Voltage, xlab="datetime", type="n"))
with(data, lines(Date, Voltage))

#Plot3
with(data, plot(Date, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(data, lines(Date, Sub_metering_1, col="black"))
with(data, lines(Date, Sub_metering_2, col="red"))
with(data, lines(Date, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1),bty="n")

#plot4
with(data, plot(Date, Global_reactive_power, xlab="datetime", type="n"))
with(data, lines(Date, Global_reactive_power))

dev.off()