## Load GGPLOT
library(ggplot2)

## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Set Factor Levels
NEI$year <- factor(NEI$year, labels = c(1999,2002,2005,2008))
NEI$type <- factor(NEI$type, labels = c("point", "nonpoint", "onroad", "nonroad"))
NEI$fips <- factor(NEI$fips)

## Subet NEI for LA and Baltimore
sLABal <- subset(NEI,NEI$fips == "24510" | NEI$fips == "06037")

## Merge with SCC
mLABal <- merge (sLABal,SCC,by="SCC")

## Subset by Motor Vehicles
mvLABal <- subset(mLABal,mLABal$SCC.Level.One == "Mobile Sources")

## Change Fips to Characters for Plot
mvLABal$fips[mvLABal$fips=="24510"] <- "Baltimore"
mvLABal$fips[mvLABal$fips=="06037"] <- "Los Angeles"

## Plot Results
p<-ggplot(mvLABal,aes(year,Emissions))
p + geom_point() + geom_smooth(aes(group=fips),method="lm")+facet_grid(.~fips)+theme_bw() +labs(x="Year")
ggsave(file="Plot6.png")