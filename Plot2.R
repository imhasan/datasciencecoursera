## Read Data
NEI <- readRDS("summarySCC_PM25.rds")

## Set Factor Levels
NEI$year <- factor(NEI$year, labels = c(1999,2002,2005,2008))
NEI$type <- factor(NEI$type, labels = c("point", "nonpoint", "onroad", "nonroad"))
NEI$fips <- factor(NEI$fips)

## Create Baltimore Subset
NEIBalt <- subset(NEI,NEI$fips == "24510")

## Compute Total Emissions By Year
db <- tapply(NEIBalt$Emissions, NEIBalt$year,FUN=sum)

## Plot Results
png("Plot2.png")
par(mar=c(5,5,2,2))
barplot(db,axes=FALSE,xlab="Years",ylab="Total Emissions (in Thousands)",ylim=c(0,4000))
axis(2,at=seq(0,4000,1000),labels=c(0,1000,2000,3000,4000))
dev.off()