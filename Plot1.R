
# Read full data into R
setwd("C:/Users/liangs2/Documents/Coursera/Exploratory Data Analysis")
UseDataFull <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                      header = TRUE, sep = ";",na.strings="?")

# Convert the Date variable to Date/Time classe
UseDataFull$Date <- as.Date(UseDataFull$Date, format="%d/%m/%Y")

# Select the subset used in the project
UseData <- subset(UseDataFull,UseDataFull$Date == "2007-02-01" | UseDataFull$Date == "2007-02-02" )

#plot1

png("plot1.png", width=480, height=480)
hist(UseData$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
