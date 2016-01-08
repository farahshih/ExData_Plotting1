setwd("C:\\Code\\Coursera_DS\\04-EDA\\exdata-data-household_power_consumption")
mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",
                   stringsAsFactors = FALSE)

sub <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]
str(sub)

dt <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub$Global_active_power)

png("plot2.png", width=480, height=480)
plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

