library(jpeg)
if(!file.exists("./data")) {dir.create("./data/")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
data <- download.file(url, destfile="./data/jeff.jpg", method="curl")
img <- readJPEG("./data/jeff.jpg", native = TRUE)
imgquant <- quantile(img, probs = c(0.3,0.8))
print(imgquant)


