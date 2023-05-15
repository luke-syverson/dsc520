# Using the dplyr package, use the 6 different operations to analyze/transform the data
# GroupBy, Summarize, Mutate, Filter, Select, and Arrange
# Remember this isn’t just modifying data, you are learning about your data also
# so play around and start to understand your dataset in more detail

library(dplyr)
setwd("~/GitHub/dsc520/assignments/Week5")
library(readxl)
raw <- read_excel("week-6-housing.xlsx")
library(pastecs)
stat.desc(raw)

library(sjmisc)
df_warnings <- filter(raw, sale_warning != 'NA') %>%
    case_when(
      str_contains(df_warnings$sale_warning, ' ',
                   mutate(strsplit(df_warnings$sale_warning, ' ')
                   )))


###
# Using the purrr package – perform 2 functions on your dataset.
# You could use zip_n, keep, discard, compact, etc.



###
# Use the cbind and rbind function on your dataset



###
# Split a string, then concatenate the results back together

