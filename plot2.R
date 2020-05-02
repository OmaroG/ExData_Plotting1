#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

#reading the data
DataF <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
data <- DataF[(DataF$Date=="1/2/2007" | DataF$Date=="2/2/2007" ), ]

#Date formating
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime)

#ploting and Exporting
plot(data$Global_active_power~data$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()