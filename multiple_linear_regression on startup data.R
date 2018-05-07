# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

#Fitting Multiple Linear Regression to the training set
regressor = lm(formula = Profit ~.,
               data=training_set)

#Predicting the test set results
y_pred = predict(regressor,newdata = test_set)