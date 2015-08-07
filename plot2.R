#This script prepares an xy scatter plot of the Global_Active_Power data of the
#Individual household electric power consumption Data Set, which can be downloaded here:
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#vs recording time in the range of Feb 1 2007 0:00:00 - Feb 2 2007 23:59:00
#In order the script to work properly, the data set first shall be downloaded, unzipped and
#saved in the R working directory, with file name "household_power_consumption.txt"


#reading in the data file
alldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

#filter for dates 1/2/2007 and 2/2/2007
filtered_data <- alldata[(alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007"),]

#format date and time values
Sys.setlocale("LC_TIME", "English")
filtered_data$datetime <- strptime(paste(filtered_data$Date, filtered_data$Time), "%d/%m/%Y %H:%M:%S")

#plot xy scatter plot
plot(filtered_data$datetime, filtered_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


#save plot to png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

