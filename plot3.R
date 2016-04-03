data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
subset_data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]
day = strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
with(subset_data, {
plot(day, subset_data$Sub_metering_1,type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(day, subset_data$Sub_metering_2,type = "l", col = "red")
lines(day, subset_data$Sub_metering_3,type = "l", col = "blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)
})
dev.off()
