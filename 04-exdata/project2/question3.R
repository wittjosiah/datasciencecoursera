library(ggplot2)
library(plyr)

#read datasets
NEI <- readRDS("summarySCC_PM25.rds")

#only baltimore city
balt_city <- subset(NEI, NEI$fips=="24510")

#find total emissions each year
pm_year_type <- ddply(balt_city, .(year, type), summarise, total_emissions=sum(Emissions))

#build plot
plot <- ggplot(pm_year_type, aes(year, total_emissions)) + 
  geom_point() + 
  facet_grid(.~type) +
  labs(y="Total PM(2.5) Emissions", title="PM(2.5) Emissions Per Year in Baltimore City by Source")
ggsave(file="q3.png", width=254, height=127, units="mm")