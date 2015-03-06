################################################################################
#
# Exploratory Data Analysis
# Project assignment 1
# Plot 4
#
################################################################################
#
# To make month and day is english
#
Sys.setlocale("LC_TIME","en_US.UTF-8")
#
# read data, note NA is ?
#
fileName <- "household_power_consumption.txt"
dataTable <- read.table(fileName,sep=";",header=TRUE,na.strings = "?")
str(dataTable)
#
# Want to get a timestamp using both date and time
#
datetime <- paste(dataTable$Date,dataTable$Time)
str(datetime) 
#
# Add it to the data table
dataTable$timestamp <- strptime(datetime, format="%d/%m/%Y %H:%M:%S")
#
# Convert Date from factor to date
#
dataTable$Date <- as.Date(dataTable$Date,"%d/%m/%Y")
str(dataTable)
#
# Reduce dataset to  2007-02-01 and 2007-02-02
#
reducedData <- subset(dataTable,(dataTable$Date == "2007-02-01" |dataTable$Date == "2007-02-02" ))
str(reducedData)
#
# Set up 4 plots on page
#
png("plot4.png",width=480,height=480,units="px")
par(mfrow = c(2, 2))
#
# plot 1
#
plot(reducedData$timestamp,reducedData$Global_active_power, xlab = "",
     ,ylab = "Global Active Power (kilowatts)",type="l")
#
# plot 2
#
plot(reducedData$timestamp,reducedData$Voltage, xlab = "datetime",
     ,ylab = "Voltage",type="l")
#
# Plot 3
#
plot(reducedData$timestamp,reducedData$Sub_metering_1, xlab = "",
     ,ylab = "Energy sub metering",type="l")
lines(reducedData$timestamp,reducedData$Sub_metering_2,type="l",col="red")
lines(reducedData$timestamp,reducedData$Sub_metering_3,type="l",col="blue")
legend("topright", inset=.01, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       ,col=c("black","blue","red"),lty=c(1,1,1), box.col=NA)
#
# plot 4
#
plot(reducedData$timestamp,reducedData$Global_reactive_power, xlab = "datetime",
     ,ylab = "Global_reactive_power",type="l")
#
dev.off()
