if(!file.exists("./data")){dir.create("./data")}
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,destfile = "./data/survey.csv",method="curl")
dateDownloaded <- date()
list.files("./data")

print("Date downloaded: ")
print(dateDownloaded)

data <- read.csv("./data/survey.csv", sep =",", header = TRUE)
print(head(data))

