#This script prepares a histogram plot of the Global_Active_Power data of the
#Individual household electric power consumption Data Set, which can be downloaded here:
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#In order the script to work properly, the data set first shall be downloaded, unzipped and
#saved in the R working directory, with file name "household_power_consumption.txt"


#reading in the data file
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#filter for dates 1/2/2007 and 2/2/2007
filtered_data <- alldata[(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007"),]

#plot histogram
hist(filtered_data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

#save plot to png file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

