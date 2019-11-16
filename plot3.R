library(lubridate)
## Import the data from the file
data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",stringsAsFactors = FALSE)
## Convert Date column to date format
data$Date<-as.Date(data$Date,"%d/%m/%Y")
## Subseting the data for dates  2007-02-01 and 2007-02-02
data<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
## Combine Date and Time
data$Date_Time<-paste(data$Date,data$Time)
## Convert Date and Time column to date format
data$Date_Time<-ymd_hms(data$Date_Time)
## Converting Global active power to numeric
data$Global_active_power<-as.character(data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)

## Create the plot

with(data,plot(Date_Time,Sub_metering_1,type="n",xlab='',ylab="Energy sub metering"))
points(data$Date_Time,data$Sub_metering_1,type="s")
points(data$Date_Time,data$Sub_metering_2,type="s",col="red")
points(data$Date_Time,data$Sub_metering_3,type="s",col="blue")
## Add legend to the plot
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
## Creating PNG file
dev.copy(png,file="plot3.png")
dev.off()