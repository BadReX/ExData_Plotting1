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

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# plot at the top-left
plot(data$DateTime, data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# plot at the top-right
plot(data$DateTime, data$Voltage, 
     type = "l",
     xlab = "datetime", ylab = "Voltage")

# plot at the bottom-right
plot(data$DateTime, data$Sub_metering_1, 
     type = "l",
     col = 'black',
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')

legend("topright", 
       bty = 'n',
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

# plot at the the bottom-left
plot(data$DateTime, data$Global_reactive_power, 
     type = "l",
     col = 'black',
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

