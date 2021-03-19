# Random Variables

# Probabilities --------------------------------------------
dnorm(0)            # Density values: p(x) = P(X = x) for disc or f(x) for cont

pnorm(0)            # Distribution values: F(x) = P(x <= x)

qnorm(0.5)          # Quantile values 



# Random number generation --------------------------------
set.seed(1)

rnorm(10)           
rnorm(10, 50, 5)



# Examples from slides ------------------------------------
dbinom(6, 19, 0.504)
pbinom(6, 19, 0.504)

dpois(10, 9)

1 - pnorm(240, 170, 30)
pnorm(240, 170, 30, lower.tail = FALSE)
pnorm(180, 170, 30) - pnorm(140, 170, 30)
qnorm(.9, 170, 30)
qnorm(.1, 170, 30, lower.tail = FALSE)

