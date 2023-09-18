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

library(ISLR2)
data(College)

# Independent
t.test(Accept ~ Private, data = College)
t.test(Accept ~ Private, var.equal = TRUE, data = College)

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
plot(TukeyHSD(out4))

# Diagnostics
par(mfrow = c(2,2))
plot(out4)
par(mfrow = c(1,1))

library(car)
leveneTest(fat ~ oil, data = doughnut)  # center = mean/median
qqPlot(fat ~ oil, data = doughnut)

qqnorm(doughnut$fat)
shapiro.test(doughnut$fat)





