## Need the sqldf package to subset only the needed data
require(sqldf)

## USe the read.csv.sql withe the correct query to get only the data for the 1/2/2007 and 2/2/2007 dates
data <- read.csv.sql( file='./household_power_consumption.txt',
                     sep=";",
                     sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                     header=TRUE)

# Set the device to display 1 graphs
par(mfrow = c(1, 1))

## Build the histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## Copy the hystogram to the file plot1.png. By default the width and the height of the png file are 480 px
dev.copy(png, file="./plot1.png")

## Close the PNG device
dev.off()

