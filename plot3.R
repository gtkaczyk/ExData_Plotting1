

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


# draw plot 3

png("plot3.png", width = 480, height = 480)
plot(d$When
     , d$Sub_metering_1
     , type="l"
     , ylab="Energy sub metering"
     , xlab="")
lines(d$When, d$Sub_metering_2,col="red")
lines(d$When, d$Sub_metering_3,col="blue")
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = 1, 
       cex = 1
)
dev.off()

