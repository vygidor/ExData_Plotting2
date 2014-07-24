#set working directory
setwd("~/Documents/ExData_Plotting2/")

#check if working directory is set correctly
getwd()
list.files()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## emissions from motor vehicle
vehicles <- which(regexpr("Vehicles", SCC$Short.Name)>0)
SCC_veh <- SCC$SCC[vehicles]
NEI_vehicles <- NEI[NEI$SCC%in%SCC_veh,]

## emission in Baltimore City and California
NEI_bcc <- NEI_vehicles[NEI_vehicles$fips %in% c("24510","06037"),]

## split emissions by year and add a city column
NEI_bcc_year <- aggregate(Emissions ~ year + fips, data=NEI_bcc, sum)
NEI_bcc_year[NEI_bcc_year$fips=="24510",4] <- "Baltimore City"
NEI_bcc_year[NEI_bcc_year$fips=="06037",4] <- "California"
colnames(NEI_bcc_year)[4] <- "city"


library(ggplot2)
qplot(year, Emissions, data=NEI_bcc_year, col=city, xlab="year", 
      ylanb="PM2.5 Emissions (tons)", 
      main="Emissions Change by Vehicle in Baltimore City and California")

dev.copy(png, file="plot6.png")
dev.off()