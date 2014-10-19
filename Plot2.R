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

### Begin Plot
### Plot 2
png("plot2.png", width=480, height=480, units="px")
par(mar=c(5,5,2,2))
plot(enersub$Global_active_power,enersub$time,type='n',xlab="Time",ylab="Global Active Power (Kilowatts)",xaxt='n',cex.axis=0.8)
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
lines(enersub$Global_active_power,enersub$time,xlab="",ylab="")
dev.off()
