#Open a new PNG file in current directory
png("plot4.png", width = 480, height = 480)

#Read raw data into R
data <- read.csv2(file = "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subset the dates that we want to run analysis on
x <- c(66638:69517)
hpower <- data[x,]

#Create The 4  Plots
par(mar = c(4,4,3,1))
par(mfrow = c(2, 2))
library(lubridate)

#Plot 1
datetime <- paste(hpower$Date, hpower$Time)
datetime <- dmy_hms(datetime)
plot(datetime, as.numeric(levels(hpower$Global_active_power))[hpower$Global_active_power], type = "n", ylab = "Global Active Power")
lines(datetime, as.numeric(levels(hpower$Global_active_power))[hpower$Global_active_power], type = "l")

#Plot 2
plot(datetime, as.numeric(levels(hpower$Voltage))[hpower$Voltage], type = "n", xlab = "datetime", ylab = "Voltage")
lines(datetime, as.numeric(levels(hpower$Voltage))[hpower$Voltage], type = "l")

#Plot 3
plot(datetime, as.numeric(levels(hpower$Sub_metering_1))[hpower$Sub_metering_1], type = "n", ylab = "Energy sub metering")
lines(datetime, as.numeric(levels(hpower$Sub_metering_1))[hpower$Sub_metering_1], type = "l", col = "black")
lines(datetime, as.numeric(levels(hpower$Sub_metering_2))[hpower$Sub_metering_2], type = "l", col = "red")
lines(datetime, as.numeric(levels(hpower$Sub_metering_3))[hpower$Sub_metering_3], type = "l", col = "blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col = c("black", "red", "blue"), lwd = 1)

#Plot 4
plot(datetime, as.numeric(levels(hpower$Global_reactive_power))[hpower$Global_reactive_power], type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(datetime, as.numeric(levels(hpower$Global_reactive_power))[hpower$Global_reactive_power], type = "l")

#Close graphic device
dev.off()