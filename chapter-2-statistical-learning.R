# Chapter 2: Statistical Learning
## 2.1 What is Statistical Learning?

##  General libraries for loading / exploration
library(dplyr)
library(tidyr)
library(ggplot2)

### Advertising dataset
setwd("C:/Users/rnelson020/Documents/GitHub/introduction-statistical-learning/datasets/")
Advertising <- read.csv("Advertising.csv")
utils::View(Advertising)
qplot(data = Advertising, x = TV, y = Sales, geom=c("point", "smooth"))
qplot(data = Advertising, x = Radio, y = Sales, geom=c("point", "smooth"))
qplot(data = Advertising, x = Newspaper, y = Sales, geom=c("point", "smooth"))

lm_tv <- lm(TV ~ Sales, data = Advertising)  ##  Example linear regressions
lm_radio <- lm(Radio ~ Sales, data = Advertising)
lm_newspaper <- lm(Newspaper ~ Sales, data = Advertising)

summary(lm_tv) # Multiple R-squared: 0.6119
summary(lm_radio) # Multiple R-squared: 0.332
summary(lm_newspaper) # Multiple R-squared: 0.05212

### Income dataset
Income <- read.csv("Income2.csv")  ##  Income1.csv lacks Seniority
utils::View(Income)
qplot(data = Income, x = Education, y = Income, geom = c("point", "smooth"))
lm_education <- lm(Income ~ Education, data = Income)
lm_seniority <- lm(Income ~ Seniority, data = Income)
summary(lm_education)  ##  Multiple R-squared: 0.931
summary(lm_seniority)  ##  Multiple R-squared: 0.2686
 # Apparently education makes a huge difference, and seniority not

### Page 20: Which media contribute to sales?
### Which media generate the biggest boost in sales? or
### How much increase in sales is associated with a given
  ### increase in TV advertising?
str(Advertising) # Needs gathering
Advertising_long <- tidyr::gather(Advertising, Category, Budget, TV:Newspaper)
qplot(data=Advertising_long, x=Budget, y=Sales,
      color=Category, geom=c("point", "smooth"))
 # Answer: from R-squared above, DEFINITELY TV.
 # Radio has lower R^2, but smoothed line shows steep correlation


 # Quantitative vs qualitative (i.e., categorical)
 ## Quantitative response: regression problems
 ## Qualitative response: classification problems
 ### (K-nearest neighbors & boosting can do both)
