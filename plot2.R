#Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
#system to make a plot answering this question.

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
sum_year_24510 <- aggregate(Emissions ~ year, data=NEI_24510, sum)

plot(sum_year_24510, xlab="Year", ylab="PM2.5 Emissions (tons)", 
     main="Total Emission Change in Baltimore", xaxt="n")
axis(1, at=1999:2008)

dev.copy(png, file="plot2.png")
dev.off()