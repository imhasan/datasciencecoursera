## Load GGPLOT
library(ggplot2)

## ## Read Data
NEI <- readRDS("summarySCC_PM25.rds")

## Set Factor Levels
NEI$year <- factor(NEI$year, labels = c(1999,2002,2005,2008))
NEI$type <- factor(NEI$type, labels = c("point", "nonpoint", "onroad", "nonroad"))
NEI$fips <- factor(NEI$fips)

## Create Baltimore Subset Using Type
NEIBalt <- subset(NEI,NEI$fips == "24510")

## Plot Results
p <- ggplot(NEIBalt,aes(year,Emissions))
p + geom_point() + geom_smooth(aes(group=type),method="lm")+facet_grid(.~type)+theme_bw()
ggsave(file="Plot3.png")
