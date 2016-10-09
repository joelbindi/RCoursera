url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(url, destfile = "./data/survey2.csv", method="curl")

df <- data.table(read.csv("./data/survey2.csv", sep = ",", header = TRUE))

vnames <- names(df)

vsplit <- strsplit(vnames,"wgtp")

vsplit[[123]]