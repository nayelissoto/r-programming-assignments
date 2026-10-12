data("mtcars")
head(mtcars)
str(mtcars)

summary(mtcars)
plot(mtcars$wt, mtcars$mpg)

s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"

setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)

print.student_s3 <- function(x) {
  cat("Student:", x$name, "\n")
}
print(s3_obj)

setMethod("show", "student_s4",
          function(object){
            cat("Student:", object@name, "\n")
          })
print(s4_obj)

