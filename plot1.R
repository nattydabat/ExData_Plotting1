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

# ======================================================================
#Plot1

#set the graph to export in png (default value is 480x480 pixels)
png(filename = "c:/Users/nat.aroonkong/Desktop/Exploratory Data Analysis Assignment1/ExData_Plotting1/plot1.png")

#creating histogram in red
hist(as.numeric(electric.consumption$Global_active_power), 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     col = "red")

#close off the device
dev.off()