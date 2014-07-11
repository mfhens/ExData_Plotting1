plot2 <- function()
{
  household_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
  household_data$Date <- as.Date(household_data$Date, "%d/%m/%Y")
  household_data <- subset(household_data, Date=="2007-02-01" | Date=="2007-02-02")
  household_data$DateTime <- as.POSIXct(paste(household_data$Date, household_data$Time), format="%Y-%m-%d %H:%M:%S")
  
  Sys.setlocale("LC_TIME", "English")
  png("plot2.png")
  with(household_data, plot(DateTime, Global_active_power, type="l", main = "", xlab="", ylab="Global Active Power (kilowatts)"))
  dev.off()
}