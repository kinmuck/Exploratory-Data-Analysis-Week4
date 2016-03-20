## Plot 4 - Exploratory Data Analysis - Week 4 assignement 

# 1.0 Set working directory
setwd("C:\\Users\\Kin\\Desktop\\R files\\Data analysis\\Week4\\exdata-data-NEI_data")

#2.0 Import data into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
str(NEI)

#3.0 Create a vectot to indicate which row in the SCC file relating to coal
  coal.vector<-grepl("Coal", SCC$EI.Sector,ignore.case = TRUE) 

#4.0  Subseting NEI and SCC to coal only
   #Subset SCC to coal labels only
  SCC.coal.code<-SCC[coal.vector,]    
   
  #Subset NEI to coal labels only, refering to SCC coal only rows
  coal<-subset(NEI, NEI$SCC %in% SCC.coal.code[,1])        #Subset NEI by data1 overlaps
  
  #set year as character
  coal$year<-as.character(coal$year)

#5.0 plot digram
  par(mfrow=c(1,1))
  
  library(ggplot2)
  
  png("plot4.png", width=1040, height=480)
  
  ggplot(data=coal, aes(x=year, y=Emissions, fill = type)) + 
    geom_bar(stat="identity") +
    #geom_bar(stat="identity",position = position_dodge()) + 
    ggtitle("U.S. Coal Combustion-Related Emissions: 1999-2008")
   
  dev.off()

  
