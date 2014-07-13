first<-read.table("household_power_consumption.txt", header= T,sep=";",na.strings="?")
first<-na.omit(first)
Date<-strptime(first$Date,format="%d/%m/%Y ")
Date<-as.data.frame(Date)
data<-as.data.frame(cbind(Date,first$Time,first$Global_active_power, 
                          first$Global_reactive_power, first$Voltage,
                          first$Global_intensity, first$Sub_metering_1, 
                          first$Sub_metering_2, first$Sub_metering_3))
names(data)<-c("Date","Time","Global_active_power", "Global_reactive_power", 
               "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
               "Sub_metering_3")
               ## For Some reason it calculates the day AFTER the date i have entered...
               ## For example, Inserted >=2007-01-31 and it chooses from >= 2007-02-01
data<-subset(data,as.Date(Date) >= '2007-01-31' & as.Date(Date)<='2007-02-01')

png(filename="plot1.png",width=480,height=480)
hist(as.numeric(data$Global_active_power),col="red" ,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
