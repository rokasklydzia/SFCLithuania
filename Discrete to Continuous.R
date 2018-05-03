install.packages("tsdisagg2")
installed.packages("readxl")

library(tsdisagg2)
library(readxl)

quarterly <- read_excel("file.xlsx", col_names=TRUE)
quarterlyData <- 4/1000*quarterly


#exports example

exports <- tsdisagg2(quarterlyData$exportF2010T2016, s=12, method = "bf12", type = "average", plots=1)

# write to text

ts <- seq(1/96,6-1,by=1/48)

exportsText <- cbind(ts, exports$Y_HAT[,3])
write.table(exportsText, file = "exportF2010T2016.txt", row.names = FALSE, col.names = FALSE)
