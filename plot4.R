## Need the sqldf package to subset only the needed data
require(sqldf)

## USe the read.csv.sql withe the correct query to get only the data for the 1/2/2007 and 2/2/2007 dates
data <- read.csv.sql( file='./household_power_consumption.txt',
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)

# Construct the full date-time in one value
dates <- paste(data$Date, "-", data$Time, sep = "")
data$Date <- as.POSIXct(strptime(dates, format="%d/%m/%Y-%H:%M:%S"))

# Set the device to display 4 graphs
par(mfrow = c(2,2))

# Plot the first graph
plot(data$Date,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot the second graph
plot(data$Date,data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot the third graph
plot(data$Date,data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Date,data$Sub_metering_2, type = "l", col = "red")
lines(data$Date,data$Sub_metering_3, type = "l", col = "blue")

# Define the legend
myLeg <- c(names(data)[7], names(data)[8], names(data)[9])
myCols <- c("black", "red", "blue")
legend("topright", legend = myLeg, lwd=1, col = myCols, bty = "n")

# Plot the fourth graph
plot(data$Date,data[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file="./plot4.png")

# Close the device
dev.off()

