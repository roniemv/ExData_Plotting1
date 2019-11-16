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

## Creating the histogram
hist(data$Global_active_power,main="Global Active Power",xlab="Globa Active Power (kilowatts)",ylim=c(0,1200),col="red")
## Creating PNG file
dev.copy(png,file="plot1.png")
dev.off()