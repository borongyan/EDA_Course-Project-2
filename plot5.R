library(ggplot2)

#Read the rds data for PM2.5 Emissions and source classification code 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset vehicles data
vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicleSCC <- SCC[vehicle,]$SCC
vehicleNEIVal <- NEI[NEI$SCC %in% vehicleSCC,]
vehicleNEIBaltimoreVal <- subset(vehicleNEIVal, fips == "24510")
vehicleNEIBaltimoreTot <- aggregate(Emissions~year, vehicleNEIBaltimoreVal, sum)

# Make plot for emissions from motor vehicle related sources in Baltimore between 1999-2008 using ggplot2

g <- ggplot(aes(factor(year), Emissions), data = vehicleNEIBaltimoreTot)
g + geom_bar(stat = "identity", fill="#8DC435", colour="black", width=0.75)+
        theme_bw()+
        guides(fill = FALSE)+
        labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title = expression("PM"[2.5]*" Emissions from Motor Vehicle Sources Across Baltimore between 1999-2008"))

# Save the file to plot5.png
ggsave(file = "plot5.png")