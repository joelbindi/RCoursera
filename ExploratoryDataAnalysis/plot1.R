## PLOT 1 ----------------------------------------------------

unzip("exdata_data_household_power_consumption.zip")

f <- file.path(getwd(), "household_power_consumption.txt")
df <- data.table(read.csv(f, sep = ";",header = TRUE, nrows=1))
# gap <- as.numeric(df$Global_active_power)
# gapKw <- gap / 1000
# message("Finished reading...")

#Get FEB info
s <- read.table("household_power_consumption.txt", sep=";", 
                         na.strings=c("NA","?"), skip=66637, nrows=2880)
#Fix Names
names(s) <- names(df)

par(mfrow=c(1,1))

#Plot
hist(s$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

## END PLOT 1 ----------------------------------------------------
