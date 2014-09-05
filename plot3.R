# Read in the data
data <- read.table("data.txt", header = TRUE, sep = ";")

# Construct the full date-time in one value
dates <- paste(data[,1], "-", data[,2], sep = "")
data[,1] <- as.POSIXct(strptime(dates, format="%d/%m/%Y-%H:%M:%S"))

# Prepare the device
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12)

# Plot the data
plot(data[,1],data[,7], type = "l", xlab = "", ylab = "Energy sub metering")
lines(data[,1],data[,8], type = "l", col = "red")
lines(data[,1],data[,9], type = "l", col = "blue")

# Define the legend
myLeg <- c(names(data)[7], names(data)[8], names(data)[9])
myCols <- c("black", "red", "blue")
legend("topright", legend = myLeg, lwd=1, col = myCols)

# Close the device
dev.off()

