#Processing the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", "curl")
data <- read.table(unz("data.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filter <- data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))
data <- subset(data, filter)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$my_dates <- paste   ( data$Date, data$Time, sep="" )
data$my_dates <- strptime( data$my_dates, format = "%Y-%m-%d%H:%M:%S" )

png("plot2.png")
plot(data$my_dates, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()