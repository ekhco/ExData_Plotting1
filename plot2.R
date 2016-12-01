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
png(file="plot2.png", width=480, height=480, units="px")
	
	plot(Global_active_power ~ time, data=p_, main="", xaxt="n",
		ylab="Global Active Power (kilowatts)", type="l", xlab="")
	axis(1, at=c(0,1,2)*24*60*60, labels=c("Thu", "Fri", "Sat"))

dev.off()


#              ~ fin ~