## Create 2 X 2 grid of plots
setwd("~/Performance Review/JHU Data Science/Assignments/Exploratory Data Analysis")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./datazip.zip")
unzip("./datazip.zip", exdir = "./datazip")

##Reading data into R
data <- read.table("./datazip/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
dataSub$Date <- as.Date(dataSub$Date)

##Create png device
png("plot4.png")
## Set 2 by 2 grid
par(mfcol = c(2,2))

##Creating line plot of global active power with days as x-axis tics
plot(dataSub$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

##Create line plot of sub metering 1, 2, and 3 with different colored lines
plot(dataSub$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(dataSub$Sub_metering_1)
lines(dataSub$Sub_metering_2, col = "red")
lines(dataSub$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", bty = "n", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create plot of voltage by datetime
plot(dataSub$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

## Create plot of global reactivepower by datetime
plot(dataSub$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()