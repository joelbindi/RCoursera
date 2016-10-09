unzip("exdata_data_household_power_consumption.zip")

ndata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
sdata <- read.table("household_power_consumption.txt", sep=";", 
                            na.strings=c("NA","?"), skip=66637, nrows=2880)

names(sdata) <- names(ndata)

dates <- paste(sdata$Date, sdata$Time)
datetime <- strptime(dates,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))

plot(datetime, sdata$Global_active_power, type = "l",xlab="",ylab="Global Active Power (Kilowatts)")

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()