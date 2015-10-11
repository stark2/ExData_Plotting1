p <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")

p$Date <- as.Date(p$Date, format="%d/%m/%Y")

s <- p[(p$Date=="2007-02-01") | (p$Date=="2007-02-02"),]

s <- transform(s, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
with (s, plot(timestamp, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file="~/Data/r-workspace/coursera/Exploratory_Data_Analysis/plot2.png")
dev.off()

