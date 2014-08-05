plot2<- function(){

data<-read.csv("household_power_consumption.txt", sep=";")
data<-split(data,data$Date)
cutData<-rbind(data$"1/2/2007",data$"2/2/2007")
cutData$Global_active_power<-as.numeric(as.character(cutData$Global_active_power))
dateTime<-strptime(paste(cutData$Date,cutData$Time),format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480, units="px")
with(cutData,plot(dateTime,cutData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
}
