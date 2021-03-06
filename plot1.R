library(sqldf)
dev.off()
power <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007','2/2/2007')", sep = ";", header = TRUE )
power$datetime<- strptime(paste(power$Date,power$Time),format = "%d/%m/%Y %H:%M:%S")
hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")

