## Plot 3 - Exploratory Data Analysis - Week 4 assignement 

# 1.0 Set working directory
  setwd("C:\\Users\\Kin\\Desktop\\R files\\Data analysis\\Week4\\exdata-data-NEI_data")

#2.0 Import data into R
   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")

#3.0  Subset the data to limit to Baltimore city
 B_NEI<-subset(NEI,fips=="24510")
  
#4.0 Sum over all sources by year
 B_emission_year<-aggregate(year+type~Emissions,B_NEI,sum)
 B_emission_year$year<-as.character(B_emission_year$year)

#5.0 plot everything
  
  library(ggplot2)
 png("plot3.png", width=1040, height=480)
 
 G<-ggplot(data=B_emission_year, aes(y=Emissions,x=year,fill=type))+
    geom_bar(stat="identity", position="dodge")+
    ggtitle("Baltimore City emmisson by year")
 print(G)
 dev.off()
 
  

  
