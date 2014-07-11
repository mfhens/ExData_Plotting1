plot3 <- function()
{
  household_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
  household_data$Date <- as.Date(household_data$Date, "%d/%m/%Y")
  household_data <- subset(household_data, Date=="2007-02-01" | Date=="2007-02-02")
  household_data$DateTime <- as.POSIXct(paste(household_data$Date, household_data$Time), format="%Y-%m-%d %H:%M:%S")
  
  Sys.setlocale("LC_TIME", "English")
  png("plot3.png")
  with(household_data, plot(DateTime, Sub_metering_1, type="l", main = "", xlab="", ylab="Energy sub metering"))
  with(household_data, points(DateTime, Sub_metering_2, type="l", col="red"))
  with(household_data, points(DateTime, Sub_metering_3, type="l", col="blue"))
  legend("topright", pch = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
}