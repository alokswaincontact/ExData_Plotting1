## This code plots a scatterplot and saves it in a png file.
## This code has been written for fulfilling the Assignment for
## the MOOC course at the link below.
## https://www.coursera.org/course/exdata
## The output from this file is in "plot1.png"
## To run this code do 'source("plot1.R")' without the single quotes in R CLI.
## This folder should also have the data file called 'household_power_consumption.txt'
## Author : Alok Swain
## Date   : Jan 11, 2015

# This is the list of the column names for the data.frame to be created later.
col.names <- c(
        "Date",
        "Time",
        "Global_active_power",
        "Global_reactive_power",
        "Voltage",
        "Global_intensity",
        "Sub_metering_1",
        "Sub_metering_2",
        "Sub_metering_3")

# This is the mode or data-type of the various columns in the data.frame to be created later.
colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")

# Read the txt data that has the data and put it in a data.frame called 'power.data'
power.data <- read.csv("household_power_consumption.txt", 
                        header = TRUE, 
                        colClasses = colClasses, 
                        nrows = 2880, 
                        skip = 66636, 
                        sep = ";", 
                        col.names = col.names, 
                        na.strings = "?")

# Create a new column by converting the "Date" column in character mode 
# to a new column called "date" in 'Date' format
power.data$date <- as.Date(power.data$Date, "%d/%m/%Y")

# Create a new column by converting the "Time" column in character mode 
# to a new column called "time" in 'POSIXlt' format
power.data$time <- strptime(x = paste(power.data$Date, power.data$Time, sep = ","), "%d/%m/%Y,%H:%M:%S")

## Create a PNG file
png(filename = "plot1.png", bg = "transparent", pointsize = 12, antialias = "cleartype") 

## Create the plot
hist(x = power.data$Global_active_power, breaks = 12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", cex = 0.85)

## Close the PNG device
dev.off() 
