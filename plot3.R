rm(list=ls())
gc()
# --------------------------------------------------
# plot 1: make a histogram
# copyright Eric Chow
# --------------------------------------------------
# install.packages("data.table")
library(data.table)

setwd("/Users/echow/Dropbox (Personal)/coursera/ExData_Plotting1")

p <- fread(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"), stringsAsFactors=FALSE)
nrow(p)
ncol(p)
head(p)

# subset to only Feb 1-2, 2007
p_ <- p[p$Date %in% c("1/2/2007", "2/2/2007"),]
p_$Date <- as.Date(p_$Date, format="%d/%m/%Y")
p_ <- data.frame(p_)
summary(p_)


# fix time
d <- strptime(p_$Time, format="%H:%M:%S")
head(d)
p_$time <- as.numeric(d - min(d))
# but add 24hrs to second day
p_[p_$Date == as.Date("2/2/2007", format="%d/%m/%Y"), "time"] <- p_[p_$Date == as.Date("2/2/2007", format="%d/%m/%Y"), "time"] + 24*60*60
summary(p_)

# plot it to PNG
png(file="plot3.png", width=480, height=480, units="px")
	
	plot(Sub_metering_1 ~ time, data=p_, main="", xaxt="n",
		ylab="Energy sub metering", type="l", xlab="", col="black")
	lines(Sub_metering_2 ~ time, data=p_, main="", xaxt="n",
		type="l", xlab="", col="red")
	lines(Sub_metering_3 ~ time, data=p_, main="", xaxt="n",
		type="l", xlab="", col="blue")
	axis(1, at=c(0,1,2)*24*60*60, labels=c("Thu", "Fri", "Sat"))

	legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


#              ~ fin ~