## Prerequisity: data has to be unzipped in directory "data" of R's working directory

## Load data from working directory
rawData <- read.csv("data/household_power_consumption.txt", header=T, sep=';', stringsAsFactors=FALSE, dec=".")
rawData$Date <- as.Date(rawData$Date, format="%d/%m/%Y")

## Subsetting the data and delete unnecessary rawData
data <- rawData[rawData$Date >= "2007-02-01" & rawData$Date <= "2007-02-02" ,]
rm(rawData)

## Create plot 1
globalActivePower <- as.numeric(data$Global_active_power)
hist(globalActivePower, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file "plot1.png" in working directory
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
