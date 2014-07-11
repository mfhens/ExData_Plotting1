plot1 <- function()
{
  household_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
  household_data$Date <- as.Date(household_data$Date, "%d/%m/%Y")
  household_data <- subset(household_data, Date=="2007-02-01" | Date=="2007-02-02")
 
  png("plot1.png")
  hist(household_data$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
  dev.off()
}