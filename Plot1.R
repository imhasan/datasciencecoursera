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
### Plot 1
png("plot1.png", width=480, height=480, units="px")
par(mar=c(5,5,2,1))
hist(enersub$Global_active_power, freq = TRUE, breaks = 16, col = 'red', xlab = 'Global Active Power (Kilowatts)', main ='Global Active Power', xaxt='n',yaxt ='n',cex.axis=0.8,cex.lab=0.8,cex.main=1.0, scales = list(cex=0.8))
axis(1,at=c(0,2,4,6),labels=c("0","2","4","6"))
axis(2,at=c(0,200,400,600,800,1000,1200),labels=c("0","200","400","600","800","1000","1200"))
dev.off()
