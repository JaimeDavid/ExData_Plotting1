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
png(filename = "Plot3.png")
# plottig the first line and the main plot
plot(pw_subdata$Sub_metering_1, type ="l", xaxt = "n", ylab = "Energy sub metering", xlab = "")
#adding the second and third lines in the plot
lines(pw_subdata$Sub_metering_2, col = "red")
lines(pw_subdata$Sub_metering_3, col = "blue")
#adding labels at the x axis
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
#adding legend for each line
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), col = c("black", "red", "blue"))
#shutting off graphic device
dev.off()
