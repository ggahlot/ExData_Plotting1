## Gaurav Gahlot 
## Step 1  
## Download and Unzip the file in Working Directory 
if (!file.exists("data.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip")
  unzip("data.zip")  
}


## Read File into a Data Table
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## Could not figure out , how to get and filter in same command. still searching , if you find it please email it to ggahlot@gmail.com

# Plot 1#
# globalActivePower <- as.numeric(subSetData$Global_active_power)
# png("plot1.png", width=480, height=480)
# hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# dev.off()

# Plot2
##Extract Time  
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subSetData$Global_active_power)
##Use local variables to genrate graph
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()