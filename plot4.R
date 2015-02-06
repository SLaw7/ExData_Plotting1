table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2880, skip = 66636, stringsAsFactors = FALSE)
table2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 5, stringsAsFactors = FALSE)
names(table) <- names(table2)
table <- cbind("Date_Time" = strptime(paste(table[,1],table[,2]), "%d/%m/%Y %H:%M:%S"),table)

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol = c(2,2), mar = c(6, 4, 4, 3), cex = .75)
##plot1
plot(table$Global_active_power ~ table$Date_Time, type = "n", xlab = "", ylab = "Global Active Power" )
lines(table$Date_Time, table$Global_active_power)
##plot2
plot(table$Sub_metering_1 ~ table$Date_Time, type = "n", xlab = "", ylab = "Energy Sub metering" )
lines(table$Date_Time, table$Sub_metering_1, col = "black")
lines(table$Date_Time, table$Sub_metering_2, col = "red")
lines(table$Date_Time, table$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1, bty = "n")
##plot3
plot(table$Voltage ~ table$Date_Time, type = "n", xlab = "datetime", ylab = "Voltage" )
lines(table$Date_Time, table$Voltage)
##plot4
plot(table$Global_reactive_power ~ table$Date_Time, type = "n", xlab = "datetime", ylab = "Global_reactive_power" )
lines(table$Date_Time, table$Global_reactive_power)

dev.off()