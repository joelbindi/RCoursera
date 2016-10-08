
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url, destfile = "wksst8110.for", method="curl")
fname <- "wksst8110.for"

# column sequence: 5x empty space, SST column, SSTA column
col_seq <- c(-5, 4, 4)

# rows: skip first four lines 
# cols (left to right): 
#   empty space (-1) 
#   nine characters (9) 
#   etc.
df <- read.fwf(fname, 
               widths = c(-1, 9, col_seq, col_seq, col_seq, col_seq),
               skip = 4)
answer5 <- sum(df[, 4])

# Expected output: "The sum of numbers in the fourth column is 32426.7"
message("The sum of numbers in the fourth column is", answer5)