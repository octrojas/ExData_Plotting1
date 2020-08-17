#Loading and preparing data 
firstdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data<-firstdata[grep(pattern = "\\b1/2/2007\\b|\\b2/2/2007\\b", x = firstdata$Date),]
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, "%H:%M:%S")
data$Time<-sub(".*\\s+", "",  data$Time)

#Plot 4
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot (as.numeric(data$Global_active_power),
	type = "l",
	main = NULL,
	xlab = "",
	ylab = "Global Active Power",
	xaxt = 'n')
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri", "Sat"))
plot (as.numeric(data$Voltage),
	type = "l",
	main = NULL,
	xlab = "datetime",
	ylab = "Voltage",
	xaxt = 'n')
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri", "Sat"))
plot (as.numeric(data$Sub_metering_1),
	type = "l",
	main = NULL,
	xlab = "",
	ylab = "Energy sub metering",
	xaxt = 'n')
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri", "Sat"))
lines (as.numeric(data$Sub_metering_2),col = "red")
lines (as.numeric(data$Sub_metering_3),col = "blue")
legend("topright", 
	 c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	 bty = "n",
	 col = c("black", "red", "blue"),
	 lwd=1)
plot (as.numeric(data$Global_reactive_power),
	type = "l",
	main = NULL,
	xlab = "",
	ylab = "Global_reactive_power",
	xaxt = 'n')
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri", "Sat"))