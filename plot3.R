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

with(data, {
  plot(Sub_metering_1~Timestamp, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Timestamp,col='Red')
  lines(Sub_metering_3~Timestamp,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file "plot3.png" in working directory
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
