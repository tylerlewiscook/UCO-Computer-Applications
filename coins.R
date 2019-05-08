# Example ---------------------------------------------------------
#
# You have 3 quarters, 4 dimes, and 5 nickels in your pocket.
# If you randomly select 3 coins from your pocket, what is the
# average total value you end up with?

set.seed(1)

pocket <- c(rep(.25, 3), rep(.10, 4), rep(.05, 5))
value <- NULL

n.iter <- 1000

for(i in 1:n.iter){
	coins <- sample(pocket, 3, replace = FALSE)
	value[i] <- sum(coins)
}

mean(value)