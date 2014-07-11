# Anonymising data from 
# http://4dpiecharts.com/2011/08/23/anonymising-data/

pacman <- data.frame(
  id                = LETTERS[c(1, 2, 2, 2, 3, 4, 5, 6)],
  first_name        = c("Steve", rep.int("Tony", 3), "Natasha", "Clint", "Bruce", "Thor"),
  last_name         = c("Rogers", rep.int("Stark", 3), "Romanoff", "Barton", "Banner", NA),
  alias             = c("Captain America", rep.int("Iron Man", 3), "Black Widow",
                        "Hawkeye", "The Hulk", "Thor"),
  gender            = rep(c("Male", "Female", "Male"), times = c(4, 1, 3)),
  pacman_score      = c(round(rlnorm(7, 9, 3), -1), 3333360),
  stringsAsFactors  = FALSE
)
cols_to_anon <- c("first_name", "last_name", "alias")