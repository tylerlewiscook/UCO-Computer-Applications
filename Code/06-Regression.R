# Regression

# Simple linear regression -----------------------------------------------------------------

library(MASS)
data(forbes)

plot(forbes$pres, forbes$bp)

fit <- lm(bp ~ pres, data = forbes)
summary(fit)
abline(fit, lwd = 2)

predict(fit)
predict(fit, data.frame(pres = 25))
predict(fit, data.frame(pres = 25), interval = "prediction", level = 0.9)
predict(fit, data.frame(pres = c(25, 26, 27)))

confint(fit, level = 0.9)

par(mfrow = c(2,2))
plot(fit)
par(mfrow = c(1,1))



# Multiple linear regression -----------------------------------------------------------------

fit2 <- lm(bp ~ poly(pres, 2, raw = TRUE), data = forbes)
summary(fit2)
newdat <- data.frame(pres = seq(20, 30))
pred <- predict(fit2, newdat)
lines(newdat$pres, pred, col = "blue", lwd = 2)


internet <- read.csv(file = "Data/internet.csv")

pairs(internet)
internet$gender <- as.factor(internet$gender)
internet$employ <- as.factor(internet$employ)

fit3 <- lm(data ~ ., data = internet)
summary(fit3)


fit4 <- lm(data ~ speed + age + gender, data = internet)
summary(fit4)
speed <- c(20, 30, 10)
age <- c(32, 19, 24)
gender <- as.factor(c(1, 1, 0))
newdat4 <- data.frame(speed, age, gender)
predict(fit4, newdat4)

fit5 <- lm(data ~ speed + gender + speed:gender, data = internet)
summary(fit5)

fit6 <- lm(data ~ speed*gender, data = internet)
summary(fit6)
