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

## Create plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Timestamp, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Timestamp, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Timestamp, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Timestamp,col='Red')
  lines(Sub_metering_3~Timestamp,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Timestamp, type="l", ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
