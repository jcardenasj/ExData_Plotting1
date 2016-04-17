# plot1
df <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
df$Datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

hist(df$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", 
     col = "red")

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()