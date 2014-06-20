library(plyr)

#read datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get coal-related source classification codes
sectors <- SCC$EI.Sector
scc_coal_sectors <- subset(SCC, sectors %in% unique(grep("Coal", sectors, value = T)))
coal_scc <- scc_coal_sectors$SCC

#only coal-related sources
scc <- NEI$SCC
coal <- subset(NEI, scc %in% coal_scc)

#find total emissions each year
pm_per_year <- ddply(coal, .(year), summarise, total_emissions=sum(Emissions))

#build plot
png("q4.png", width=480, height=480)
plot(pm_per_year$year, pm_per_year$total_emissions, xlab="Year", ylab="Total PM(2.5) Emissions")
title(main="Total Emissions of PM(2.5) Per Year from Coal-Related Sources")
dev.off()