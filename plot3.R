#
# Exploratory plot for global active power per day

# Load previously prepared data
load('power_data.rdata')

# Make sure data labels are in English
Sys.setlocale("LC_TIME", "English")

# Point device to a new PNG file
png(filename = 'plot3.png')

plot(x = rawSub$DateTime, y = rawSub$Sub_metering_1, type = 'l', ylab = 'Energy Sub Metering', xlab = '', pch = NA, col = 'black')
lines(x = rawSub$DateTime, y = rawSub$Sub_metering_2, type = 'l', col = 'red')
lines(x = rawSub$DateTime, y = rawSub$Sub_metering_3, type = 'l', col = 'blue')

legend("topright", 
       c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), 
       lty = c(1, 1, 1), 
       lwd = 1,
       pch = c(21, 21, 21))

dev.off()
