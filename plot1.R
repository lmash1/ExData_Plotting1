plot1<- function(){

data<-read.csv("household_power_consumption.txt", sep=";")
data<-split(data,data$Date)
cutData<-rbind(data$"1/2/2007",data$"2/2/2007")
cutData$Global_active_power<-as.numeric(as.character(cutData$Global_active_power))

png("plot1.png", width=480, height=480, units="px")
with(cutData,hist(Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
dev.off()

}