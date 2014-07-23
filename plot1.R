#set working directory
setwd("~/Documents/ExData_Plotting2/")

#check if working directory is set correctly
getwd()
list.files()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#sum of emissions by year
sum_year <- aggregate(Emissions ~ year, data=NEI, sum)

plot(sum_year, xlab="Year", ylab="PM2.5 Emissions (tons)", 
     main="Total Emissions Change", xaxt="n")
axis(1, at=1999:2008)

#make plot
dev.copy(png, file="plot1.png")
dev.off()
