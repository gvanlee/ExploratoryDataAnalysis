#
# Exploratory plot for 4 detail plots

# Load previously prepared data
load('power_data.rdata')

# Make sure data labels are in English
Sys.setlocale("LC_TIME", "English")

# Point device to a new PNG file
png(filename = 'plot4.png')

par(mfrow = c(2, 2))

# Top left graph, global active power
plot(x = rawSub$DateTime, y = rawSub$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '', pch = NA)

# Top right, voltage
plot(x = rawSub$DateTime, y = rawSub$Voltage, type = 'l', ylab = 'Voltage', xlab = 'datetime', pch = NA)

# Bottom left, sub metering
plot(x = rawSub$DateTime, y = rawSub$Sub_metering_1, type = 'l', ylab = 'Energy Sub Metering', xlab = '', pch = NA, col = 'black')
lines(x = rawSub$DateTime, y = rawSub$Sub_metering_2, type = 'l', col = 'red')
lines(x = rawSub$DateTime, y = rawSub$Sub_metering_3, type = 'l', col = 'blue')

legend("topright", 
       c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), 
       lty = c(1, 1, 1), 
       lwd = 1,
       pch = c(21, 21, 21))

# Bottom right, global reactive power
plot(x = rawSub$DateTime, y = rawSub$Global_reactive_power, type = 'l', xlab = 'datetime', pch = NA)

dev.off()