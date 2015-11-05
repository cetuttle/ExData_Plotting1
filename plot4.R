#### plot4.R
#### Author: Gene Tuttle
#### Date:  11/5/2015
####
####  Create 4 panel graph and output to plot4.png 

# assume that default folder has data.
plotData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
SubPlot <- subset(plotData,Date=="1/2/2007" | Date=="2/2/2007" ) # create a subset of the data to be plotted
# create DateTime column 
 SubPlot$DT <- strptime(paste(SubPlot$Date, " " ,SubPlot$Time), "%d/%m/%Y %H:%M:%S")
 
 
 # set up the file plot
 png("plot4.png", width=480,height=480,units="px")

 # set up a 2 by 2 matrix plot
 par(mfrow=c(2,2))
#Plot 1,1 
with(SubPlot,plot(DT,as.numeric(Global_active_power), type="l",ylab = "Global Active Power (kilowatts)", xlab = ""))
#Plot 1,2
with(SubPlot,plot(DT,as.numeric( Voltage ), type="l",ylab = "Voltage", xlab = "datetime"))
#Plot 2,1
with(SubPlot,plot(DT,as.numeric(Sub_metering_1),type="l", xlab="",ylab="Energy sub metering"))
with(SubPlot,lines(DT,as.numeric(Sub_metering_2),type="l", col="red"))
with(SubPlot,lines(DT,as.numeric(Sub_metering_3),type="l", col="Blue"))
legend("topright",pch="_", col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#plot 2,2
with(SubPlot,plot(DT,as.numeric(  Global_reactive_power ), type="l",ylab="Global_reactive_power", xlab = "datetime"))
dev.off()