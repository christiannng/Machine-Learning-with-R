#Multiple Linear Regression

#Import the dataset
dataset = read.csv('50_Startups.csv')
# dataset = dataset[, 2:3]

#Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

#Splitting the dataset into the training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
##True -> training set and False -> test set
##80% for training test
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting multiple linear regression to the training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
#The above line is equal to
regressor = lm(formula = Profit ~ .,
               data = training_set)
#Then use summary(regressor) to find PValues

#Predicting the test set results
y_pred = predict(regressor, newdata = test_set)

#Backward elimination
#Building the optimal model using backward elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset)
summary(regressor)

#Backward elimination
#Building the optimal model using backward elimination
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset)
summary(regressor)














