## Plot 6 - Exploratory Data Analysis - Week 4 assignement 

# 1.0 Set working directory
   setwd("C:\\Users\\Kin\\Desktop\\R files\\Data analysis\\Week4\\exdata-data-NEI_data")

#2.0 Import data into R
   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")
     head(NEI)
     str(NEI)

#3.0 Subset the data only for motors and the 2 cities
   mob.data<-subset(NEI, NEI$type=="ON-ROAD" & (NEI$fips=="24510" | NEI$fips=="06037" ))        #Subset NEI
  # Make the year data as characters
   mob.data$year<-as.character(mob.data$year)
   str(mob.data)

##4.0  Collapsing the data into a new data frame which sum Emission split by 'year' and 'fips'
  mob.df<-aggregate(mob.data$Emissions,list(year=mob.data$year,fips=mob.data$fips),sum)
  # Rename the sum of Emissions as 'Emission' 
  names(mob.df)[names(mob.df)=="x"]<-"Emissions"
  # Replace the fip codes into city names
  mob.df$fips<-gsub("24510","Baltimore",mob.df$fips)
  mob.df$fips<-gsub("06037","Los Angeles County",mob.df$fips)

##5.0 GGplot
  library(ggplot2)
  # Create a plot file
   png("plot6.png", width=1040, height=480)
   
   G<-ggplot(data=mob.df, aes(x=year, y=Emissions,fill=fips)) + 
   facet_grid(.~fips)+
   geom_bar(stat="identity") + 
   ggtitle("Total Emissions from motor vehicle in Baltimore City & Los Angeles 1999-2008")

    print(G)
    dev.off()
 

