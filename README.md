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
