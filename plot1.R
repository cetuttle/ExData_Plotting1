#### plot1.R
#### Author: Gene Tuttle
#### Date:  11/5/2015
####
####  Create histogram and save to plot1.png


plotData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
SubPlot <- subset(plotData,Date=="1/2/2007" | Date=="2/2/2007" ) # create a subset of the data to be plotted

# set up the file plot
png("plot1.png", width=480,height=480,units="px")

 #Plot 
hist(as.numeric(SubPlot$Global_active_power)/1000,col="red" , main = "Global Active Power",  xlab = "Global Active Power (kilowatts)")

dev.off()

