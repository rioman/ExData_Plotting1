library(dplyr)

power.consumption <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", 
                                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power.consumption <- filter(power.consumption, Date == "1/2/2007" | Date == "2/2/2007")

power.consumption$datetime <- strptime(paste(power.consumption[,1], power.consumption[,2], sep = "-"), "%d/%m/%Y-%H:%M:%S")
png(filename = "plot3.png")
with(power.consumption, {plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
                         lines(datetime, Sub_metering_1)
                         lines(datetime, Sub_metering_2, col = "red")
                         lines(datetime, Sub_metering_3, col = "blue")
                         legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)})
dev.off()