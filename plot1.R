plot1 <- function(filename) {
  # filename : "household_power_consumption.txt"
  hpwcfull <- read.csv(filename, sep = ";", dec = ".")
  hpwc <- hpwcfull[hpwcfull$Date %in% c("1/2/2007","2/2/2007"),]
  hpwc$Date <- as.Date(hpwc$Date, "%d/%m/%Y")
  hpwc$Time <- strptime(with(hpwc, paste(Date,Time)), "%Y-%m-%d %H:%M:%S")
  hpwc$Global_active_power <- as.numeric(hpwc$Global_active_power)
  #hist(hpwc$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  png("plot1.png", width=480, height=480) 
  hist(hpwc$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.off() 
}