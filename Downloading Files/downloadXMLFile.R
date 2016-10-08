# 
# url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
# doc <- xmlInternalTreeParse(url)
# rootNode <- xmlRoot(doc)
# names(rootNode)
# 
# names(rootNode[[1]][[1]])
# 
# summary(rootNode)


# zipcode <- xpathSApply(rootNode, "//zipcode", xmlValue)
# table(zipcode == 21231)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
f <- file.path(getwd(), "DATA.gov_NGAP.xlsx")
download.file(url, f, mode = "wb")
rows <- 18:23
cols <- 7:15
dat <- read.xlsx(f, 1, colIndex = cols, rowIndex = rows)
sum(dat$Zip * dat$Ext, na.rm = T)