plot4 <- function(filename) {
  # filename : "household_power_consumption.txt"
  hpwcfull <- read.csv(filename, sep = ";", dec = ".")
  hpwc <- hpwcfull[hpwcfull$Date %in% c("1/2/2007","2/2/2007"),]
  hpwc$Date <- as.Date(hpwc$Date, "%d/%m/%Y")
  hpwc$Time <- strptime(with(hpwc, paste(Date,Time)), "%Y-%m-%d %H:%M:%S")
  hpwc$Global_active_power <- as.numeric(hpwc$Global_active_power)
  png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  plot(hpwc$Time,hpwc$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
  plot(hpwc$Time,hpwc$Voltage, type = "l",xlab = "datetime", ylab = "Voltage")
  plot(hpwc$Time,hpwc$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
  lines(hpwc$Time,hpwc$Sub_metering_2, type = "l", col = "red")
  lines(hpwc$Time,hpwc$Sub_metering_3, type = "l", col = "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  plot(hpwc$Time,hpwc$Global_reactive_power, type = "l",xlab = "datetime",ylab = "Global_reactive_power")
  dev.off() 
}