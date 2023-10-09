# Chi-square tests

# Goodness of fit ------------------------------------------------------------------------

peas <- c(315, 108, 102, 31)
chisq.test(peas, p = c(9/16, 3/16, 3/16, 1/16))

library(MASS)

chisq.test(table(Cars93$AirBags))



# Contingency tables ---------------------------------------------------------------------

titanic <- matrix(c(202, 118, 178, 212, 123, 167, 528, 696), nrow = 4, ncol = 2)
chisq.test(titanic)

chisq.test(table(Cars93$Man.trans.avail, Cars93$Origin), correct = FALSE)
chisq.test(Cars93$Man.trans.avail, Cars93$Origin, correct = FALSE)
