plot4<- function(){

data<-read.csv("household_power_consumption.txt", sep=";")
data<-split(data,data$Date)
cutData<-rbind(data$"1/2/2007",data$"2/2/2007")

cutData$Global_active_power<-as.numeric(as.character(cutData$Global_active_power))
cutData$Sub_metering_1<-as.numeric(as.character(cutData$Sub_metering_1))
cutData$Sub_metering_2<-as.numeric(as.character(cutData$Sub_metering_2))
cutData$Sub_metering_3<-as.numeric(as.character(cutData$Sub_metering_3))
cutData$Voltage<-as.numeric(as.character(cutData$Voltage))
cutData$Global_reactive_power<-as.numeric(as.character(cutData$Global_reactive_power))

dateTime<-strptime(paste(cutData$Date,cutData$Time),format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480, units="px")
par(mfcol=c(2,2))
with(cutData, {
	plot(dateTime,cutData$Global_active_power, type="l", ylab="Global Active Power",xlab="")
	axis(side=2,at=seq(0,6,by=2))
	plot(dateTime,cutData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
	lines(dateTime,Sub_metering_2,col="red")
	lines(dateTime,Sub_metering_3,col="blue")
	legend("topright",lty=1,legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"),col=c("black","red","blue"),bty= "n")
	plot(dateTime,cutData$Voltage,type="l",xlab="datetime",ylab="Voltage")
	plot(dateTime,cutData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
	
	})
dev.off()
}