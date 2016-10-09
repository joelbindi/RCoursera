if(!file.exists("./data")) {dir.create("./data/")}
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
fileUrl <- download.file(url,destfile = "./data/survey.csv", method = "curl")
data = read.csv("./data/survey.csv", header = TRUE, sep=",")
agricultureLogical <- data$ACR == 3 & data$AGS == 6
out <- which(agricultureLogical)[1:3]
print(out)