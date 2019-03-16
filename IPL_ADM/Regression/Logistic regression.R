library(dplyr)
library(e1071)
#import data from CSV
data = read.csv("D:/SEM 2/ADM/project/IPL-ADM/raghu543-ipl-data-till-2017/clean datasets/Match_Impact_Teams.csv")
str(data)

#partition
set.seed(3696)
index <- sample(1:dim(data)[1],dim(data)[1]*.75,replace=FALSE)
training  <- data[index, ]
testing  <- data[-index, ]

#Logistic Regression
#training
logistic <-glm(Win ~ TossWin+Avg_Impact_Batting+Avg_Impact_Bowling+Avg_Impact_Fielding,data=training,family="binomial")
summary(logistic)
res <- predict(logistic,newdata=training,type='response')
confusion = table(Actual_Value = training$Win,Predicted_Value = res>0.5)
#Accuracy
(confusion[[1,1]] + confusion[[2,2]]) / sum(confusion)

#testing
res_testing <- predict(logistic,newdata=testing,type='response')
confusion = table(Actual_Value = testing$Win,Predicted_Value = res_testing>0.5)
#Accuracy
(confusion[[1,1]] + confusion[[2,2]]) / sum(confusion)
