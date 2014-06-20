library(plyr)

#read datasets
NEI <- readRDS("summarySCC_PM25.rds")

#only baltimore city
balt_city <- subset(NEI, NEI$fips=="24510")

#find total emissions each year
pm_per_year <- ddply(balt_city, .(year), summarise, total_emissions=sum(Emissions))

#build plot
png("q2.png", width=480, height=480)
plot(pm_per_year$year, pm_per_year$total_emissions, xlab="Year", ylab="Total PM(2.5) Emissions")
title(main="Total Emissions of PM(2.5) Per Year in Baltimore City")
dev.off()