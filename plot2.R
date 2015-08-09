#project 1, plot 2
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


#Plotting graph 2
png("plot2.png", width=480, height=480)
plot(data2$Global_active_power~data2$timeanddate, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()