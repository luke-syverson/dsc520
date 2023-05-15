library(readr)
setwd("~/GitHub/dsc520")
scores <- read_csv("assignments/Week4/scores.csv")

# What are the observational units in this study?
spec(scores)
head(scores)
range(scores$Count)
  # Count & Score are the observational fields in this study, since the Section is endogenous.

###
# Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
  # The paragraph identifies the Total Points & Scores as quantitative variables.
  # We might assume, given the distribution of said variables, that the Score and Count variables represent the aforementioned descriptions.
  # It's obvious that the categorical variable would the the endogenous Section, given it's datatype and description in the prompt.

###
# Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
library(dplyr)
regular <- filter(scores, Section == 'Regular')
sports <-  filter(scores, Section == 'Sports')

###
# Use the Plot function to plot each Sections scores and the number of students achieving that score.
# Use additional Plot Arguments to label the graph and give each axis an appropriate label.

library(ggplot2)
ggplot(regular, aes(x=Score, y=Count)) + geom_point(color = 'red', size = 2) + xlab('Scores') + ylab('Number of Students') + ggtitle('Regular Section Student Scores')
ggplot(sports, aes(x=Score, y=Count)) + geom_point(color = 'blue', size = 2) + xlab('Scores') + ylab('Number of Students') + ggtitle('Sports Section Student Scores')

###
# Once you have produced your Plots answer the following questions:
# Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency:
# Can you say that one section tended to score more points than the other? Justify and explain your answer.

library(pastecs)
stat.desc(regular)
stat.desc(sports)

  # The regular section had higher average and minimum scores, with significantly less variance;
  # however, the sports section had a higher maximum, and greater variance.
  # The regular section plots reveal a higher density of scores around the mean than the sports section,
  # attributing an implied greater probability of higher scores in the regular section.
  # This leads me to conclude that the regular section tends to score higher.

###
# Did every student in one section score more points than every student in the other section? If not, explain what a statistical tendency means in this context.

  # No, students in each group had varying scores within the same range.
  # I understand statistical tendency in this context as a unique student's probability of performance,
  # given their elective participation in the control (regular) or experimental (sports) sections.

###
# What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
  
  # The preexisting performance tendencies of the students could be summarized in their GPAs before beginning the course.
  # If the GPAs were recorded (assuming them to be accurate historical predictors of class performance),
  # we might see a bias for higher/lower performing students to enroll in one section over another.
  