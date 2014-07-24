#set working directory
setwd("~/Documents/ExData_Plotting2/")

#check if working directory is set correctly
getwd()
list.files()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#dataset for Baltimore city
NEI_24510 <- subset(NEI, fips=="24510")

#split sum by years and plot
sum_year_24510 <- aggregate(Emissions ~ year + type, data=NEI_24510, sum)

library(ggplot2)
qplot(year, Emissions, data=sum_year_24510, facets=type~., binwidth=2, 
      xlab="year", ylab="PM2.5 Emissions (tons)", 
      main="Total Emissions Change in Baltimore by Type")

dev.copy(png,file="plot3.png")
dev.off()