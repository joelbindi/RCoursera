# url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
# 
# download.file(url, destfile = "./data/GDP2.csv", method="curl")
# 
# df <- data.table(read.csv("./data/GDP2.csv", skip=4, nrows = 25, stringsAsFactors = FALSE))
# 
# df <- df[X != ""]
# df <- df[, list(c("CountryCode", "rankingGDP", "Long.Name","GDP"))]
# setnames(df, ("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
#                                            "Long.Name", "gdp"))
# gdp <- as.numeric(gsub(",", "", dtGDP$gdp)
# 


#source https://github.com/benjamin-chan/GettingAndCleaningData/blob/master/Quiz4/quiz4.md
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
f <- file.path(getwd(), "GDP.csv")
download.file(url, f)
dtGDP <- data.table(read.csv(f, skip = 4, nrows = 215, stringsAsFactors = FALSE))
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
gdp <- as.numeric(gsub(",", "", dtGDP$gdp))

