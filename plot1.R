#Loading and preparing data 
firstdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data<-firstdata[grep(pattern = "\\b1/2/2007\\b|\\b2/2/2007\\b", x = firstdata$Date),]
data$Date<-as.Date(data$Date, "%d/%m/%Y")
data$Time<-strptime(data$Time, "%H:%M:%S")
data$Time<-sub(".*\\s+", "",  data$Time)

#Plot1
png(file="plot1.png", width=480, height=480)
hist(as.numeric(data$Global_active_power), 
	main = "Global Active Power", 
	xlab = "Global Active Power (kilowatts)",
	col = "red")
dev.off()	
