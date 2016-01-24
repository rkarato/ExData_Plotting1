library(sqldf)
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";", header = TRUE )
power$datetime<- strptime(paste(power$Date,power$Time),format = "%d/%m/%Y %H:%M:%S")
dev.off()
plot(power$datetime,power$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="")
lines(power$datetime,power$Sub_metering_2,type="l",col="red")
lines(power$datetime,power$Sub_metering_3,type="l",col="blue")
legend("topright", lty = 1, col = c("black", "red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       text.font = 2, cex = 0.7 )
