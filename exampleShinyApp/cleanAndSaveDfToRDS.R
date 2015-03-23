library(plyr)
library(dplyr)
library(magrittr)
library(lubridate)

USPersonalExpenditure %>%
    t %>%
{
    tempDat <- .
    tempDat <- as.data.frame(cbind(rownames(tempDat), tempDat))
    colnames(tempDat)[1] <- "Year"
    colnames(tempDat) <- gsub(" ", "", colnames(tempDat), fixed=TRUE)
    for (i in 1:ncol(tempDat)) {
        tempDat[, i] <- as.character(tempDat[, i])
    }
    tempDat$Year <- as.Date(tempDat$Year, "%Y")
    for (i in 2:ncol(tempDat)) {
        tempDat[, i] <- as.numeric(tempDat[, i])
    }
    return(tempDat)
} %>%
    assign("cleanUSPersonalExp", value=., pos=1)

saveRDS(cleanUSPersonalExp, file="data/df.rds")

# Save this script in the same directory that contains the server.R file


