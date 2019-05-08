set.seed(101)

dice <- seq(1:6)

xbar1 <- NULL
for(i in 1:1000){
	roll <- sample(dice, 10, replace = TRUE)
	xbar1[i] <- mean(roll)
}

hist(xbar1)



xbar2 <- NULL
for(i in 1:1000){
	roll <- sample(dice, 100, replace = TRUE)
	xbar2[i] <- mean(roll)
}

hist(xbar2)

