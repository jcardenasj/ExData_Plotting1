# plot2
df <- read.table(file = "household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
df$Datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

plot(x = df$Datetime, y = df$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()