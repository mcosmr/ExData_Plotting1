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


#plot3
y1 <- na.omit(as.numeric(data2$Sub_metering_1))
y2 <- na.omit(as.numeric(data2$Sub_metering_2))
y3 <- na.omit(as.numeric(data2$Sub_metering_3))
plot(x, y1, type = "l", ylab = " Energy sub metering ", xlab = "")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col= c("black", "red", "blue"), bty = "n")


#save plot3 to a PNG file

png(file = "plot3.png")
plot(x, y1, type = "l", ylab = " Energy sub metering ", xlab = "")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col= c("black", "red", "blue"), bty = "n")
dev.off()