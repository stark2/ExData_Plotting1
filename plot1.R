p <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")

p$Date <- as.Date(p$Date, format="%d/%m/%Y")

s <- p[(p$Date=="2007-02-01") | (p$Date=="2007-02-02"),]

par(mfrow=c(1,1))
hist(s$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
