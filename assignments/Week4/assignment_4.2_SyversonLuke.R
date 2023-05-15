library(readxl)
setwd("~/GitHub/dsc520/assignments/Week4")
t0 <- read_excel("week-6-housing.xlsx")

###
# Use the apply function on a variable in your dataset

ranges <- apply(t0, 2, range)

###
# Use the aggregate function on a variable in your dataset

avg_sale_bedrooms <- aggregate(t0$`Sale Price`, list(t0$bedrooms), mean)

###
# Use the plyr function on a variable in your dataset – more specifically,
# I want to see you split some data, perform a modification to the data,
# and then bring it back together

library(plyr)
price_sqft <- function(t0) {fn = t0$`Sale Price`/t0$square_feet_total_living}
#x <- ddply(t0, .variables = 'sale_reason', .fun = price_sqft)

  # The above line is commented so that markdown can run.
  # I can't figure this one out. Oh well. At first I had subsets of the data
  # using the filter(), but rereading the instructions before submission had me
  # attempt to pull this together. The error I get here is:
  # "Results do not have equal length" and I'm not sure why. I'll challenge my
  # understanding of the ddply function this week.

###
# Check distributions of the data

library(pastecs)
stat.desc(t0)
boxplot(t0$`Sale Price`)
boxplot(t0$square_feet_total_living)
boxplot(t0$sq_ft_lot)
boxplot(t0$bedrooms)

###
# Identify if there are any outliers

  # It looks like the data has outliers due to its general quantitative right-skewness.
  # It would make sense that the majority of houses sold for less, had less
  # amenities and smaller sizes.

###
# Create at least 2 new variables

detach('package:plyr')
library(dplyr)

mean_price <- mean(t0$`Sale Price`)
t.sammamish <- distinct(filter(t0, ctyname == 'SAMMAMISH'))
mean_price_sammamish <- mean(t.sammamish$`Sale Price`)
