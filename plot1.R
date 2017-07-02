#
# Exploratory plot for global active power

# Load previously prepared data
load('power_data.rdata')

# Point device to a new PNG file
png(filename = 'plot1.png')

hist(rawSub$Global_active_power, main = 'Global Active Power', col = 'Red', xlab = 'Global Active Power (kilowatts)')

dev.off()

