raw_data <- read.table(
    "household_power_consumption.txt",
    sep=";",
    dec=".",
    na.strings = "?",
    header = TRUE,
    colClasses=c("character", "character", rep("numeric",7)))

data <- raw_data[(raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007"), ]
date_time <- paste(data$Date, data$Time)
data$DateTime <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)

plot(data$DateTime, data$Sub_metering_1, 
     type = "l",
     col = 'black',
     xlab = "",
     ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')

legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()

