setwd("C:/Users/Chris/Desktop/R/exdata-data-household_power_consumption")
d = read.table("household_power_consumption.txt", sep=";", header=T, 
               na.strings="?", stringsAsFactors=FALSE)
str(d)
dat <- d[which(d$Date=='1/2/2007' | d$Date=='2/2/2007'),]
str(dat)
dat$datetime <- paste(dat$Date, dat$Time)
dat$posixDate <- strptime(dat$datetime, "%d/%m/%Y %H:%M:%S")
plot(dat$posixDate,dat$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png")
dev.off()
