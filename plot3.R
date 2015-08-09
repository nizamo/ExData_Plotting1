#project 1, plot 3
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


#Plotting graph 3
png("plot3.png", width=480, height=480)
plot(submeter1~data2$timeanddate, type="l",xlab="",ylab="Energy sub metering")
lines(submeter2~data2$timeanddate, type="l",col="red")
lines(submeter3~data2$timeanddate, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,lwd=2.5,col=c("black","red","blue"))

dev.off()