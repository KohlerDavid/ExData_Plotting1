# Load data
house <- read.table("~/household_power_consumption.txt", sep=";", header = T)

# subsettin data
sub_house<-subset(house,house$Date== "1/2/2007" | house$Date =="2/2/2007")
str(sub_house)
#numeric data
sub_house$Global_active_power<- as.numeric(sub_house$Global_active_power)

#Plot1

png("plot1.png", width=480, height=480)

hist(sub_house$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()