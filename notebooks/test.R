install.packages("packrat")

#install.packages("plumber")
library(plumber)

#packrat::snapshot()

mean_hp <- mean(mtcars$hp)
print(mean_hp)
