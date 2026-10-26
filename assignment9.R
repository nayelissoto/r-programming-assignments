data("mtcars")
head(mtcars)

# Scatter plot
plot(mtcars$wt, mtcars$mpg,
     main   = "Car Weight vs. MPG",
     xlab   = "Weight (1000 lbs)",
     ylab   = "Miles Per Gallon")

# Histogram
hist(mtcars$mpg,
     main   = "Distribution of MPG",
     xlab   = "Miles Per Gallon")

library(lattice)

# Conditional scatter plot (small multiples)
xyplot(mpg ~ wt | factor(cyl),
       data = mtcars,
       main = "Car Weight vs. MPG by Cylinders",
       xlab = "Weight (1000 lbs)",
       ylab = "Miles Per Gallon")

# Box-and-whisker plot
bwplot(mpg ~ factor(cyl),
       data = mtcars,
       main = "MPG by Number of Cylinders",
       ylab = "Miles Per Gallon")

library(ggplot2)

# Scatter plot with smoothing
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "Car Weight vs. MPG by Cylinders",
       x = "Weight (1000 lbs)",
       y = "Miles Per Gallon",
       color = "Cylinders")

# Faceted histogram
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 5) +
  facet_wrap(~ cyl) +
  labs(title = "Distribution of MPG by Cylinders",
       x = "Miles Per Gallon",
       y = "Number of Cars")