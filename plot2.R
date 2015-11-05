#### plot2.R
#### Author: Gene Tuttle
#### Date:  11/5/2015
####
####  Create line chart and save to plot2.png

plotData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)

# subset of data to plot
SubPlot <- subset(plotData,Date=="1/2/2007" | Date=="2/2/2007" ) 

# create DateTime column 
 SubPlot$DT <- strptime(paste(SubPlot$Date, " " ,SubPlot$Time), "%d/%m/%Y %H:%M:%S")

# set up the file plot
png("plot2.png", width=480,height=480,units="px")

LineChartData <-subset(SubPlot,,c(DT,Global_active_power))
plot(LineChartData, type="l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()