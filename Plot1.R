## Read Data
NEI <- readRDS("summarySCC_PM25.rds")

## Set Factors
NEI$year <- factor(NEI$year, labels = c(1999,2002,2005,2008))
NEI$type <- factor(NEI$type, labels = c("point", "nonpoint", "onroad", "nonroad"))
NEI$fips <- factor(NEI$fips)

## Compute Total Emissions by Year
d <- tapply(NEI$Emissions, NEI$year,FUN=sum)

## Plot Results
png("Plot1.png")
par(mar=c(5,5,2,1))
barplot(d,axes=FALSE,xlab="Years",ylab="Total Emissions from PM2.5 (in Millions)",ylim=c(0,8e+06))
axis(2,at=seq(0,8000000,2000000),labels=c(0,2,4,6,8))
dev.off()

