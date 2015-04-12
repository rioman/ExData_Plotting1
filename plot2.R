library(dplyr)

power.consumption <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", 
                                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power.consumption <- filter(power.consumption, Date == "1/2/2007" | Date == "2/2/2007")

power.consumption$datetime <- strptime(paste(power.consumption[,1], power.consumption[,2], sep = "-"), "%d/%m/%Y-%H:%M:%S")
png(filename = "plot2.png")
with(power.consumption, {plot(datetime, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
                         lines(datetime, Global_active_power)})
dev.off()