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
### Plot 3
png("plot3.png", width=480, height=480, units="px")
par(mar=c(5,5,2,2))
plot(enersub$Sub_metering_1,enersub$time,type='n',ylab="Energy Sub Metering",xaxt='n',cex.axis=0.8,cex.lab=0.8)
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
lines(enersub$Sub_metering_1,enersub$time,col="black")
lines(enersub$Sub_metering_2,enersub$time,col="red")
lines(enersub$Sub_metering_3,enersub$time,col="blue")
legend("topright",legend=c("SubMetering_1","SubMetering_2","SubMetering_3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),cex=0.8)
dev.off()
