#
# Assignment for Exploratory data analysis, week 1
#

require(downloader)
require(lubridate)

remoteFile <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
localFile <- 'power.zip'

if (! file.exists(localFile)) {
  download(remoteFile,
           destfile = localFile)

  unzip(localFile)
}

localFile <- 'household_power_consumption.txt'

# First read data and create our subset
rawData <- read.csv(localFile, sep = ';', stringsAsFactors = FALSE)
rawSub <- subset(rawData, rawData$Date == '1/2/2007' | rawData$Date == '2/2/2007')

# Clean things up a bit
rawSub$DateTime <- dmy_hms(paste(rawSub$Date, rawSub$Time))
rawSub$Date <- dmy(rawSub$Date)
rawSub$Time <- hms(rawSub$Time)

rawSub$Global_active_power <- as.numeric(rawSub$Global_active_power)
rawSub$Global_intensity <- as.numeric(rawSub$Global_intensity)
rawSub$Global_reactive_power <- as.numeric(rawSub$Global_reactive_power)
rawSub$Voltage <- as.numeric(rawSub$Voltage)
rawSub$Sub_metering_1 <- as.numeric(rawSub$Sub_metering_1)
rawSub$Sub_metering_2 <- as.numeric(rawSub$Sub_metering_2)
rawSub$Sub_metering_3 <- as.numeric(rawSub$Sub_metering_3)

# Write our tidy data for easier retrieval
tidyFile <- 'power_data.rdata'
save('rawSub', file = tidyFile)

