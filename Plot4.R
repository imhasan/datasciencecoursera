## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Set Factor Levels
NEI$year <- factor(NEI$year, labels = c(1999,2002,2005,2008))
NEI$type <- factor(NEI$type, labels = c("point", "nonpoint", "onroad", "nonroad"))
NEI$fips <- factor(NEI$fips)

## Merge Files by SCC
NEISCC <- merge(NEI,SCC,by="SCC")

## Subset by Coal Combustion Sources
subCoal <- subset(NEISCC, NEISCC$EI.Sector == "Fuel Comb - Electric Generation - Coal" | NEISCC$EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal" | NEISCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal" )

## Compute Total Emissions from coal
coal <- tapply(subCoal$Emissions,subCoal$year, FUN=sum)

## Plot Results
png("Plot4.png")
par(mar=c(4,5,1,1))
barplot(coal,axes=FALSE,xlab="Years",ylab="Total Emissions from Coal Combustion \n (In Thousands)",ylim=c(0,600000))
axis(2,at=seq(0,600000,200000),labels=c(0,2,4,6))
dev.off()