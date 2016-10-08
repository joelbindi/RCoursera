if(!file.exists("./data")){dir.create("./data")}
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(url,destfile = "./data/gasData.xlsx",method="curl")
dateDownloaded <- date()
list.files("./data")

print("Date downloaded: ")
print(dateDownloaded)
library(xlsx)
gasData <- read.xlsx("./data/gasData.xlsx", sheetIndex = 1, header = TRUE)
print(head(data))