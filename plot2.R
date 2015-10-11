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

#Plot 2
png(file = "plot2.png")
par(mar = c(5,5,4,3))
with(need_data, plot(DateTime, Global_active_power, type = "l", xlab = "",
                     ylab = "Global Active Power (kilowatts)"))
dev.off()
