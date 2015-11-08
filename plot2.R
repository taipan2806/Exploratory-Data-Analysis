## Prerequisity: data has to be unzipped in directory "data" of R's working directory

## Load data from working directory
rawData <- read.csv("data/household_power_consumption.txt", header=T, sep=';', stringsAsFactors=FALSE, dec=".")
rawData$Date <- as.Date(rawData$Date, format="%d/%m/%Y")

## Subsetting the data and delete unnecessary rawData
data <- rawData[rawData$Date >= "2007-02-01" & rawData$Date <= "2007-02-02" ,]
rm(rawData)

## Create new column Timestamp
datetime <- paste(as.Date(data$Date), data$Time)
data$Timestamp <- as.POSIXct(datetime)

## Create plot 2
plot(data$Global_active_power~data$Timestamp, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Save to file "plot2.png" in working directory
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
