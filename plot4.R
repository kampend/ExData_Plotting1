# Read in the data
data <- read.table("data.txt", header = TRUE, sep = ";")

# Construct the full date-time in one value
dates <- paste(data[,1], "-", data[,2], sep = "")
data[,1] <- as.POSIXct(strptime(dates, format="%d/%m/%Y-%H:%M:%S"))

# Prepare the device
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12)

# Set the device to display 4 graphs
par(mfrow = c(2,2))

# Plot the first graph
plot(data[,1],data[,3], type = "l", xlab = "", ylab = "Global Active Power")

# Plot the second graph
plot(data[,1],data[,5], type = "l", xlab = "datetime", ylab = "Voltage")

# Plot the third graph
plot(data[,1],data[,7], type = "l", xlab = "", ylab = "Energy sub metering")
lines(data[,1],data[,8], type = "l", col = "red")
lines(data[,1],data[,9], type = "l", col = "blue")

# Define the legend
myLeg <- c(names(data)[7], names(data)[8], names(data)[9])
myCols <- c("black", "red", "blue")
legend("topright", legend = myLeg, lwd=1, col = myCols, bty = "n")

# Plot the fourth graph
plot(data[,1],data[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Close the device
dev.off()

