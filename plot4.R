library(lubridate)
library(datasets)
## Read  complete data from TXT File
data <- read.table("household_power_consumption.txt", header = TRUE, dec = ".", na.strings = "?", sep = ";")
## Change class of Date Colum (Factor) to "POSIXlt" and "POSIXct"
# week day

data$Date <- dmy(data$Date)

## select data (2007-01-01) to (2007-01-02)
data2 <- data[grepl("2007-02-01", data$Date)| grepl("2007-02-02", data$Date),]

x <- paste(data2$Date, data2$Time)
x <- strptime(x, "%Y-%m-%d %H:%M:%S")

y4 <- na.omit(as.numeric(data2$Voltage))
y5 <- na.omit(as.numeric(data2$Global_reactive_power))

#plot4
par(mfrow = c(2,2))
plot(x, y, type = "l", ylab = " Global active power", xlab = "")
plot(x, y4, type = "l", ylab = " Voltage ", xlab = "datetime")

plot(x, y1, type = "l", ylab = " Energy sub metering ", xlab = "")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col= c("black", "red", "blue"), bty = "n")

plot(x, y5, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

#save plot4 to a PNG file

png(file = "plot4.png")
par(mfrow = c(2,2))
plot(x, y, type = "l", ylab = " Global active power", xlab = "")
plot(x, y4, type = "l", ylab = " Voltage ", xlab = "datetime")

plot(x, y1, type = "l", ylab = " Energy sub metering ", xlab = "")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col= c("black", "red", "blue"), bty = "n")

plot(x, y5, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()