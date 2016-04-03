data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
subset_data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]
day = strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
day = strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap = as.numeric(subset_data$Global_active_power)
grp = as.numeric(subset_data$Global_reactive_power)
plot(day, gap,type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
plot(day, as.numeric(subset_data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
with(subset_data, {
  plot(day, subset_data$Sub_metering_1,type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
  lines(day, subset_data$Sub_metering_2,type = "l", col = "red")
  lines(day, subset_data$Sub_metering_3,type = "l", col = "blue")
  legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
})
plot(day, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()