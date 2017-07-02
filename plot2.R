#
# Exploratory plot for global active power per day

# Load previously prepared data
load('power_data.rdata')

# Make sure data labels are in English
Sys.setlocale("LC_TIME", "English")

# Point device to a new PNG file
png(filename = 'plot2.png')

plot(x = rawSub$DateTime, y = rawSub$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '', pch = NA)

dev.off()

