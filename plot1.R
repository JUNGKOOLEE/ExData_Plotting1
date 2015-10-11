## Loading the data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


## Subsetting the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting to numeric
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)
 
## Drawing Plot 1
hist(subSetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="./ExData_Plotting1/plot1.png", height=480, width=480)
dev.off()