# Importing the dataset
dataset = read.csv('cpm_data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Encoding categorical data
dataset$u_keyboard = factor(dataset$u_keyboard,
                       levels = c('sparsh', 'swiftkey', 'swc','cdac'),
                       labels = c(1, 2, 3, 4))

#Fitting Multiple Linear Regression to the training set only session number and keyboard
regressor = lm(formula = avgcpm ~ session + u_keyboard,
               data=training_set)

#Fitting Multiple Linear Regression to the training set on session number
regressor = lm(formula = avgcpm ~ session,
               data=training_set)



#Predicting the test set results
y_pred = predict(regressor,newdata = test_set)