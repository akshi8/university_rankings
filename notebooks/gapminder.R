#intstall_packages("plumber")
library(plumber)
library(gapminder)
mean_pop <- mean(gapminder$pop)
print(mean_pop)

