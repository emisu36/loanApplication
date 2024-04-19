#### Preamble ####
# Purpose: Models the logistics regression
# Author: Ping-Jen (Emily) Su
# Date: 17 April 2024 
# Contact: emily.su@mail.utoronto.ca
# License: MIT
# Pre-requisites: Data clean and tested

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(dplyr)
library(tidyr)
library(ggplot2)
library(caret)
library(glmnet)
library(scales)
library(arrow)

#### Read data ####
# data <- read_csv("data/analysis_data/analysis_data.csv")
data <- read_parquet("data/analysis_data/analysis_data.parquet")

# Recode the action_taken variable
data$action_taken <- ifelse(data$action_taken == 1, 1, 0)

# Normalize loan_amount and income
data$loan_amount <- scale(data$loan_amount)
data$income <- scale(data$income)


# Splitting the dataset into training and testing sets
set.seed(123)  # for reproducibility
trainIndex <- createDataPartition(data$action_taken, p = .8, 
                                  list = FALSE, 
                                  times = 1)

trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Fitting the model using glm (no class weights or Lasso here to keep it simple)
fit <- glm(action_taken ~ loan_amount + income, 
           data = trainData, family = binomial())

# Summary of the model
summary(fit)

# Predicting and evaluating the model
predictions <- predict(fit, testData, type = "response")
predicted_class <- ifelse(predictions > 0.5, 1, 0)
confusionMatrix <- table(Predicted = predicted_class, Actual = testData$action_taken)
print(confusionMatrix)

# Plotting ROC Curve and Calculating AUC
library(pROC)
roc_curve <- roc(testData$action_taken, predictions)
plot(roc_curve)
auc(roc_curve)

#### Save model ####
saveRDS(
  fit,
  file = "models/first_model.rds"
)
saveRDS(
  roc_curve,
  file = "models/second_model.rds"
)


