#Simple Linear Regression

#Import the dataset
dataset = read.csv('Salary_Data.csv')
# dataset = dataset[, 2:3]

#Splitting the dataset into the training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
##True -> training set and False -> test set
##80% for training test
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting simple linear regression to the training set
#summary(regressor) -> *** means strong relationship between them
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

#Visualising the training set results
#install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Trainging set)') +
  xlab('Years of experience') +
  ylab('Salary')

#Visualising the Test set results
#install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')











