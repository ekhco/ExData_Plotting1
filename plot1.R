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

# subset to only Feb 1-2, 2007
p_ <- p[p$Date %in% c("2/1/2007", "2/2/2007"),]
p_$Date <- as.Date(p_$Date)
head(p_)

# plot it to PNG
png(file="plot1.png", width=480, height=480, units="px")
	hist(p_$Global_active_power, main="Global Active Power", 
		xlab="Global Active Power (kiliwatts)", xaxt="n",
		col="red", xlim=c(0,6), breaks = 11)
	axis(1, at=c(0,2,4,6), labels=c(0,2,4,6))
dev.off()


#              ~ fin ~