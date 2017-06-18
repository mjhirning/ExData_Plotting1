#Open a new PNG file in current directory
png("plot1.png", width = 480, height = 480)

#Read raw data into R
data <- read.csv2(file = "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subset the dates that we want to run analysis on
x <- c(66638:69517)
hpower <- data[x,]

#Create New Plot
par(mfrow = c(1, 1))
par(mar = c(4,4,3,1))
hist(as.numeric(levels(hpower$Global_active_power))[hpower$Global_active_power], col = "red", main = "Golbal Active Power", xlab = "Global Active Power (kilowatts)", ylab = "frequency", ylim = c(0,1200))

#Close graphic device
dev.off()