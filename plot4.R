setwd("C:/Users/nat.aroonkong/Documents/Coursera - Exploratory Data Analysis/Assignment 1")

# Read File
library(data.table)
electric.consumption <- fread("household_power_consumption.txt", sep=";")

# Change date column to Date Type (is currently text)
# Note the format argument in strptime tells the function what format
# the text representation of the date is in. This is then converted
# to R's native date format.

electric.consumption$Date <- as.Date(strptime(electric.consumption$Date, 
                                              format="%d/%m/%Y"))

# Filtering the data to be between the days of 2007-02-01 and
# 2007-02-02 
rows = which(electric.consumption$Date %in% as.Date(c("2007-02-01",
                                                      "2007-02-02")))

electric.consumption <- electric.consumption[rows,]

#creating date.time
date.time <- paste(as.character(electric.consumption$Date), 
                   electric.consumption$Time)
#converting string to datetime objects
date.time <- strptime(date.time, format = "%Y-%m-%d %H:%M:%S")

# ======================================================================
#Plot4

#set the graph to export in png (default value is 480x480 pixels)
png(filename = "c:/Users/nat.aroonkong/Desktop/Exploratory Data Analysis Assignment1/ExData_Plotting1/plot4.png")
# -----------------------------------------------------------------------
#displaying 4 tiles
par(mfrow = c(2, 2))

# -----------------------------------------------------------------------
#creating first graph
plot(date.time, electric.consumption$Global_active_power,
     ylab = "Global Active Power",xlab = "", type = "l")
# -----------------------------------------------------------------------
#creating second graph
plot(date.time, electric.consumption$Voltage,
     xlab = "datetime", ylab = "Voltage", type = "l")
# -----------------------------------------------------------------------
#creating third graph
plot(date.time, electric.consumption$Sub_metering_1,
     type = "l", ylab = "Energy sub metering", xlab = "")

#Adding Sub_metering_2
lines(date.time, electric.consumption$Sub_metering_2, col = "red" )

#Adding Sub_metering_3
lines(date.time, electric.consumption$Sub_metering_3, col = "blue" )

#Adding the legend on top right of the graph (without borderline)
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2",
                             "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = 1, bty = "n")

# -----------------------------------------------------------------------
#creating fourth graph
plot(date.time, electric.consumption$Global_reactive_power,
     type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# -----------------------------------------------------------------------
#close off the device
dev.off()