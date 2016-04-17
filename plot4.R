# plot4
df <- read.table(file = "household_power_consumption.txt", sep = ";", 
                 header = TRUE, na.strings = "?")
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
df$Datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

#plot1
plot(x = df$Datetime, y = df$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l")

#plot2
plot(x = df$Datetime, y = df$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

#plot3
plot(x = df$Datetime, y = df$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l")
points(x = df$Datetime, y = df$Sub_metering_2, type = "l", col = "red")
points(x = df$Datetime, y = df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = "solid", col = c("black", "red", "blue"), cex = 0.5,
       text.width = 60000)

#plot4
plot(x = df$Datetime, y = df$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")


dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()