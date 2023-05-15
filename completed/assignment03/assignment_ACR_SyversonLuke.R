library(readr)
acs_14_1yr_s0201 <- read_csv("completed/assignment03/acs-14-1yr-s0201.csv")
table1 <- acs_14_1yr_s0201
library(ggplot2)


###
# I: List the name of each field and what you believe the data type
#    and intent is of the data included in each field
#    (Example: Id - Data Type: varchar (contains text and numbers)
#    Intent: unique identifier for each row)
#
spec(table1)
#
  # Output & Answers:
  # cols(
  # Id = col_character(), -- contains numbers and characters
  # Id2 = col_double(), -- includes numbers only
  # Geography = col_character(), -- characters describing the observation location by county
  # PopGroupID = col_double(), -- numeric (value of 1), ID denoting the population group
  # `POPGROUP.display-label` = col_character(), -- character, denoting the label of the population group
  # RacesReported = col_double(), -- number, a count of the reported races in the survey
  # HSDegree = col_double(), -- number (float), presumably a percentage of the population with HS Degrees
  # BachDegree = col_double()) -- number (float), presumably a percentage of the population with Bachelor's Degrees


###
# II: Run the following functions and provide the results: str(); nrow(); ncol()
str(table1)
nrow(table1)
ncol(table1)
#

###
# III: Create a Histogram of the HSDegree variable using the ggplot2 package.
#      Set a bin size for the Histogram that you think best visuals the data
#      (the bin size will determine how many bars display and how wide they are)
#      Include a Title and appropriate X/Y axis labels on your Histogram Plot.
ggplot(table1, aes(HSDegree)) +  geom_histogram(binwidth = 2) + xlab("HS Degree %") + ylab("Frequency of Obs.") + ggtitle("Frequency of Reported HS Degree Completion %")
#


###
# IV: Answer the following questions based on the Histogram produced:

#     Based on what you see in this histogram, is the data distribution unimodal? -- The data is unimodal.
#       Is it approximately symmetrical? -- The data is not symetrical per its left-skewdness.
#       Is it approximately bell-shaped? -- The data is shaped like a bell, but is not normally distributed.
#       Is it approximately normal? -- The data isn't normal, since the median & mode are offset right from the mean.
#       If not normal, is the distribution skewed? If so, in which direction? -- The distribution is left-skewed.
#       Include a normal curve to the Histogram that you plotted.
#
ggplot(table1, aes(HSDegree)) +  geom_histogram(aes(y = after_stat(density)), binwidth = 2) +
xlab("HS Degree %") + ylab("Probability of Obs.") +
ggtitle("Probability of Reported HS Degree Completion %") +
stat_function(fun = dnorm,
  args = list(mean = mean(table1$HSDegree),
  sd = sd(table1$HSDegree)),
  col = "red",
  size = 3)
#
#       Explain whether a normal distribution can accurately be used as a model for this data.
  # An offset normal distribution would be a low-accuracy predictor of the data, per the skewness and slightly positive kurtosis.
  # Values left of the center would be over-predicted, and the right, under-predicted.


###
# V: Create a Probability Plot of the HSDegree variable.
ggplot(table1, aes(HSDegree)) + geom_density(aes(HSDegree), size = 1.5) +
xlab("HS Degree %") + ylab("Probability of Obs.") +
ggtitle("Probability of Reported HS Degree Completion %")
#


###
# VI: Answer the following questions based on the Probability Plot:
#       Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
            # One could argue that the distribution resembles normality, but a normal distribution would be a poor predictor of this distribution per:
            # the left skewdness coupled with the positive kurtosis; therefore, I would state that the distribution is not 'approximately normal'.
#       If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
            # The distribution is left-skewed because: mean < median < mode.


###
# VII: Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function.
#      Include a screen capture of the results produced.
table2 <- subset(table1, select = -c(PopGroupID))
stat.desc(table2, norm = TRUE)
#


###
#VIII: In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores.
#      In addition, explain how a change in the sample size may change your explanation?
  # Negative skewness is described by this relationship between summary statistics: mean < median < mode.
  # Positive kurtosis means the distribution is "taller" and "thinner" than a normal distribution,
  # meaning that the data is relatively more dense around the mode, and less dense away from the mode.
  # The p value from the Shapiro-Wilk test is also less than 0.05, rejecting the null that the distribution is normal.
  # I'm not sure what is meant regarding z scores since a particular point isn't mentioned, but I'll say
  # that a coefficient of variation of  ~5 implies high variance and "instability" regarding the
  # prediction of dependent variables using simple approximations.

  # A larger sample size would potentially normalize the distribution, reducing all metrics deviating from the norm in proportion to the amount of samples added.
  # A smaller sample size would serve to exacerbate the lack of normality in the dataset, and provide more variance.