table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2880, skip = 66636, stringsAsFactors = FALSE)
table2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 5, stringsAsFactors = FALSE)
names(table) <- names(table2)
table <- cbind("Date_Time" = strptime(paste(table[,1],table[,2]), "%d/%m/%Y %H:%M:%S"),table)

png(filename = "plot1.png", width = 480, height = 480)
hist(table$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
dev.off()