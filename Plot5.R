## Plot 5 - Exploratory Data Analysis - Week 4 assignement 

# 1.0 Set working directory
   setwd("C:\\Users\\Kin\\Desktop\\R files\\Data analysis\\Week4\\exdata-data-NEI_data")

#2.0 Import data into R
   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")
   str(NEI)

#3.0 Subset the data only for motors and Baltimore city
   Bal.mobile<-subset(NEI, NEI$type=="ON-ROAD" & NEI$fips=="24510" )        #Subset NEI
   # Make the year data as characters
   Bal.mobile$year<-as.character(Bal.mobile$year)

#4.0  Collapsing the data into a new data frame which sum Emission split by 'year'
  Bal.mob.df<-aggregate(Emissions~year,Bal.mobile,sum)
 

##5.0 GGplot
  par(mfrow=c(1,1))
  library(ggplot2)
  # Create a plot file
  png("plot5.png", width=1040, height=480)
 
 G<-ggplot(data=Bal.mob.df, aes(x=year, y=Emissions)) + 
   geom_bar(stat="identity",fill="red") + 
   ggtitle("Motor Vehicle Emissions in Baltimore,1999-2008")
   print(G)
 dev.off()
 
### Conclusion
  ## Motor vehicle emission in Baltimore city shows consistent reduction from 1999 to 2008.
