library(sqldf)

data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";",sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

png(file="plot1.png", bg="white", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylim=c(0, 1200), xlim=c(0,6), plot=TRUE, axes=FALSE)
axis(1, c(0,2,4,6))
axis(2, c(0,200,400,600,800,1000,1200))
dev.off()


