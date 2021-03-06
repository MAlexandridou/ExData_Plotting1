first<-read.table("household_power_consumption.txt", header= T,sep=";",na.strings="?")
first<-na.omit(first)
Date<-paste(first$Date,first$Time) 
Date<-strptime(Date,format="%d/%m/%Y %H:%M:%S")
Date<-as.data.frame(Date)
data<-as.data.frame(cbind(Date,first$Global_active_power, 
                          first$Global_reactive_power, first$Voltage,
                          first$Global_intensity, first$Sub_metering_1, 
                          first$Sub_metering_2, first$Sub_metering_3))
names(data)<-c("Date","Global_active_power", "Global_reactive_power", 
               "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
               "Sub_metering_3")
data<-data[(66631:69510),]

png(filename="plot3.png",width=480,height=480)
plot.new()
plot(data$Date,data$Sub_metering_1, xlab="",ylab="Energy sub metering",points(data$Date,data$Sub_metering_1, col="black"),type="l")
points(data$Date,data$Sub_metering_2, col="red",type="l")
points(data$Date,data$Sub_metering_3, col="blue",type="l")
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
