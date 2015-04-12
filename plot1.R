library(dplyr)

power.consumption <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings = "?", 
                                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
power.consumption <- filter(power.consumption, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png")
hist(power.consumption$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()