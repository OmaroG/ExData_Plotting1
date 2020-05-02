#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

#reading the data
DataF <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- DataF[(DataF$Date=="1/2/2007" | DataF$Date=="2/2/2007" ), ]

## ploting
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

## saving the figure
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
