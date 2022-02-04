
# Read full data into R
setwd("C:/Users/liangs2/Documents/Coursera/Exploratory Data Analysis")
UseDataFull <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                      header = TRUE, sep = ";",na.strings="?")

# Convert the Date and time variables to Date/Time classes
UseDataFull$Date <- as.Date(UseDataFull$Date, format="%d/%m/%Y")
UseDataFull$Time <- format(UseDataFull$Time, format="%H:%M:%S")

# Select the subset used in the project
UseData <- subset(UseDataFull,UseDataFull$Date == "2007-02-01" | UseDataFull$Date == "2007-02-02" )

# Combine date and time
Datetime <- strptime(paste(UseData$Date, UseData$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
UseData <- cbind(UseData, Datetime)

#Plot 3
png("plot3.png", width=480, height=480)
with(UseData, {
  plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
 })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
