library(sqldf)
library(lubridate)
library(dplyr)
data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

Date.Time <- paste(data$Date, data$Time)
Date.Time2 <- dmy_hms(Date.Time)

data2 <- select(data, -Date, -Time)
data3 <- cbind(Date.Time2, data2)


png(file="plot3.png", bg="white", width=480, height=480)
plot(Date.Time2, data3[,8], type="l", xlab="", ylab="Energy sub metering", col="blue", ylim=c(0,30))
lines(Date.Time2, data3[,7], type="l", xlab="", ylab="Energy sub metering", col="red", ylim=c(0,30))
lines(Date.Time2, data3[,6], type="l", xlab="", ylab="Energy sub metering", col="black", ylim=c(0,30))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()

