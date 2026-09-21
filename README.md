# r-programming-assignments

Nayelis Sotolongo
LIS4370
Repository for R Programming Assignments

# Module # 2 Assignment Importing Data and Function Evaluation in R
#Error message from testing myMean
Error in myMean(assignment2) : object 'assignment' not found

#Why this function fails

The function failed because it uses different names for the same data. The original code used assignment in sum() and someData in length(), but neither of these variables was defined.

#Blog post link
https://rprogrammingjournalnayeliss.blogspot.com/2026/09/testing-mymean-function-i-got-error.html 

#Corrected function code

assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)
myMean <- function(assignment2) {
  return(sum(assignment2) / length(assignment2))
}
myMean(assignment2)

#Output
19.25

# Assignment #3: Analyzing 2016 data “Poll” Data in R

# Blog post link 
https://rprogrammingjournalnayeliss.blogspot.com/2026/09/abc-and-cbs-poll-results-assignment-3.html 

# R Script 
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")
ABC_poll   <- c(  4,      62,      51,    21,      2,        14,       15)
CBS_poll   <- c( 12,      75,      43,    19,      1,        21,       19)

df_polls <- data.frame(Name, ABC_poll, CBS_poll)

str(df_polls)
head(df_polls)

mean(df_polls$ABC_poll)
median(df_polls$ABC_poll)
range(df_polls$ABC_poll)
mean(df_polls$CBS_poll)
median(df_polls$CBS_poll)
range(df_polls$CBS_poll)

df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

library(ggplot2)

polls <- data.frame(
  Name = c(Name, Name),
  Poll = c(rep("ABC", 7), rep("CBS", 7)),
  Result = c(ABC_poll, CBS_poll)
)

ggplot(polls, aes(Name, Result, fill = Poll))+
  geom_col(position = "dodge")+
  labs(
    title = "ABC and CBS Poll Results",
    x = "Candidate",
    y = "Poll Results"
    )

# Assignment #4: Visualizing and Interpreting Hospital Patient Data

# Blog post link
https://rprogrammingjournalnayeliss.blogspot.com/2026/09/visualizing-and-interpreting-hospital.html

# R Script
Frequency     <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
BloodPressure <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
FirstAssess   <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)    # bad=1, good=0
SecondAssess  <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)    # low=0, high=1
FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)    # low=0, high=1

df_hosp <- data.frame(
  Frequency, BloodPressure, FirstAssess,
  SecondAssess, FinalDecision, stringsAsFactors = FALSE
)
# Inspect and handle NA:
summary(df_hosp)
df_hosp <- na.omit(df_hosp)

boxplot(
  BloodPressure ~ FirstAssess,
  data = df_hosp,
  names = c("Good","Bad"),
  ylab = "Blood Pressure",
  main = "BP by First MD Assessment"
)

boxplot(
  BloodPressure ~ SecondAssess,
  data = df_hosp,
  names = c("Low","High"),
  ylab = "Blood Pressure",
  main = "BP by Second MD Assessment"
)

boxplot(
  BloodPressure ~ FinalDecision,
  data = df_hosp,
  names = c("Low","High"),
  ylab = "Blood Pressure",
  main = "BP by Final Decision"
)

hist(
  df_hosp$Frequency,
  breaks = seq(0, 1, by = 0.1),
  xlab = "Visit Frequency",
  main = "Histogram of Visit Frequency"
)

hist(
  df_hosp$BloodPressure,
  breaks = 8,
  xlab = "Blood Pressure",
  main = "Histogram of Blood Pressure"
)


