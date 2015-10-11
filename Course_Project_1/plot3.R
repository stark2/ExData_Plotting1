p <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")

p$Date <- as.Date(p$Date, format="%d/%m/%Y")

s <- p[(p$Date=="2007-02-01") | (p$Date=="2007-02-02"),]

s <- transform(s, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
with (s, plot(timestamp, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with (s, lines(timestamp, Sub_metering_2, col="red"))
with (s, lines(timestamp, Sub_metering_3, col="blue"))
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="~/Data/r-workspace/coursera/Exploratory_Data_Analysis/plot3.png")
dev.off()

