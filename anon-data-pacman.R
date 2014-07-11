# Anonymising data from 
# http://4dpiecharts.com/2011/08/23/anonymising-data/

pacman <- data.frame(
  id                = LETTERS[c(1, 2, 2, 2, 3, 4, 5, 6)],
  first_name        = c("Steve", rep.int("Tony", 3), "Natasha", "Clint", "Bruce", "Thor"),
  last_name         = c("Rogers", rep.int("Stark", 3), "Romanoff", "Barton", "Banner", NA),
  alias             = c("Captain America", rep.int("Iron Man", 3), "Black Widow", "Hawkeye", "The Hulk", "Thor"),
  gender            = rep(c("Male", "Female", "Male"), times = c(4, 1, 3)),
  pacman_score      = c(round(rlnorm(7, 9, 3), -1), 3333360),
  stringsAsFactors  = FALSE
)

cols_to_anon <- c("first_name", "last_name", "alias")

# Create ID column
# Easy if no groups: create column with random var, sort
# By group BUT FACTOR ORDER
library(dplyr)
pacman$id <- id(pacman["alias"], drop = TRUE)

# This works without loading dplyr
pacman$id <- as.numeric(as.factor(pacman$alias))

# Strip personal information
for (var in cols_to_anon) pacman[var] <- NA

