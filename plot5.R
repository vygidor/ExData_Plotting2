#set working directory
setwd("~/Documents/ExData_Plotting2/")

#check if working directory is set correctly
getwd()
list.files()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#dataset for Baltimore city
NEI_24510 <- subset(NEI, fips=="24510") 

#emissions from motor vehicle
vehicles <- which(regexpr("Vehicles", SCC$Short.Name)>0)
SCC_veh <- SCC$SCC[vehicles]
NEI_24510_vehicles <- NEI_24510[NEI_24510$SCC%in%SCC_veh,]

#split sum by years and plot
emiss_veh <- aggregate(Emissions ~ year, data=NEI_24510_vehicles, sum)
plot(emiss_veh, xlab="year", ylab="PM2.5 Emissions (tons)", 
     main="Total Emissions Change by Vehicle in Baltimore", xaxt="n")
axis(1, at=1999:2008)

dev.copy(png, file="plot5.png")
dev.off()