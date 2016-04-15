                             ## Example 1

x <- runif(1000, 0, 2*pi)
y <- rnorm(1000, mean=0, sd=0.2)
z <- sin(x)+y
plot(x,z)

## Making a neural net from the data above
df <- data.frame(x,z)
head(df)
library(nnet)
n <- nnet(z~x,data=df, size=60, linout=TRUE)

## Describe n as built by nnet
str(n)

                             ## What is Machine Learning?

## Asymmetric, building model from examples, then score and classify
## Classification is assigning values to clusters
## (e.g., k-nearest neighbor)
## Demo graph using ----- mclust ----- library
## After classification, SCORING

## Printing a tracker following the x value
## The more neural nodes, the closer it would follow the sin curve

## Display the plot from nnet applied to the random numbers
points(x,n$fitted.values,col="green")

## l1 mor einfo
l1 <- lm(z~x,data=df)
points(x,l1$fitted.values,col="pink")

## Shows tracking to fifth polynomial degree of x
l5 <- lm(z~poly(x,degree=5),data=df)
points(x,l5$fitted.values,col="blue")

## Describes l5
l5

                             ## Running a Random Forest

library(randomForest)
rf <- randomForest(z~x,data=df)
str(rf)
points(x,rf$predicted,col="red")
## Madly overfitted, thanks to the beauty of random forests sticking to predicted values on an obvious curve
## Random fitting is a good way to handle breaks like years; otherwise not super useful

                             ## First experience with Big Data (PPT slide)

# Definition of the problem
# What data is needed
# What data is available
# Data extraction and transformation
# Data quality
## YES: THIS IS EXACTLY THE POINT, AND EXACTLY WHAT'S IMPORTANT

                             ## Clear everything

rm(list=ls())

                             ## Datasets to play with

# http://www.inside-r.org/howto/finding-data-internet
# http://packages.revolutionanalytics.com/datasets/
# http://blog.revolutionanalytics.com/2013/08/big-data-sets-for-r.html
# http://packages.revolutionanalytics.com/datasets/AirOnTime87to12/AirOnTime87to12.xdf

                             ## Microsoft Revolution R and Hadoop (HDFS)

# ScaleR handles breakout to Linux, HDFS, SQL, whatever
# R code remains unchanged, and options are introduced/modified through the Revolution librares and options

                             ## Playing with IRIS

# getwd()
Iris <- read.csv2("iris.csv")
library(ggplot2)
qplot(data=Iris, x=Sepal_length, y=Petal_length, color=Species)

install.packages( 
  lib  = lib <- .libPaths()[1],
  pkgs = as.data.frame(installed.packages(lib), stringsAsFactors=FALSE)$Package,
  type = 'source'
)