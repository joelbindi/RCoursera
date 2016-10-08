#SQLDF 
#Author: https://github.com/zezutom/datasciencecoursera/tree/master/getcleandata/quiz2

fname <- "pid.csv"
# download_if_not_exists(fname, "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")
acs <- read.csv(fname, header = TRUE, sep = ",")

answer2 <- sqldf("select pwgtp1 from acs where AGEP < 50")
message("Probability weights for people with ages less than 50:")
message("sqldf('select pwgtp1 from acs where AGEP < 50'):", head(answer2))

# answer3 <- sqldf("unique(acs$AGEP)")
# message(answer3)


expected_result <- unique(acs$AGEP)
queries <- list(
  q1 <- "select distinct pwgtp1 from acs",
  q2 <- "select unique * from acs",
  q3 <- "select distinct AGEP from acs",
  q4 <- "select AGEP where unique from acs"
)
answer3 <- c()
lapply(queries, function(q) {
  result <- try(sqldf(q), silent = TRUE)
  if (inherits(result, "try-error")) {
    message("Invalid query:", q)
  } else if (identical(result$AGEP, expected_result)) {
    answer3 <<- c(answer3, q)  
  }
})