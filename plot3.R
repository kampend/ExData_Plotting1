## Need the sqldf package to subset only the needed data
require(sqldf)

## USe the read.csv.sql withe the correct query to get only the data for the 1/2/2007 and 2/2/2007 dates
data <- read.csv.sql( file='./household_power_consumption.txt',
                      sep=";",
                      sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                      header=TRUE)

# Set the device to display 1 graph
par(mfrow = c(1, 1))

# Construct the full date-time in one value
dates <- paste(data$Date, "-", data$Time, sep = "")
data$Date <- as.POSIXct(strptime(dates, format="%d/%m/%Y-%H:%M:%S"))

# Plot the data
plot(data$Date,data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Date,data$Sub_metering_2, type = "l", col = "red")
lines(data$Date,data$Sub_metering_3, type = "l", col = "blue")

# Define the legend
myLeg <- c(names(data)[7], names(data)[8], names(data)[9])
myCols <- c("black", "red", "blue")
legend("topright", legend = myLeg, lwd=1, col = myCols)

dev.copy(png, file="./plot3.png")

# Close the device
dev.off()

