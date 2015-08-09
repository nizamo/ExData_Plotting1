#project 1, plot 4
# read table from the folder
data<- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data1<-read.table(data,header=TRUE,sep=";", stringsAsFactors=FALSE,na.strings="?",
                  dec=".")

#Subset the date to Date/Time classes
data1$Date<-as.Date(data1$Date, format="%d/ %m/ %Y")

#new subset dates
data2<- subset(data1, subset=(Date>="2007/02/01" & Date<="2007/02/02"))


#converting dates
timeanddate<-paste(as.Date(data2$Date),data2$Time)
data2$timeanddate<- as.POSIXct(timeanddate)

submeter1<-as.numeric(data2$Sub_metering_1)
submeter2<-as.numeric(data2$Sub_metering_2)
submeter3<-as.numeric(data2$Sub_metering_3)


#Plotting all 4 graph a,b,c,d
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#graph a
plot(data2$Global_active_power~data2$timeanddate,type="l",xlab="",ylab="Global Active Power", cex=0.2)


#graph b
plot(data2$Voltage~data2$timeanddate,type="l",xlab="datetime",ylab="Voltage")


#graph c
plot(submeter1~data2$timeanddate, type="l",xlab="",ylab="Energy sub metering")
lines(submeter2~data2$timeanddate, type="l",col="red")
lines(submeter3~data2$timeanddate, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd=2.5,col=c("black","red","blue"))

#graph d
plot(data2$Global_reactive_power~data2$timeanddate,type="l",xlab="datetime",ylab="Global_reactive_power")


dev.off()