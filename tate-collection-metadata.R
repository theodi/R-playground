# Load some utilities
source('~/git/R-projects/data-portal-analysis/functions.R')

# List of packages for session
packages <- c('ggplot2', 'RCurl')

# Install CRAN packages (if not already installed)
.inst <- packages %in% installed.packages()
if(length(packages[!.inst]) > 0) install.packages(packages[!.inst])

# Load packages into session 
sapply(packages, require, character.only = TRUE)

theme_set(theme_minimal(base_family = "Helvetica Neue"))
options(stringsAsFactors = FALSE)

#----------------------------------------------------

tate <- read.csv(text = getURL('https://raw.githubusercontent.com/tategallery/collection/master/artist_data.csv'))

grep("atz", tate$name, ignore.case = TRUE, value = TRUE)

tate[grep(1985, tate$yearOfBirth), ]

tate[tate$yearOfBirth > 1980 & !is.na(tate$yearOfBirth), names(tate) %ni% c("url", "id")]
