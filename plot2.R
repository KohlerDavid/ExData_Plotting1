#Plot2

# Load data
house <- read.table("~/household_power_consumption.txt", sep=";", header = T)

# subsettin data
sub_house<-subset(house,house$Date== "1/2/2007" | house$Date =="2/2/2007")

# merge Date and Time and identify it correclty 
sub_house$Date_Time<-paste(sub_house$Date,sub_house$Time)
sub_house$Date_Time<- as.POSIXct(sub_house$Date_Time,format = "%d/%m/%Y %H:%M:%S")


#Plot2
png("plot2.png", width=480, height=480)
with(sub_house, plot(Date_Time,Global_active_power, type = "l", 
                     xlab= "",ylab="Global Active Power (kilowatts)"))

dev.off()