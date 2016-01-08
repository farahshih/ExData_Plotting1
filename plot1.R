setwd("C:\\Code\\Coursera_DS\\04-EDA\\exdata-data-household_power_consumption")
mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings = "?",
                   stringsAsFactors = FALSE)

str(mydata)
head(mydata)
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
mydata$Time<-as.POSIXlt(mydata$Time,format="%H:%M:%S")
mydata$Time<-strftime(mydata$Time,"%H:%M:%S")

sub<-subset(mydata, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")))
png("plot1.png", width=480, height=480)
hist(sub$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
