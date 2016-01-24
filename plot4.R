library(sqldf)
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";", header = TRUE )
power$datetime<- strptime(paste(power$Date,power$Time),format = "%d/%m/%Y %H:%M:%S")
dev.off()
par(mfrow=c(2,2))
plot(power$datetime,power$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "")
plot(power$datetime,power$Voltage,  type='l',ylab="Voltage",xlab = "datetime")
plot(power$datetime,power$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab="")
lines(power$datetime,power$Sub_metering_2,type="l",col="red")
lines(power$datetime,power$Sub_metering_3,type="l",col="blue")
#par(mar=c(0.1,0.1,0.1,0.1), cex.lab=.7, lheight=0.1)
legend("topright", lty = 1, col = c("black", "red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       text.font = 2, bty="n", cex = 0.7, y.intersp = 0.2, x.intersp = 0.5, 
       inset = 0)

with(power,plot(datetime,Global_reactive_power,type="l",xlab="datetime"))
