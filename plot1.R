library(lubridate)
library(datasets)
## Read  complete data from TXT File
data <- read.table("household_power_consumption.txt", header = TRUE, dec = ".", na.strings = "?", sep = ";")
## Change class of Date Colum (Factor) to "POSIXlt" and "POSIXct"
data$Date <- dmy(data$Date)
## select data (2007-01-01) to (2007-01-02)
selection_data <- data[grepl("2007-02-01", data$Date)| grepl("2007-02-02", data$Date),]

#plot1 
hist(na.omit(as.numeric(selection_data$Global_active_power)), col= "red", main = ("Global Active Power"), axes = TRUE, xlab = ("Global Active Power (kilowatts)"))

#save plot1 to a PNG file
png(file = "plot1.png")
hist(na.omit(as.numeric(selection_data$Global_active_power)), col= "red", main = ("Global Active Power"), axes = TRUE, xlab = ("Global Active Power (kilowatts)"))
dev.off()