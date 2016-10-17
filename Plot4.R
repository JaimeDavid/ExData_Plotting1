#setting the working directoy
setwd("C:/Users/Gamers/Dropbox/R/Coursera R/Exploratory Data analysis")
#loading the datable package to read the data faster.
library(data.table)
#usnig fread to read the table and marking NA values with "?"
pw_data <- fread("household_power_consumption.txt", na.strings = "?")
#subsetting the data that we need for the excercise
pw_subdata <- subset(pw_data, Date == "1/2/2007" | Date == "2/2/2007")
#giving the date a time  values the appropiate format
pw_subdata$Date <- dmy(pw_subdata$Date)
pw_subdata$Time <- parse_date_time(pw_subdata$Time, "HMS")
pw_subdata$Time <-format(pw_subdata$Time, format = "%H:%M:%S")
#opening graphic device and creating file
png(filename = "Plot4.png")
# setting the graphic device for 4 plots
par(mfrow = c(2,2))
#first plot 
plot(pw_subdata$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (Kilowatts)")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))

#second plot
plot(pw_subdata$Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
#third plot
plot(pw_subdata$Sub_metering_1, type ="l", xaxt = "n", ylab = "Energy sub metering", xlab = "")
lines(pw_subdata$Sub_metering_2, col = "red")
lines(pw_subdata$Sub_metering_3, col = "blue")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black", "red", "blue"), bty = "n")
#fourth plot
plot(pw_subdata$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
#shutting off graphic device
dev.off()