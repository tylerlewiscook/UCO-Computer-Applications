# Simulations

movies <- read.csv(url("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-10-23/movie_profit.csv"), row.names = 1)

# If/else ---------------------------------------------------------------------------------------

x <- 2
#x <- 3
#x <- 4

if(x == 2){
  print("x is 2")
} else{
  print("x is not 2")
}


if(x == 2){
  print("x is 2")
} else if(x == 3){
  print("x is 3")
} else{
  print("x is not 2 or 3")
}



if(x %% 2 == 0){
  print("x is divisible by 2")
  divis <- "yes"
} else{
  print("x is not divisible by 2")
  divis <- "no"
}


divis <- ifelse(x %% 2 == 0, "yes", "no")


movies$success <- ifelse(movies$worldwide_gross > median(movies$worldwide_gross), 1, 0)



# For loops -------------------------------------------------------------------------------------

x <- seq(1,10)

for(i in 1:10){
  mult2 <- x[i]*2
}
mult2

for(i in 1:10){
  mult2[i] <- x[i]*2
}
mult2

for(i in 1:10){
  mult3[i] <- x[i]*3
}

mult3 <- NULL
for(i in 1:length(x)){
  mult3[i] <- x[i]*3
}
mult3

for(i in 1:50){
  if(movies$success[i] == 1){
    print("movie was a success")
  } else{
    print("movie was not a success")
  }
}

dim(movies)
dim(movies)[1]



# CLT -------------------------------------------------------------------------------------------

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



# Pi --------------------------------------------------------------------------------------------

set.seed(1)

n <- 100
x <- runif(n)
y <- runif(n)

inside <- which(sqrt(x^2 + y^2) < 1)
c <- rep("out", n)
c[inside] <- "in"
dat <- data.frame(x, y, c)

plot(dat$x, dat$y, col = c("blue", "red")[dat$c])

4*length(inside)/n



# Probability -----------------------------------------------------------------------------------

# You are dealt 2 cards from a standard deck of 52 cards.
#
# What is the probability both are diamonds?
# What is the probability at least one is a diamond?

set.seed(1)

deck <- c(rep("H", 13), rep("S", 13), rep("C", 13), rep("D", 13))
both.diamond <- NULL
alo.diamond <- NULL

n.iter <- 10000

for(i in 1:n.iter){
  draw <- sample(deck, 2, replace = FALSE)
  both.diamond[i] <- ifelse(draw[1] == "D" & draw[2] == "D", 1, 0)
  alo.diamond[i] <- ifelse(draw[1] == "D" | draw[2] == "D", 1, 0)
}

sum(both.diamond)/n.iter
sum(alo.diamond)/n.iter

dhyper(2, 13, 39, 2)
1 - dhyper(0, 13, 39, 2)

# Confidence interval ---------------------------------------------------------------------------

x <- seq(.01, 5, .01)
pdfx <- dexp(x, 5)

plot(x, pdfx, type = "l")

set.seed(1)

correct <- NULL
n.iter <- 1000 	
n <- 25 		

for(i in 1:n.iter){
  x <- rexp(n, 5)
  ci <- t.test(x)
  correct[i] <- ifelse(ci$conf.int[1] < .2 & ci$conf.int[2] > .2, 1, 0)
}

sum(correct)/n.iter



# Multiple choice probability -------------------------------------------------------------------

# Suppose you have a multiple choice matching question on an exam with four choices such as:
#
# Circle the capital for each state:
# Oklahoma      (a) Jefferson City (b) Austin (c) OKC (d) Topeka
# Texas         (a) Jefferson City (b) Austin (c) OKC (d) Topeka
# Missouri      (a) Jefferson City (b) Austin (c) OKC (d) Topeka
# Kansas        (a) Jefferson City (b) Austin (c) OKC (d) Topeka
#
# What is the probability of getting all four captials correct by randomly guessing?
# What is the probability of getting each individual captial correct by randomly guessing?
# You may assume capitals cannot be selected more than once and that questions are done in order.

set.seed(1)

caps <- c(1:4)
all.correct <- NULL
first.correct <- NULL
second.correct <- NULL
third.correct <- NULL
fourth.correct <- NULL

n.iter <- 1000000

for(i in 1:n.iter){
  guess1 <- sample(caps, 1)
  guess2 <- sample(caps[-guess1], 1)
  guess3 <- sample(caps[-c(guess1, guess2)], 1)
  guess4 <- caps[-c(guess1, guess2, guess3)]
  
  all.correct[i]    <- ifelse(guess1 == 1 & guess2 == 2 & guess3 == 3 & guess4 == 4, 1, 0)
  first.correct[i]  <- ifelse(guess1 == 1, 1, 0)
  second.correct[i] <- ifelse(guess2 == 2, 1, 0)
  third.correct[i]  <- ifelse(guess3 == 3, 1, 0)
  fourth.correct[i] <- ifelse(guess4 == 4, 1, 0)
}

sum(all.correct)/n.iter
sum(first.correct)/n.iter
sum(second.correct)/n.iter
sum(third.correct)/n.iter
sum(fourth.correct)/n.iter
