plot3<- function(){

data<-read.csv("household_power_consumption.txt", sep=";")
data<-split(data,data$Date)
cutData<-rbind(data$"1/2/2007",data$"2/2/2007")

cutData$Sub_metering_1<-as.numeric(as.character(cutData$Sub_metering_1))
cutData$Sub_metering_2<-as.numeric(as.character(cutData$Sub_metering_2))
cutData$Sub_metering_3<-as.numeric(as.character(cutData$Sub_metering_3))

dateTime<-strptime(paste(cutData$Date,cutData$Time),format="%d/%m/%Y %H:%M:%S")


png("plot3.png", width=480, height=480, units="px")
with(cutData,plot(dateTime,cutData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(cutData,lines(dateTime,Sub_metering_2,col="red"))
with(cutData,lines(dateTime,Sub_metering_3,col="blue"))

legend("topright",lty=1,legend=c("Sub_metering_1","Sub_Metering_2","Sub_Metering_3"),col=c("black","red","blue"))
dev.off()
}
