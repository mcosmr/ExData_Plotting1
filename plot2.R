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


plot2
y <- na.omit(as.numeric(data2$Global_active_power))
plot(x, y, type = "l", ylab = " Global active power (kilowatts)", xlab = "")

#save plot2 to a PNG file

png(file = "plot2.png")
plot(x, y, type = "l", ylab = " Global active power (kilowatts)", xlab = "")
dev.off()