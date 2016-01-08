setwd("C:\\Code\\Coursera_DS\\04-EDA\\exdata-data-household_power_consumption")
mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",
                   stringsAsFactors = FALSE)

sub <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
str(sub)

dt <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(sub$Sub_metering_1)
Sub_metering_2 <- as.numeric(sub$Sub_metering_2)
Sub_metering_3 <- as.numeric(sub$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(dt,Sub_metering_1 , type="n", xlab="", ylab="Energy sub metering")
lines(dt,Sub_metering_1 , type="l")
lines(dt,Sub_metering_2 , type="l",col="red")
lines(dt,Sub_metering_3 , type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd=2.5,col=c("black","red","blue"))

dev.off()

