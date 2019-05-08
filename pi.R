# Example: --------------------------------------------------------------
#
# Estimate the value of pi.

set.seed(1)

n <- 50000
x <- runif(n)
y <- runif(n)

inside <- which(sqrt(x^2 + y^2) < 1)
c <- rep("out", n)
c[inside] <- "in"
dat <- data.frame(x, y, c)

plot(dat$x, dat$y, col = c("blue", "red")[dat$c], xlab = "X", ylab = "Y")

4*length(inside)/n
