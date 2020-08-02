#Processing the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", "curl")
data <- read.table(unz("data.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filter <- data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))
data <- subset(data, filter)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$my_dates <- paste   ( data$Date, data$Time, sep="" )
data$my_dates <- strptime( data$my_dates, format = "%Y-%m-%d%H:%M:%S" )


png("plot4.png")
par(mfrow=c(2,2))
#plot 1
plot(data$my_dates, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#plot 2
plot(data$my_dates, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#plot 3
plot(data$my_dates, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$my_dates, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
lines(data$my_dates, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("blue","red","black"), lwd = c(1, 1, 1), ncol = 1)
#plot 4
plot(data$my_dates, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()