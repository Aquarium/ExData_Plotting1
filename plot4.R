#Loading the data
epc_data <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep=";", na.strings = "?")

#Cleaning data
epc_data$Date <- as.Date(epc_data$Date,"%d/%m/%Y")
need_data <- subset(epc_data, Date >= "2007-02-01" & Date <= "2007-02-02")
need_data$DateTime <- strptime(paste(need_data$Date,need_data$Time),
                               format = "%Y-%m-%d %H:%M:%S")

#Set locale
Sys.getlocale("LC_TIME")
Sys.setlocale(category = "LC_TIME", locale = "en_US.UTF-8")

#Plot 4
png(file = "plot4.png")
par(mar = c(5,4,4,2))
par(mfrow = c(2,2))
with(need_data,{
    plot(DateTime, Global_active_power, type = "l", xlab = "",
         ylab = "Global Active Power (kilowatts)")
    plot(DateTime, Voltage, type = "l", xlab = "datetime")
    plot(DateTime, Sub_metering_1, type = "l", xlab = "",
                         ylab = "Energy sub metering")
        points(DateTime, Sub_metering_2, type = "l", col = "red")
        points(DateTime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", pch = "——", col = c("black", "red", "blue"),
               box.lwd = 0,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()
