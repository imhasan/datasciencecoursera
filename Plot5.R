## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Set Factor Levels
NEI$year <- factor(NEI$year, labels = c(1999,2002,2005,2008))
NEI$type <- factor(NEI$type, labels = c("point", "nonpoint", "onroad", "nonroad"))
NEI$fips <- factor(NEI$fips)

## Create Baltimore Subset
NEIBalt <- subset(NEI,NEI$fips == "24510")

## Merge Baltimore with SCC
merBal <- merge(NEIBalt,SCC, by = "SCC")

## Subset by Motor Vehicle Sources - Mobile Sources
yBal <- subset(merBal, merBal$SCC.Level.One == "Mobile Sources")

## Compute Emissions from Motor Vehicles
yBal$year <- factor(yBal$year)
mot <- tapply(yBal$Emissions, yBal$year, FUN=sum)

## Plot Resuls
png("Plot5.png")
par(mar=c(5,5,2,2))
barplot(mot,axes=FALSE,xlab="Years",ylab ="Emissions from Motor Vehicles (in Thousands)", ylim=c(0,2000))
axis(2,at=seq(0,2000,500),labels=c(0,500,1000,1500,2000))
dev.off()





par(mar=c(5,5,2,2))
barplot(db,axes=FALSE,xlab="Years",ylab="Total Emissions (in Thousands)",ylim=c(0,4000))
axis(2,at=seq(0,4000,1000),labels=c(0,1000,2000,3000,4000))
dev.off()