#set working directory
setwd("~/Documents/ExData_Plotting2/")

#check if working directory is set correctly
getwd()
list.files()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#find which SCC are corresponding to Coal
coal <- which(regexpr("Coal", SCC$Short.Name)>0)
SCC <- SCC$SCC[coal]
NEI_coal <- NEI[NEI$SCC%in%SCC,]

#split sum by years and plot
emiss_by_coal <- aggregate(Emissions ~ year, data=NEI_coal, sum)
plot(emiss_by_coal, xlab="Year", ylab="PM2.5 Emissions (tons)", 
     main="Total Emissions Change by Coal", xaxt="n")
axis(1, at=1999:2008)

dev.copy(png, file="plot4.png")
dev.off()