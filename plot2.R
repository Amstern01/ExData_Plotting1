##Creating line plot of global active power with days as x-axis tics

setwd("~/Performance Review/JHU Data Science/Assignments/Exploratory Data Analysis")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./datazip.zip")
unzip("./datazip.zip", exdir = "./datazip")

##Reading data into R
data <- read.table("./datazip/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
dataSub$Date <- as.Date(dataSub$Date)

##Creating line plot of global active power with days as x-axis tics
png("plot2.png")
plot(dataSub$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off() 
