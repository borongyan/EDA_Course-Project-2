## Read the rds data for PM2.5 Emissions
   NEI <- readRDS("summarySCC_PM25.rds")

   x0 <- NEI$Emissions / 10^6
   yR <- NEI$year
   emissions <- aggregate(x0 ~ yR, NEI, sum)
   names(emissions) <- c("Year", "Emissions")

## Create PNG graphic device
   png(filename="plot1.png", width=480, height=480)

## Plot the total PM2.5 Emissions from all United States sources   
   plot(emissions, xlab="Year", ylab="Emissions ", type="b", pch=19, lty=1, col="blue")
   title(main=expression(PM[2.5] * " Total Emissions"))
   
 ## Close graphic device
   dev.off()