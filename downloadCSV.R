url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(),"data/", "ss06pid.csv")
download.file(url,f)

DT <- read.csv(f)
check <- function(y,t) {
  message(sprintf("Time elapsed: %.10f", t[3]))
  print(y)
}

# t <- system.time(y <- sapply(split(DT$pwgtp15, DT$SEX), mean))
# t <- tapply(DT$pwgtp15,DT$SEX,mean)
# t <- mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
# t <- DT[,mean(pwgtp15),by=SEX]
t <- mean(DT$pwgtp15,by=DT$SEX)
# t <- rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

check(y,t)