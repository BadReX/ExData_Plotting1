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

png(filename = "plot2.png", width = 480, height = 480)

plot(data$DateTime, data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

