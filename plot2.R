## Need the sqldf package to subset only the needed data
require(sqldf)

## USe the read.csv.sql withe the correct query to get only the data for the 1/2/2007 and 2/2/2007 dates
data <- read.csv.sql( file='./household_power_consumption.txt',
                     sep=";",
                     sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                     header=TRUE)

# Set the device to display 1 graph
par(mfrow = c(1, 1))

# Prepare the data
dates <- paste(data$Date, "-", data$Time, sep = "")
data$Date <- as.POSIXct(strptime(dates, format="%d/%m/%Y-%H:%M:%S"))

# Plot the graph
plot(data$Date,data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file="./plot2.png")

# Close the device
dev.off()
