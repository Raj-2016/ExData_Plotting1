# Plot One


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


# Create Histogram

hist(UseData$Global_active_power
     , col = 'red' 
     ,   xlab = "Global active power (kilowatts)"
     , main = "Global Active Power")

# Create PNG file

png(file = "plot1.png", width = 480, height = 480, units = "px")

with(UseData, hist(Global_active_power, col = "red"
                   , xlab = "Global active power (kilowatts)"
                   , main = "Global Active Power"))

+dev.off()