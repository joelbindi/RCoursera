unzip("exdata_data_household_power_consumption.zip")

ndata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
sdata <- read.table("household_power_consumption.txt", sep=";", 
                    na.strings=c("NA","?"), skip=66637, nrows=2880)

names(sdata) <- names(ndata)

dates <- paste(sdata$Date, sdata$Time)
datetime <- strptime(dates,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))

#plot(datetime, sdata$Global_active_power, type = "l",xlab="",ylab="Global Active Power (Kilowatts)")

plot(datetime,sdata$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering", col="black")
lines(datetime, sdata$Sub_metering_2, col="red")
lines(datetime, sdata$Sub_metering_3, col="blue")

legend("topright", lty=1,col=c("black","red","blue"),
       legend = c("Sub Metering 1         *", "Sub Metering 2         *", "Sub Metering 3         *"))


dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()