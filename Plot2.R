## Plot 2 - Exploratory Data Analysis - Week 4 assignement 

# 1.0 Set working directory
setwd("C:\\Users\\Kin\\Desktop\\R files\\Data analysis\\Week4\\exdata-data-NEI_data")

#2.0 Import data into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#3.0 Subset the data to limit to Baltimore city
 B_NEI<-subset(NEI,fips=="24510")
 
 
#4.0  Create a vector with total emmssion by year for all SCC 
  #Using tapply to sum emission
  B_em_year<-with(B_NEI,tapply(Emissions,year,sum))
  #Barplot 
   png("Plot2.png", width=1040, height=480)
   G<-barplot(B_em_year, main = "Blatimore City emissions by Year", xlab="Year", ylab="Emissions",col="blue")
   print(G)
   dev.off()
   
####  Conclusion
  #The bar plot shows that Baltime Citi emmssion did not show a consistently reducing trend from 1999 to 2008
####
  
