raw_data <- read.table(
    "household_power_consumption.txt",
    sep=";",
    dec=".",
    na.strings = "?",
    header = TRUE,
    colClasses=c("character", "character", rep("numeric",7)))

data <- raw_data[(raw_data$Date == "1/2/2007" | raw_data$Date == "2/2/2007"), ]

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col="orange", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()