setwd("~/Desktop")
source("~/git/R-projects/data-portal-analysis/functions.r")
require(sdcMicro)
require(sdcMicroGUI)

data <- read.csv("transparency_data_2012-13.csv", na.strings = "")

summary(data$sex)

sapply(data, no.missing)
sapply(data, count.unique)
sapply(data[, 2:9], table)
sapply(data[, 11:14], table)


head(sort(table(data$main_injury)))



sdcGUI()

# Violation 2-anon for sex, age -- HARMLESS
data[c(4133, 4198), ]
table(data$age, data$sex)

# Check rejection_or_reduction_reason
sort(table(data$rejection_or_reduction_reason))
# Award would have been against a minors interests 
# Injury sustained outside Great Britain 

sort(table(data$crime_of_violence))

# Most variables 3-anonymity:  1.23 %  (orig:  1.23 % )
# Main injury around 2% - tolerable!

# Values between 200k and 500k rare
hist(data[which(data$value_of_award > 100000), "value_of_award"])
hist(data[which(data$days_to_first_decision > 1000), "days_to_first_decision"])
