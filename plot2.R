## Loading the data
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting the data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(datetime)

## Drawing Plot 2
plot(subSetData$Global_active_power~subSetData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving a PNG file
dev.copy(png, file="./ExData_Plotting1/plot2.png", height=480, width=480)
dev.off()