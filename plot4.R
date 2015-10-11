p <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")

p$Date <- as.Date(p$Date, format="%d/%m/%Y")

s <- p[(p$Date=="2007-02-01") | (p$Date=="2007-02-02"),]

s <- transform(s, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

# 1
with(s, plot(timestamp, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

# 2
with(s, plot(timestamp, Voltage, type="l", xlab="datetime", ylab="Voltage"))

# 3
with(s, plot(timestamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(s, lines(timestamp, Sub_metering_2,col="red"))
with(s, lines(timestamp, Sub_metering_3,col="blue"))
with(s, legend("topright", col=c("black","red","blue"), 
              c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), 
              lty=c(1,1), bty="n", cex=.5))

# 4
with(s, plot(timestamp, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

