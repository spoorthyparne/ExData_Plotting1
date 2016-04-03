data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
subset_data = data[data$Date %in% c("1/2/2007","2/2/2007") ,]
day = strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap = as.numeric(subset_data$Global_active_power)
png(filename = "plot2.png", width = 480, height = 480)
plot(day, gap,type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.off()
