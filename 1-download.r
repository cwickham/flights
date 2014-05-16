library(plyr)

base <- "http://www.transtats.bts.gov/Download/On_Time_On_Time_Performance_"
year <- 1993:2013
month <- 1:12

grid <- expand.grid(year, "_", month, ".zip", KEEP.OUT.ATTRS = FALSE)
grid[] <- lapply(grid, as.character)
paths <- apply(grid, 1, paste, collapse="", sep="")


paths.df <- data.frame(
  url = paste(base, paths, sep = ""),
  destfile = paste("data/", paths, sep = ""),
  stringsAsFactors = FALSE
)
m_ply(paths.df, download.file, .progress = "text")

