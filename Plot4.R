### Load the data
energy <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
### Subset data for Feb 1 and 2
enersub <- subset(energy, energy$Date == "1/2/2007" | energy$Date == "2/2/2007")
### Check data
head(enersub)
### Convert data
enersub$Global_active_power <- as.numeric(as.character(enersub$Global_active_power))
enersub$Global_reactive_power <- as.numeric(as.character(enersub$Global_reactive_power))
enersub$Voltage <- as.numeric(as.character(enersub$Voltage))
enersub$Global_intensity <- as.numeric(as.character(enersub$Global_intensity))
enersub$Sub_metering_1 <- as.numeric(as.character(enersub$Sub_metering_1))
enersub$Sub_metering_2 <- as.numeric(as.character(enersub$Sub_metering_2))
enersub$Sub_metering_3 <- as.numeric(as.character(enersub$Sub_metering_3))

### Begin Plots
### Plot 4
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
# Part 1
par(mar=c(4,4,2,2))
plot(enersub$Global_active_power,enersub$time,type='n',xlab = " ",ylab="Global Active Power",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
lines(enersub$Global_active_power,enersub$time,xlab="Test",ylab="Other")

# Part 2
par(mar=c(4,4,2,2))
plot(enersub$Voltage,enersub$time,type='n',xlab="DateTime",ylab="Voltage",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
lines(enersub$Voltage,enersub$time,xlab="Test",ylab="Other")
lines(enersub$Voltage,enersub$time,xlab="Test",ylab="Other")

# Part 3
par(mar=c(4,4,2,2))
plot(enersub$Sub_metering_1,enersub$time,type='n',xlab="",ylab="Global Sub Metering",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
lines(enersub$Sub_metering_1,enersub$time,col="black")
lines(enersub$Sub_metering_2,enersub$time,col="red")
lines(enersub$Sub_metering_3,enersub$time,col="blue")
legend("topright",legend=c("SubMetering_1","SubMetering_2","SubMetering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),cex=0.4)

# Part 4
par(mar=c(4,4,2,2))
plot(enersub$Global_reactive_power,enersub$time,type='n',xlab = "Date Time",ylab="Global Reactive Power",xaxt='n')
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
lines(enersub$Global_reactive_power,enersub$time,xlab="Test",ylab="Other")
dev.off()
