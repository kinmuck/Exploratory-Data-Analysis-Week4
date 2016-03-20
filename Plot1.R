## Plot 1 - Exploratory Data Analysis - Week 4 assignement 

# 1.0 Set working directory
setwd("C:\\Users\\Kin\\Desktop\\R files\\Data analysis\\Week4\\exdata-data-NEI_data")

#2.0 Import data into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#3.0 Check to see if there are any missing values or na
 n_na<-is.na(NEI$Emissions)
 mean(n_na)
 #the mean is 0, so there is no missing values for Emmissions
 
#4.0 Create a vector with total emmssion by year for all SCC 
   em_year<-with(NEI,tapply(Emissions,year,sum))
   str(em_year)
   names(em_year)
   
#5.0 Plot
   png("Plot1.png",, width=1040, height=480)
   G<-barplot(em_year, main = "Total Emissions by Year", xlab="Year", ylab="Emissions",col="red")
   print(G)
   dev.off()

### Conclusion
  #The bar plot shows that the total emmssion consistently reducing from 1999 to 2008
  
##
  
