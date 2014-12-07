setwd("C:/Users/Chris/Desktop/R/exdata-data-household_power_consumption")
d = read.table("household_power_consumption.txt", sep=";", header=T, 
               na.strings="?", stringsAsFactors=FALSE)
str(d)
dat <- d[which(d$Date=='1/2/2007' | d$Date=='2/2/2007'),]
str(dat)
dat$datetime <- paste(dat$Date, dat$Time)
dat$posixDate <- strptime(dat$datetime, "%d/%m/%Y %H:%M:%S")
png(file="plot3.png")
plot(dat$posixDate,dat$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(dat$posixDate,dat$Sub_metering_2,col="red")
lines(dat$posixDate,dat$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),pch="-",lty=1)
dev.off()
