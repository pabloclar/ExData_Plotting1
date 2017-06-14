plot2 <- function(filename) {
  # filename : "household_power_consumption.txt"
  hpwcfull <- read.csv(filename, sep = ";", dec = ".")
  hpwc <- hpwcfull[hpwcfull$Date %in% c("1/2/2007","2/2/2007"),]
  hpwc$Date <- as.Date(hpwc$Date, "%d/%m/%Y")
  hpwc$Time <- strptime(with(hpwc, paste(Date,Time)), "%Y-%m-%d %H:%M:%S")
  hpwc$Global_active_power <- as.numeric(hpwc$Global_active_power)
  #plot(hpwc$Time,hpwc$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
  png("plot2.png", width=480, height=480) 
  plot(hpwc$Time,hpwc$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off() 
}