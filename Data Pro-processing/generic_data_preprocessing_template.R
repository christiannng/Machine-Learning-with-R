#Data Preprocessing

#Import the dataset
dataset = read.csv('Data.csv')
# dataset = dataset[, 2:3]

#Splitting the dataset into the training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
##True -> training set and False -> test set
##80% for training test
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#Feature Scaling: Standardlization or Normalization
##Only scale the numberic column (factor columns are not numberic)
# training_set[, 2:3] = scale(training_set[, 2:3])
# test_set[, 2:3] = scale(test_set[, 2:3])





