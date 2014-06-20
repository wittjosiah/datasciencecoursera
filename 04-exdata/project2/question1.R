library(plyr)

#read datasets
NEI <- readRDS("summarySCC_PM25.rds")

#find total emissions each year
pm_per_year <- ddply(NEI, .(year), summarise, total_emissions=sum(Emissions))

#build plot
png("q1.png", width=480, height=480)
plot(pm_per_year$year, pm_per_year$total_emissions, xlab="Year", ylab="Total PM(2.5) Emissions")
title(main="Total Emissions of PM(2.5) Per Year")
dev.off()