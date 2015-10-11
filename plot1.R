#Loading the data
epc_data <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep=";", na.strings = "?")
epc_data$Date <- as.Date(epc_data$Date,"%d/%m/%Y")
need_data <- subset(epc_data, Date >= "2007-02-01" & Date <= "2007-02-02")

#Plot 1
png(file = "plot1.png")
par(mar = c(5,5,4,2))
hist(need_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
