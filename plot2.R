################################################################################
#
# Exploratory Data Analysis
# Project assignment 1
# Plot 2
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
# Plot it
#
png("plot2.png",width=480,height=480,units="px")
plot(reducedData$timestamp,reducedData$Global_active_power, xlab = "",
             ,ylab = "Global Active Power (kilowatts)",type="l")
dev.off()

