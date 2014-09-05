# Read in the data
data <- read.table("data.txt", header = TRUE, sep = ";")

# Prepare the data
dates <- paste(data[,1], "-", data[,2], sep = "")
data[,1] <- as.POSIXct(strptime(dates, format="%d/%m/%Y-%H:%M:%S"))

# Open the device
png(filename = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)

# Plot the graph
plot(data[,1],data[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close the device
dev.off()
