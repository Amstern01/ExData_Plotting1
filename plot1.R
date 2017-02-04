#Creating a histogram of global active power

setwd("~/Performance Review/JHU Data Science/Assignments/Exploratory Data Analysis")
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./datazip.zip")
unzip("./datazip.zip", exdir = "./datazip")

##Reading data into R
data <- read.table("./datazip/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
dataSub <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
dataSub$Date <- as.Date(dataSub$Date)

##Creating histogram
png("plot1.png")
hist(dataSub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() 

