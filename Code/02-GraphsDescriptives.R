# Graphs and Descriptive Statistics

#browseURL("https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-10-23")
movies <- read.csv(url("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018/2018-10-23/movie_profit.csv"), row.names = 1)

# Tables ------------------------------------------------------------------------

table(movies$genre)
table(movies$genre, movies$mpaa_rating)



# Graphs ------------------------------------------------------------------------

barplot(movies$genre)
barplot(table(movies$genre))
barplot(table(movies$genre), col = "blue")
barplot(table(movies$genre), horiz = TRUE)

counts <- table(movies$genre, movies$mpaa_rating)
barplot(counts)
barplot(counts, legend = rownames(counts))
barplot(counts, legend = rownames(counts), args.legend = list(x = "topleft"))

?legend

pie(table(movies$genre))

hist(movies$domestic_gross)
hist(movies$domestic_gross/1000000, xlab = "Domestic Gross (in millions)", 
     main = "Distribution of Domestic Gross")
hist(movies$domestic_gross/1000000, breaks = 4)
hist(movies$domestic_gross/1000000, las = 2)

movies$dg_mil <- movies$domestic_gross/1000000
movies$pb_mil <- movies$production_budget/1000000

boxplot(movies$dg_mil)
boxplot(movies$dg_mil ~ movies$genre)

plot(movies$pb_mil, movies$dg_mil)
plot(movies$pb_mil, movies$dg_mil, xlab = "Production Budget (in millions)", 
     ylab = "Domestic Gross (in millions)", pch = 2, col = "red")
plot(movies$pb_mil, movies$dg_mil, col = c("red", "blue", "green", "orange")[movies$mpaa_rating])
plot(movies$pb_mil, movies$dg_mil, pch = c(1, 5, 7, 8)[movies$mpaa_rating])



# Summary Stats -----------------------------------------------------------------

mean(movies$domestic_gross)
sd(movies$domestic_gross)
summary(movies$domestic_gross)

scale(movies$domestic_gross)

cor(movies)
cor(movies$domestic_gross, movies$production_budget)
