# Chapter 2: Statistical Learning
## 2.1 What is Statistical Learning?

##  General libraries for loading / exploration
library(dplyr)
library(tidyr)
library(ggplot2)

### Advertising dataset
Advertising <- read.csv("Advertising.csv")
utils::View(Advertising)
qplot(data = Advertising, x = TV, y = Sales, geom=c("point", "smooth"))
qplot(data = Advertising, x = Radio, y = Sales, geom=c("point", "smooth"))
qplot(data = Advertising, x = Newspaper, y = Sales, geom=c("point", "smooth"))

lm_tv <- lm(TV ~ Sales, data = Advertising)  ##  Example linear regressions
lm_radio <- lm(Radio ~ Sales, data = Advertising)
lm_newspaper <- lm(Newspaper ~ Sales, data = Advertising)

summary(lm_tv)  ##  Multiple R-squared: 0.6119

### Income dataset
Income <- read.csv("Income2.csv")  ##  Income1.csv lacks Seniority
utils::View(Income)
qplot(data = Income, x = Education, y = Income, geom = c("point", "smooth"))
lm_education <- lm(Income ~ Education, data = Income)
lm_seniority <- lm(Income ~ Seniority, data = Income)
summary(lm_education)  ##  Multiple R-squared: 0.931
summary(lm_seniority)  ##  Multiple R-squared: 0.2686

  ## Next step: 3d plot in ggplot2
  ## On page 32