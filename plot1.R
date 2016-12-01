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

png(file="plot1.png", width=480, height=480, units="px")

dev.off()







#              ~ fin ~