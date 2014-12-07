setwd("C:/Users/Chris/Desktop/R/exdata-data-household_power_consumption")
d = read.table("household_power_consumption.txt", sep=";", header=T, 
               na.strings="?", stringsAsFactors=FALSE)
str(d)
dat <- d[which(d$Date=='1/2/2007' | d$Date=='2/2/2007'),]
str(dat)
hist(dat$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()
