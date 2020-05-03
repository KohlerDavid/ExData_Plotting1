#Plot 4
# Load data
house <- read.table("~/household_power_consumption.txt", sep=";", header = T)

# subsettin data
sub_house<-subset(house,house$Date== "1/2/2007" | house$Date =="2/2/2007")

sub_house$Global_active_power<- as.numeric(sub_house$Global_active_power)

# merge Date and Time and identify it correclty 
sub_house$Date_Time<-paste(sub_house$Date,sub_house$Time)
sub_house$Date_Time<- as.POSIXct(sub_house$Date_Time,format = "%d/%m/%Y %H:%M:%S")

#Plot4

par(mfrow=c(2,2))
png("plot4.png", width=480, height=480)

#top left
with(sub_house, plot(Date_Time,Global_active_power, type = "l", 
                     xlab= "",ylab="Global Active Power (kilowatts)"))
#top right
with(sub_house, plot(Date_Time,Voltage, type = "l", 
                     xlab= "datetime",ylab="Voltage"))
#bottom left


with(sub_house,plot(Date_Time, Sub_metering_1, type= "n", xlab ="", 
                    ylab = "Energy sub metering", ))
points(sub_house$Date_Time,sub_house$Sub_metering_1,type = "l")
points(sub_house$Date_Time,sub_house$Sub_metering_2,type = "l", col="red")
points(sub_house$Date_Time,sub_house$Sub_metering_3,type = "l", col="blue")
legend("topright",col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1)



# bottom right

with(sub_house,plot(Date_Time,Global_reactive_power, type= "l", xlab ="datetime", ))

dev.off()