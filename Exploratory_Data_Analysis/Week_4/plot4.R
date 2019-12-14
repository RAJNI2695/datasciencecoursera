NEI <- readRDS("C:\\Users\\WELCOME\\Desktop\\coursera\\exdata_data_NEI_data (1)\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\WELCOME\\Desktop\\coursera\\exdata_data_NEI_data (1)\\Source_Classification_Code.rds")
setwd("C:\\Users\\WELCOME\\Desktop\\coursera\\exdata_data_NEI_data (1)")
png("plot4.png", width = 480, height = 480)
coal  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
SCC_Coal <- SCC[coal, ]
NEI_SCC_Merge <- merge(NEI, SCC_Coal, by="SCC")
Emissions <- tapply(NEI_SCC_Merge$Emissions, NEI_SCC_Merge$year, sum)
barplot(Emissions, xlab = "Year", ylab = "Total Emissions PM2.5 Tons", 
        main = "Total Coal Emissions by year", col = c("RED","BLUE","GREEN","YELLOW"))
dev.off()