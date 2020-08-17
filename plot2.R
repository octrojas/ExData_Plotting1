#Loading and preparing data 
firstdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data<-firstdata[grep(pattern = "\\b1/2/2007\\b|\\b2/2/2007\\b", x = firstdata$Date),]
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, "%H:%M:%S")
data$Time<-sub(".*\\s+", "",  data$Time)

#Plot 2
png(file="plot2.png", width=480, height=480)
plot (as.numeric(data$Global_active_power),
	type = "l",
	main = NULL,
	xlab = "",
	ylab = "Global Active Power (kilowatts)",
	xaxt = 'n')
axis(1, at=c(1,1441,2880), labels=c("Thu","Fri", "Sat"))
dev.off()	
