# Read in the data
data <- read.table("data.txt", header = TRUE, sep = ";")

# Prepare the data
dates <- data[,1]
data[,1] <- as.Date(data[,1], format="%d/%m/%Y")

# Open the device
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)

# Plot the graph
hist(data[,3], col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close the device
dev.off()