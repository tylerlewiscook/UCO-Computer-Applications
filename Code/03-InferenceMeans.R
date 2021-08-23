# Inference for means

# One sample ------------------------------------------------------------------------

t <- (3 - 1.5)/(2/sqrt(16))
pt(t, 15, lower.tail = FALSE)


t.test(airquality$Temp, mu = 75)
out1 <- t.test(airquality$Temp, mu = 75)

names(out1)
out1$statistic
out1$p.value
out1$conf.int

dim(airquality)
2*pt(out1$statistic, 152, lower.tail = FALSE)


out2 <- t.test(airquality$Temp, mu = 79, alternative = "less")
pt(out2$statistic, 152)



# Two sample ------------------------------------------------------------------------

library(ISLR)
data(College)

# Independent
t.test(Accept ~ Private, data = College)
t.test(Accept ~ Private, var.equal = TRUE, data = College)

aggregate(Accept ~ Private, data = College, mean)
mean_public <- aggregate(Accept ~ Private, data = College, mean)[1,2]
mean_private <- aggregate(Accept ~ Private, data = College, mean)[2,2]

aggregate(Accept ~ Private, data = College, var)
var_public <- aggregate(Accept ~ Private, data = College, var)[1,2]
var_private <- aggregate(Accept ~ Private, data = College, var)[2,2]

n_public <- as.numeric(table(College$Private)[1])
n_private <- as.numeric(table(College$Private)[2])

t <- (mean_public - mean_private)/sqrt(var_public/n_public + var_private/n_private)
t


# Paired
before <- c(180, 195, 235, 250, 210, 300)
after <- c(178, 196, 232, 242, 214, 298)
dif <- before - after
t.test(dif)

wt <- data.frame(before, after)
t.test(before, after, paired = TRUE, data = wt)



# ANOVA ----------------------------------------------------------------------------

doughnut <- read.csv(file = "Data/doughnut.csv")

out3 <- aov(fat ~ oil, data = doughnut)
summary(out3)

doughnut$oil <- as.factor(doughnut$oil)
out4 <- aov(fat ~ oil, data = doughnut)
summary(out4)


# Multiple comparisons
TukeyHSD(out4)


# Diagnostics
par(mfrow = c(2,2))
plot(out4)

library(car)
leveneTest(fat ~ oil, data = doughnut)
qqPlot(fat ~ oil, data = doughnut)

par(mfrow = c(1,1))
