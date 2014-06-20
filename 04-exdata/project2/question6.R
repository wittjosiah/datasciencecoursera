library(ggplot2)
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
#only los angeles county
la_county <- subset(NEI, NEI$fips=="06037")

#only vehicle-related sources
scc_ba <- balt_city$SCC
balt_city_vehicles <- subset(balt_city, scc_ba %in% vehicle_scc)
scc_la <- la_county$SCC
la_county_vehicles <- subset(la_county, scc_la %in% vehicle_scc)

#find total emissions each year
pm_balt_city <- ddply(balt_city_vehicles, .(year), summarise, total_emissions=sum(Emissions))
pm_la_county <- ddply(la_county_vehicles, .(year), summarise, total_emissions=sum(Emissions))

#merge data
pm_balt_city$area <- "Baltimore City"
pm_la_county$area <- "Los Angeles County"
pm_per_year <- rbind(pm_balt_city, pm_la_county)

#build plot
plot <- ggplot(pm_per_year, aes(year, total_emissions)) + 
  geom_point() + 
  facet_grid(.~area) +
  labs(y="Total PM(2.5) Emissions", title="PM(2.5) Emissions Per Year From Motor-Related Sources in Baltimore City and Los Angeles County")
ggsave(file="q6.png", width=254, height=127, units="mm")