library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
#https://github.com/benjamin-chan/GettingAndCleaningData/blob/master/Quiz4/quiz4.md
sampleTimes = index(amzn)

#addmargins(table(year(sampleTimes), week(sampleTimes)))