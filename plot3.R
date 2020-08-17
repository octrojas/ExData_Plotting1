#Loading and preparing data 
firstdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data<-firstdata[grep(pattern = "\\b1/2/2007\\b|\\b2/2/2007\\b", x = firstdata$Date),]
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, "%H:%M:%S")
data$Time<-sub(".*\\s+", "",  data$Time)

#Plot 3
png(file="plot3.png", width=480, height=480)
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
	 col = c("black", "red", "blue"),
	 lwd=1)
dev.off()	
