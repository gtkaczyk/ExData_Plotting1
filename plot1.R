

#exdata-011 project1

setwd("E://Projects//R//exdata-011//as1//exdata-data-household_power_consumption")

#load data fron the file
mydata <- read.csv("household_power_consumption.txt"
                   ,sep=";"
                   ,na.strings="?")



library(tidyr)
library(dplyr)
library(lubridate)


# Filter data to  2007-02-01 and 2007-02-02
d <- filter(mydata, Date == "1/2/2007" | Date == "2/2/2007")
# Add When colum with datetime
d <- mutate(d, When = parse_date_time(paste(d$Date,d$Time, sep = " "),"%d/%m/%Y %H:%M:%S"))


# set English in days of week names
Sys.setlocale(category="LC_TIME", locale="English")


# draw plot 1

png("plot1.png", width = 480, height = 480)
hist(d$Global_active_power
     , breaks=12
     , col="red"
     ,main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")
dev.off()

