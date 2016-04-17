# plot3
df <- read.table(file = "household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
df$Datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

plot(x = df$Datetime, y = df$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l")
points(x = df$Datetime, y = df$Sub_metering_2, type = "l", col = "red")
points(x = df$Datetime, y = df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = "solid", col = c("black", "red", "blue"), cex = 0.7,
       text.width = 40000)

dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()