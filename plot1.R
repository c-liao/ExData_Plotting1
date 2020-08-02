#Processing the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", "curl")
data <- read.table(unz("data.zip", "household_power_consumption.txt"), sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
filter <- data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02"))
data <- subset(data, filter)
data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()