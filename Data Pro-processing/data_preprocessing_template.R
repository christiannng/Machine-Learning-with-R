#Data Preprocessing

#Import the dataset
dataset = read.csv('Data.csv')

#Taking care of missing data
dataset$Age = ifelse(is.na(dataset$Age), 
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary), 
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)

#Encoding categorical data
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'),
                         labels = c(0, 1))

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
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])





