# Plot Three


# How much memory will it use:

# MB - The dataset has 2,075,259 rows and 9 columns

round(2075259 *9*8/2^{20},2)

# set working directory

setwd("~/Raj/R/household_power_consumption")

# Load Data

mydata <- read.csv("household_power_consumption.txt", sep = ";")


# Convert date column to date type.

mydata$Date <- as.Date(mydata$Date, format='%d/%m/%Y')

# Subset data we need to use for plot

UseData <- subset(mydata, (mydata$Date >= '2007-02-01'& mydata$Date <= '2007-02-02'))


# Convert columns 3 to 9 to numeric and convert to Kilowatt
UseData[,3:9] <- sapply(UseData[,3:9], as.numeric)

UseData[3] <- sapply(UseData[3], function(x) x/1000)

# Convert dates and times and add new column date time

UseData$datetime <- strptime(paste(UseData$Date, UseData$Time), "%Y-%m-%d %H:%M:%S")

UseData$datetime <- as.POSIXct(UseData$datetime)

# Create Plot

with(UseData, plot(Sub_metering_1 ~ datetime, type = "l", 
                   ylab = "Energy sub metering", xlab = ""))
# Add Blue lines
with(UseData, lines(Sub_metering_2 ~ datetime, col = "Red"))

#Add Red lines
with(UseData, lines(Sub_metering_3 ~ datetime, col = "Blue"))

#Add legend

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Create PNG file

png(file = "plot3.png", width = 480, height = 480, units = "px")
with(UseData, plot(Sub_metering_1 ~ datetime, type = "l", 
                   ylab = "Energy sub metering", xlab = ""))
# Add Blue lines
with(UseData, lines(Sub_metering_2 ~ datetime, col = "Red"))

#Add Red lines
with(UseData, lines(Sub_metering_3 ~ datetime, col = "Blue"))

#Add legend

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

+dev.off()