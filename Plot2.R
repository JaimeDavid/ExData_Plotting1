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
png(filename = "Plot2.png")
#plot with lines, and no values in x axis
plot(pw_subdata$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (Kilowatts)")
#giving name to the x axis values
axis(1, at = c(0, 1500, 2900), labels = c("Thu", "Fri", "Sat"))
#shutting off graphic device
dev.off()


