#Step 1
student6 <- read.csv(file.choose(), header = TRUE, stringsAsFactors = FALSE)

library(plyr)

gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)
gender_mean

write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)


#Step 2
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)
i_students

write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

#Step 3
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)

