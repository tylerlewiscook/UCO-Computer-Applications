# Example: -------------------------------------------------------------------------------------
#
# Suppose you have a multiple choice matching question on an exam with four choices such as:
#
# Circle the capital for each state:
# Oklahoma      (a) Jefferson City (b) Austin (c) OKC (d) Topeka
# Texas         (a) Jefferson City (b) Austin (c) OKC (d) Topeka
# Missouri      (a) Jefferson City (b) Austin (c) OKC (d) Topeka
# Kansas        (a) Jefferson City (b) Austin (c) OKC (d) Topeka
#
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

