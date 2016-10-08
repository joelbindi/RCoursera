
temp <- tempfile()
download.file("http://www.cftc.gov/files/dea/history/fut_disagg_xls_2016.zip", 
              temp)
con <- unz(temp, "gbr_Country_en_csv_v2.csv")
dat <- read.table(con, header=T, skip=2, sep=",")
unlink(temp)