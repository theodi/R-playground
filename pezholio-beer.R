# Load some utilities
# source('~/git/R-projects/data-portal-analysis/functions.R')
library(ggplot2)
theme_set(theme_minimal(base_family = "Helvetica Neue"))
options(stringsAsFactors = FALSE)

# Some work-around for secure links
read.ssl <- function(url, ...){
  tmpFile <- tempfile()
  download.file(url, destfile = tmpFile, method = "curl")
  url.data <- read.csv(tmpFile, ...)
  return(url.data)
}

beer <- read.ssl('https://dl.dropboxusercontent.com/u/135665/checkin-report_08_01_14.csv', header = FALSE)
ggplot(data = beer, aes(x = V4)) + geom_histogram(color = 'white', fill = "#FF6700", binwidth = 0.5) + 
  xlab('Alcohol') + geom_vline(xintercept = median(beer$V4))
