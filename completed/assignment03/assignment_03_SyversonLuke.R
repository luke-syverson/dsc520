# Assignment: ASSIGNMENT 3
# Name: Syverson, Luke
# Date: 2023-04-02

## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/home/jdoe/Workspaces/dsc520")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")

# https://ggplot2.tidyverse.org/reference/geom_point.html
## Using `geom_point()` create three scatterplots for
## `height` vs. `earn`
x <- heights_df # After completing this assignment, I realize I shouldn't use 'x' as a table name shorthand.
ggplot(x, aes(x=height, y=earn)) + geom_point(colour = "red", size = 1)
## `age` vs. `earn`
ggplot(x, aes(x=age, y=earn)) + geom_point(colour = "blue", size = 1)
## `ed` vs. `earn`
ggplot(x, aes(x=ed, y=earn)) + geom_point(colour = "navy", size = 1)

## Re-create the three scatterplots and add a regression trend line using
## the `geom_smooth()` function
## `height` vs. `earn`
ggplot(x, aes(x=height, y=earn)) + geom_point(colour = "red", size = 1) + geom_smooth()
## `age` vs. `earn`
ggplot(x, aes(x=age, y=earn)) + geom_point(colour = "blue", size = 1) + geom_smooth(colour = "red")
## `ed` vs. `earn`
ggplot(x, aes(x=ed, y=earn)) + geom_point(colour = "navy", size = 1) + geom_smooth(colour = "yellow")

## Create a scatterplot of `height`` vs. `earn`.  Use `sex` as the `col` (color) attribute
ggplot(x, aes(x=height, y=earn, col=sex)) + geom_point()

## Using `ggtitle()`, `xlab()`, and `ylab()` to add a title, x label, and y label to the previous plot
## Title: Height vs. Earnings
## X label: Height (Inches)
## Y Label: Earnings (Dollars)
ggplot(x, aes(x=height, y=earn, col=sex)) + geom_point() + xlab("Height") + ylab("Earnings") + ggtitle("Height vs. Earnings")

# https://ggplot2.tidyverse.org/reference/geom_histogram.html
## Create a histogram of the `earn` variable using `geom_histogram()`
ggplot(x, aes(earn)) + geom_histogram()

## Create a histogram of the `earn` variable using `geom_histogram()`
## Use 10 bins
ggplot(x, aes(earn)) + geom_histogram(bins = 10)

# https://ggplot2.tidyverse.org/reference/geom_density.html
## Create a kernel density plot of `earn` using `geom_density()`
ggplot(x, aes(earn)) +  geom_density()
