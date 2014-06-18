library(plyr)

#read datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get vehicle-related source classification codes
sectors <- SCC$EI.Sector
scc_vehicle_sectors <- subset(SCC, sectors %in% unique(grep("On-Road", sectors, value = T)))
vehicle_scc <- scc_vehicle_sectors$SCC

#only baltimore city
balt_city <- subset(NEI, NEI$fips=="24510")

#only vehicle-related sources
scc <- balt_city$SCC
balt_city_vehicles <- subset(balt_city, scc %in% vehicle_scc)

#find total emissions each year
pm_per_year <- ddply(balt_city_vehicles, .(year), summarise, total_emissions=sum(Emissions))

#build plot
png("q5.png", width=640, height=640)
plot(pm_per_year$year, pm_per_year$total_emissions, xlab="Year", ylab="Total PM(2.5) Emissions")
title(main="Total Emissions of PM(2.5) Per Year from Vehicle-Related Sources in Baltimore City")
dev.off()