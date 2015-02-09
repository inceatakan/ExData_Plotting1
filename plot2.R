library(sqldf)
library(lubridate)
library(dplyr)
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

Date.Time <- paste(data$Date, data$Time)
Date.Time2 <- dmy_hms(Date.Time)

data2 <- select(data, -Date, -Time)
data3 <- cbind(Date.Time2, data2)

png(file="plot2.png", bg="white", width=480, height=480)
plot(data3$Date.Time2, data3$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

