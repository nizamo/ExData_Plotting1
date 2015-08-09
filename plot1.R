#Project 1, Plotting plot 1
#Read table from the folder
data<- "./exdata-data-household_power_consumption/household_power_consumption.txt"
data1<-read.table(data,header=TRUE,sep=";", stringsAsFactors=FALSE,na.strings="?",
                  dec=".")

#Consider data from 1/2/2007 to 2/2/2007
subset_the_data<-data1[data1$Date %in% c("1/2/2007","2/2/2007"),]

#Change the data to numeric for creating histogram regarding to column Global_active_power
GAP<-as.numeric(subset_the_data$Global_active_power)


#Plotting graph 1
png("plot1.png", width=480, height=480)
hist(GAP,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

