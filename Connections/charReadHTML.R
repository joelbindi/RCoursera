## CHARACTER READ HTML
#https://github.com/zezutom/datasciencecoursera/tree/master/getcleandata/quiz2

tryCatch({
  con <- url("http://biostat.jhsph.edu/~jleek/contact.html")
  html <- readLines(con)
}, finally = {
  close(con)
})

answer4 <- c()
sapply(c(10, 20, 30, 40), function(line) {
  answer4 <<- c(answer4, nchar(html[line]))
})
# Expected output: 
message("Characters in the 10th, 20th, 30th and 100th lines of HTML:", paste(as.character(answer4), collapse = ", "))