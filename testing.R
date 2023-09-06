library(ggplot2)

qp1 = qplot(mpg, data=mtcars, geom="density")
qp2 = qplot(mpg, data=mtcars, geom="histogram")

qp1; qp2

